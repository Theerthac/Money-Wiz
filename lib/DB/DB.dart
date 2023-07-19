import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project/model/add_data.dart';

ValueNotifier<List<add_data>> AddListNotifier = ValueNotifier([]);

Future<void> AdddMoney(add_data value) async {
  final AddDB = await Hive.openBox<add_data>('Add_db');
  final id = await AddDB.add(value);
  value.id = id;
   //getAllData();

  AddListNotifier.value.add(value);
  AddListNotifier.notifyListeners();
}

Future<void> getAllData() async {
  final AddDB = await Hive.openBox<add_data>('Add_db');
  AddListNotifier.value.clear();

  AddListNotifier.value.addAll(AddDB.values);
  AddListNotifier.notifyListeners();
}

Future<void> deleteList(int id) async {
  final AddDB = await Hive.openBox<add_data>('Add_db');
  await AddDB.delete(id);
  getAllData();
}


