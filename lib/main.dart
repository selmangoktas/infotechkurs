import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ders8/filmOdevi/film-list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.purple[700], // navigation bar color
        statusBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.purple[700] // status bar color
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilmViewBuilder(),
    );
  }
}
