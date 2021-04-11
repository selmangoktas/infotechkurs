import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumModel {
  var albumId;
  var id;
  var title;
  var imageUrl;
  var thumbnailUrl;

  AlbumModel({
    this.albumId,
    this.id,
    this.title,
    this.imageUrl,
    this.thumbnailUrl,
  });

  AlbumModel.fromJson(json) {
    this.albumId = json['albumId'];
    this.id = json['id'];
    this.title = json['title'];
    this.imageUrl = json['url'];
    this.thumbnailUrl = json['thumbnailUrl'];
  }
}

class WebApiView extends StatefulWidget {
  @override
  _WebApiViewState createState() => _WebApiViewState();
}

class _WebApiViewState extends State<WebApiView> {
  AlbumModel a = AlbumModel();
  List<AlbumModel> aList = List<AlbumModel>();

  getData() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/photos');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var list = json.decode(response.body);
      setState(() {
        for (var album in list) {
          aList.add(AlbumModel.fromJson(album));
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
                    aList[index].thumbnailUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ));
        },
      ),
    );
  }
}
