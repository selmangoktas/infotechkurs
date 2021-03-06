import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infotechkurs/ders8/filmOdevi/film-detail-view.dart';
import 'film-model.dart';
import 'func.dart';

class FilmViewBuilder extends StatefulWidget {
  @override
  _FilmViewBuilderState createState() => _FilmViewBuilderState();
}

class _FilmViewBuilderState extends State<FilmViewBuilder> {
  List<FilmModel> flist = [];

//FilmModel.fromJson(json);

  Future<List<FilmModel>> getState() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/tv/airing_today?api_key=79f9638dc1bcf9a4e5a09db68640db20&language=tr-TR&page=1');
    final responpe = await http.get(url);

    if (responpe.statusCode == 200) {
      var decode = json.decode(responpe.body);
      var filmList = decode['results'];
      for (var item in filmList) {
        flist.add(FilmModel.fromJson(item));
      }
      //return FilmModel.fromJson(filmList);
      return flist;
    } else
      throw Exception('Failed to load post');
  }

  /*@override
  void initState() {
    getState();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    var ekranW = MediaQuery.of(context).size.width;
    var ekranH = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: buildDrawerContainer(ekranW, flist),

      appBar: buildPurpleAppBar(),
      // drawer: Drawer(),
      body: Container(
        child: FutureBuilder(
          future: getState(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Loading...'),
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                //itemCount: snapshot.data.len,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      final snackBar = SnackBar(
                        content: Text(flist[index].name + ' filmine git'),
                        action: SnackBarAction(
                          label: '??leri',
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return new FilmDetailView(
                                  filmId: flist[index].id,
                                );
                              },
                            ));
                          },
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            width: ekranW,
                            height: index == 3 ? ekranH : ekranH * .3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  index == 3
                                      ? Radius.circular(25)
                                      : Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/original' +
                                        snapshot.data[index].posterPath,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            margin: index == 3
                                ? EdgeInsets.only(bottom: 30, right: 10)
                                : EdgeInsets.all(15),
                            child: Text(
                              snapshot.data[index].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                decorationColor: Colors.pink,
                                decorationStyle: TextDecorationStyle.solid,
                                backgroundColor: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
