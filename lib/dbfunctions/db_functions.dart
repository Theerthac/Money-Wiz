

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project/model/add_data.dart';


ValueNotifier<List<add_data>> addListNotifier = ValueNotifier([]);

Future<void> addmoney(add_data value) async {
  final adddb = await Hive.openBox<add_data>("data");
  final id = await adddb.add(value);
  value.id = id;

  await adddb.add(value);
  addListNotifier.value.add(value);
  addListNotifier.notifyListeners();
}

Future<void> getalldata() async {
  final adddB = await Hive.openBox<add_data>("data");
  addListNotifier.value.clear();
  addListNotifier.value.addAll(adddB.values);
  addListNotifier.notifyListeners();
}

Future<void> deletedata(index) async {
  final adddDB = await Hive.openBox<add_data>("data");
  await adddDB.deleteAt(index);
  getalldata();
}

Future<void> editdata(index, add_data value) async {
  final adddb = await Hive.openBox<add_data>('data');
  addListNotifier.value.clear();
  addListNotifier.value.addAll(adddb.values);
  addListNotifier.notifyListeners();

  adddb.putAt(index, value);
  getalldata();
}
