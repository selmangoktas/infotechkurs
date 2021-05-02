import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FloatingWidget extends StatefulWidget {
  var counter;

  FloatingWidget({Key key, this.counter}) : super(key: key);

  @override
  _FloatingWidgetState createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          widget.counter++;
        });
      },
    );
  }
}
