import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infotechkurs/ders8/villa-model.dart';

class WebApiView extends StatefulWidget {
  @override
  _WebApiViewState createState() => _WebApiViewState();
}

class _WebApiViewState extends State<WebApiView> {
  List<VillaModel> aList = []; // List<VillaModel>();

  getData() async {
    Uri url = Uri.parse('https://villafavori.com/api/superclassified');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var list = json.decode(response.body);
      setState(() {
        for (var album in list[0]['superclassified'][0]) {
          aList.add(VillaModel.fromJson(album));
        }
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Api Örnekleri'),
      ),
      body: ListView.builder(
        itemCount: aList.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * .2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    aList[index].title,
                    style: TextStyle(
                      color: Colors.white,
                      wordSpacing: 0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://villafavori.com/' + aList[index].image,
                  ),
                  fit: BoxFit.cover,
                ),
              ));
        },
      ),
    );
  }
}
