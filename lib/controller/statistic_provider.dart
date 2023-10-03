import 'package:flutter/material.dart';

class StatisticsProvider extends ChangeNotifier {
  int _indexColor = 0;

  int get indexColor => _indexColor;

  set indexColor(int newIndex) {
    _indexColor = newIndex;
    notifyListeners();
  }
}



