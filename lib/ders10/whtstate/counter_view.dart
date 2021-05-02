import 'package:flutter/material.dart';
import 'package:infotechkurs/ders10/whtstate/floating_widget.dart';

class MyStateHomePage extends StatefulWidget {
  @override
  _MyStateHomePageState createState() => _MyStateHomePageState();
}

class _MyStateHomePageState extends State<MyStateHomePage> {
  var _counter;
  // ignore: unused_element
  void _intsubCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(''),
      floatingActionButton: FloatingWidget(
        counter: _counter,
      ),
    );
  }
}
