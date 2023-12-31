import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project/model/add_data.dart';

const transactionDbName = 'data';

class DbfunctionProvider extends ChangeNotifier {
  List<add_data> transactionList = [];
  List<add_data> chartList = [];

  Future<void> addmoney(add_data value) async {
    final addlistDb = await Hive.openBox<add_data>(transactionDbName);
    await addlistDb.put(value.id, value);
  
    getalldata();
    notifyListeners();
  }


  Future<void> getalldata() async {
    final addlistDb = await Hive.openBox<add_data>(transactionDbName);
    transactionList.clear();
    transactionList.addAll(addlistDb.values);
    notifyListeners();
  }

  Future<void> deletedata(index) async {
    final addlistDb = await Hive.openBox<add_data>(transactionDbName);
    await addlistDb.deleteAt(index);
    notifyListeners();
    getalldata();
  }

  // Future<void> editdata(index, add_data value) async {
  //   final addlistDb = await Hive.openBox<add_data>(transactionDbName);
  //   transactionList.clear();
  //   transactionList.addAll(addlistDb.values);
  //   addlistDb.putAt(index,value);
  //   notifyListeners();
  //   getalldata();

  // }
  Future<void> editData(add_data update) async {
    final addlistDb = await Hive.openBox<add_data>(transactionDbName);
    addlistDb.put(update.id, update);
   
    notifyListeners();
    getalldata();
  }
}
