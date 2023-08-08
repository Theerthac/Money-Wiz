// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project/Screens/settings.dart';

class About extends StatefulWidget {
  String username;
   About({super.key,required this.username});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 140,
                decoration: const BoxDecoration(
                    color: Color(0xFFFDC603),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return Settings(
                                      username: widget.username,
                                    );
                                  },
                                ));
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              )),
                          const Text(
                            '    About',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
           const Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 160, right: 150),
                child: Text(
                  'Money Management',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50, right: 20, top: 20),
                child: Text(
                  '"This is an app where you can\nadd your daily transactions\naccording to the category which it belongs to."',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Developed by',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 223),
                child: Row(
                  children: [
                    Center(
                      child: Text(
                        'Theertha.C',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
