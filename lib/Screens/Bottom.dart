import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/Screens/Add.dart';
import 'package:project/Screens/Home.dart';
import 'package:project/Screens/Statistics.dart';
import 'package:project/Screens/Transaction.dart';
import 'package:project/Screens/settings.dart';

class Bottom extends StatefulWidget {
  String username;
  
  Bottom({ super.key, required this.username});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color = 0;
 
 late List Screens =  [Home(username:widget.username,), Transaction(username: widget.username), 
  Statistics(username: widget.username,), Settings(username: widget.username,)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Add(
              username: widget.username,
            ),
          ));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFFDC603),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 35,
                  color: index_color == 0 ? Colors.black : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.history,
                  size: 35,
                  color: index_color == 1 ? Colors.black : Colors.grey,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 35,
                  color: index_color == 2 ? Colors.black : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.settings,
                  size: 35,
                  color: index_color == 3 ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
