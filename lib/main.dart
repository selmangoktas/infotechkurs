import 'package:flutter/material.dart';

import 'ders8/filmOdevi/film-list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilmViewBuilder(),
    );
  }
}
