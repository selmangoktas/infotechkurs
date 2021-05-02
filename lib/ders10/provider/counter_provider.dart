import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;
  get arttir async {
    _count++;
    notifyListeners();
  }
}
