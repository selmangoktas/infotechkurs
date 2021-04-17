import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infotechkurs/ders8/filmOdevi/func.dart';

import 'film-detail-model.dart';

class FilmDetailView extends StatefulWidget {
  final filmId;

  const FilmDetailView({Key key, this.filmId}) : super(key: key);

  @override
  _FilmDetailViewState createState() => _FilmDetailViewState();
}

class _FilmDetailViewState extends State<FilmDetailView> {
  FilmDetail filmDetail;

  Future<FilmDetail> getfilmDetail() async {
//399566
    String url =
        'https://api.themoviedb.org/3/movie/${widget.filmId}?api_key=79f9638dc1bcf9a4e5a09db68640db20&language=tr-TR';
    Uri dUrl = Uri.parse(url);
    final response = await http.get(dUrl);
    if (response.statusCode == 200) {
      var decode = json.decode(response.body);

      filmDetail = FilmDetail.fromJson(decode);
      if (filmDetail.posterPath == null)
        filmDetail.posterPath = "/3Xg7SoZn6jbyRT4vjBav9t8vxf5.jpg";
      //return FilmModel.fromJson(filmList);
      return filmDetail;
    } else
      throw Exception('Failed to load post');
  }

  /*@override
  void initState() {
    getfilmDetail();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    var ekranW = MediaQuery.of(context).size.width;
    var ekranH = MediaQuery.of(context).size.height;

    // print(filmDetail.posterPath);
    return Scaffold(
      appBar: buildPurpleAppBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(5),
          width: ekranW,
          height: ekranH,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              image: new DecorationImage(
                image: filmDetail.posterPath != null
                    ? NetworkImage(
                        'https://image.tmdb.org/t/p/original/' +
                            filmDetail.posterPath,
                      )
                    : NetworkImage(
                        'https://image.tmdb.org/t/p/original/3Xg7SoZn6jbyRT4vjBav9t8vxf5.jpg',
                      ),
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
