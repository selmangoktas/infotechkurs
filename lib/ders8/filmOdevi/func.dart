import 'package:flutter/material.dart';

import 'film-model.dart';

Container buildDrawerContainer(double ekranW, List<FilmModel> flist) {
  return Container(
    width: ekranW * .7,
    color: Colors.white,
    child: Drawer(
      child: Container(
        child: ListView.builder(
          itemCount: flist.length,
          itemBuilder: (context, index) {
            return index == 0
                ? Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Trending Films List',
                      style: TextStyle(
                        color: Colors.purple[700],
                        fontSize: 20,
                        decorationColor: Colors.pink,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
  );
}

AppBar buildPurpleAppBar() {
  return AppBar(
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
  );
}
