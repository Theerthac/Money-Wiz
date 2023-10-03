// ignore_for_file: must_be_immutable, 

import 'package:flutter/material.dart';
import 'package:project/view/satisticScreen/satisticScreen.dart';
import '../view/addScreen/addscreen.dart';
import '../view/homeScreen/homeScreen.dart';
import '../view/settingScreen/settings.dart';
import '../view/transactionScreen/transactionScreen.dart';


class Bottom extends StatefulWidget {
  String username;
  
  Bottom({ super.key, required this.username});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int indexColor = 0;
 
 late List screens =  [Home(username:widget.username,), Transaction(username: widget.username), 
  Statistics(username: widget.username), Settings(username: widget.username,)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexColor],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Add(
              username: widget.username,
            ),
          ));
        },
        backgroundColor: const Color(0xFFFDC603),
       
        child:  const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColor = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 35,
                  color: indexColor == 0 ? Colors.black : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColor = 1;
                  });
                },
                child: Icon(
                  Icons.history,
                  size: 35,
                  color: indexColor == 1 ? Colors.black : Colors.grey,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColor = 2;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 35,
                  color: indexColor == 2 ? Colors.black : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColor = 3;
                  });
                },
                child: Icon(
                  Icons.settings,
                  size: 35,
                  color: indexColor == 3 ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
