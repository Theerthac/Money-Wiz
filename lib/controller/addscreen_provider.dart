import 'package:flutter/material.dart';


class AddScreenProvider extends ChangeNotifier  {
  String? selecteditems;
  DateTime date = DateTime.now();

  void changeselecteditemvalue(String? value) {
    selecteditems = value;
    notifyListeners();
  }

  void changeDatevalue(DateTime value) {
    date = value;
    notifyListeners();
  }

  void resetselecteditems() {
    selecteditems = null;
    notifyListeners();
  }

  void resetdate() {
    date = DateTime.now();
    notifyListeners();
  }
}
