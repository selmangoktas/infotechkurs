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
  AlbumModel newAlbum = AlbumModel();

  getData() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/photos');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var list = json.decode(response.body);
      setState(() {
        newAlbum = AlbumModel.fromJson(list[0]);
        newAlbum.title = list[0]['title'];
        newAlbum.thumbnailUrl = list[0]['thumbnailUrl'];
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
      body: Center(
        child: Container(
          child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .5,
              child: Center(
                child: Text(
                  newAlbum.title,
                  style: TextStyle(
                    color: Colors.white,
                    wordSpacing: 1,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    newAlbum.thumbnailUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ),
    );
  }
}
