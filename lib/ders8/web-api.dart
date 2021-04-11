import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WebApiView extends StatefulWidget {
  @override
  _WebApiViewState createState() => _WebApiViewState();
}

class _WebApiViewState extends State<WebApiView> {
  var title;
  var urlImage;

  getData() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/photos');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var list = json.decode(response.body);
      setState(() {
        title = list[0]['title'];
        urlImage = list[0]['thumbnailUrl'];
      });
    }
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Api Örnekleri'),
      ),
      body: Center(
        child: Container(
          child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .5,
              child: Center(
                child: Text(
                  '$title',
                  style: TextStyle(
                    color: Colors.white,
                    wordSpacing: 1,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    urlImage,
                  ),
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ),
    );
  }
}
