import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project/model/add_data.dart';

// ValueNotifier<List<add_data>> addListNotifier = ValueNotifier([]);

// Future<void> addMoney(add_data value) async {
//   final addDB = await Hive.openBox<add_data>('add_db');
//   final _id = await addDB.add(value);
//   value.id = _id;

//   addListNotifier.value.add(value);
//   addListNotifier.notifyListeners();

// }

// Future<void> getAllData() async {
//   final addDB = await Hive.openBox<add_data>('add_db');
//   addListNotifier.value.clear();

//   addListNotifier.value.addAll(addDB.values);
//   addListNotifier.notifyListeners();
// }

// Future<void> deleteList(int id) async {
//   final addDB = await Hive.openBox<add_data>('add_db');
//   await addDB.delete(id);
//    getAllData();
// }



ValueNotifier<List<add_data>> addListNotifier = ValueNotifier([]);

Future<void> addMoney(add_data value) async {
  final adddDB = await Hive.openBox<add_data>("add_db");
  await adddDB.add(value);
  addListNotifier.value.add(value);
  addListNotifier.notifyListeners();
}

Future<void> getAlldata() async {
  final adddDB = await Hive.openBox<add_data>("add_db");
  addListNotifier.value.clear();
  addListNotifier.value.addAll(adddDB.values);
  addListNotifier.notifyListeners();
}




