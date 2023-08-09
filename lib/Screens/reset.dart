
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project/Screens/login.dart';
import 'package:project/model/add_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

resetApp(BuildContext context) {
    showDialog( 
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: const Text(
              'Do you want to Reset the app?',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            actions: [
              TextButton(
                  onPressed: (() async {
                    Navigator.of(context).pop();

                    
                        final box = Hive.box<add_data>('data');

                    box.clear();
                  clearSharedPreferences(ctx);
                    
                  
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>  Login(),
                      ),
                    );
                    

            
                  }),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )),
              TextButton(
                onPressed: (() {
                  Navigator.of(context).pop();
                }),
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          );
        });
  }

  void clearSharedPreferences(BuildContext ctx) async {
  final sharedPref = await SharedPreferences.getInstance();
  sharedPref.clear();
}