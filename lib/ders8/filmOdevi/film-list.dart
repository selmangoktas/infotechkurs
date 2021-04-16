import 'dart:convert';
import 'package:flutter/material.dart';
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

  /* @override
  void initState() {
    getState();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    var ekranW = MediaQuery.of(context).size.width;
    var ekranH = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Container(
        width: ekranW * .7,
        color: Colors.white,
        child: Drawer(
          child: Container(
            child: ListView.builder(
              itemCount: flist.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index == 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text(
                                    'Trending Films List',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      decorationColor: Colors.pink,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text(
                                    flist[index].name,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      decorationColor: Colors.pink,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                    ),
                                  ),
                                ),
                              ])
                        : Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              flist[index].name,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                decorationColor: Colors.pink,
                                decorationStyle: TextDecorationStyle.solid,
                              ),
                            ),
                          ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ),
      ),

      appBar: AppBar(
        title: Row(
          children: [
            /* Icon(
              Icons.menu,
              color: Colors.purple[700],
            ),*/
            SizedBox(
              width: 30,
            ),
            Text(
              "Trend Films",
              style: TextStyle(
                color: Colors.purple[700],
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.purple[700],
        ),
        backgroundColor: Colors.white,
      ),
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
                    onTap: () {},
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
                                      ? Radius.circular(50)
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
