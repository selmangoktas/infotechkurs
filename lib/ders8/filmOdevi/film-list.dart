import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'film-model.dart';

class FilmViewBuilder extends StatefulWidget {
  @override
  _FilmViewBuilderState createState() => _FilmViewBuilderState();
}

class _FilmViewBuilderState extends State<FilmViewBuilder> {
  List<FilmModel> flist = [];

//FilmModel.fromJson(json);

  getState() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/tv/airing_today?api_key=79f9638dc1bcf9a4e5a09db68640db20&language=tr-TR&page=1');
    var responpe = await http.get(url);
    var decode = json.decode(responpe.body);
    var filmList = decode['results'];
    for (var item in filmList) {
      flist.add(FilmModel.fromJson(item));
    }
  }

  @override
  void initState() {
    getState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ekranW = MediaQuery.of(context).size.width;
    var ekranH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer: Container(
        child: Text(''),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: flist.length,
        itemBuilder: (BuildContext context, int index) => new Column(
          children: [
            new Container(
              padding: EdgeInsets.all(5),
              width: ekranW,
              height: index * 2 / 2 == index ? ekranH * 0.5 : ekranH * 0.3,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Image.network(
                  'https://image.tmdb.org/t/p/original' +
                      flist[index].posterPath,
                ),
              ),
            ),
            Container(
              child: Text(
                flist[index].name,
                style: TextStyle(
                  color: Colors.deepPurple[300],
                ),
              ),
            ),
          ],
        ),
        staggeredTileBuilder: (index) => new StaggeredTile.count(
            index != 0 ? 2 : 4, index * 2 / 2 != index ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
