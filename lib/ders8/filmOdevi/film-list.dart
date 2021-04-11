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
        // shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 4,
        itemCount: flist.length,
        itemBuilder: (BuildContext context, int index) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 5, right: 5, top: index * 2 / 2 == index ? 5 : 10),
              padding: EdgeInsets.all(50),
              width: ekranW * 0.5,
              height: index * 2 / 2 == index ? ekranH * .2 : ekranH * .1,
              // MediaQuery.of(context).size.height * 0.2,
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
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/original/' +
                      flist[index].posterPath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(''),
            ),
            Container(
              child: Text(
                flist[index].name,
                style: TextStyle(
                  color: Colors.deepPurple[300],
                ),
              ),
            )
          ],
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}
