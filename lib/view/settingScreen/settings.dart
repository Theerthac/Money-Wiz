// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/model/add_data.dart';
import '../settings/about .dart';
import '../../widget/bottomscreen.dart';
import '../settings/privacy.dart';
import '../settings/reset.dart';
import '../settings/terms.dart';


class Settings extends StatelessWidget {
  String username;
  Settings({super.key, required this.username});

  final box = Hive.box<add_data>('data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        Column(children: [
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
                                return Bottom(
                                  username: username,
                                );
                              },
                            ));
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                      const Text(
                        '     Settings',
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
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.info_outline,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return About(
                            username: username,
                          );
                        },
                      ));
                    },
                    child: const Text(
                      '   About',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.history_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      resetApp(context);
                    },
                    child: const Text(
                      '   Reset',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.content_paste,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return Term(
                            username: username,
                          );
                        },
                      ));
                    },
                    child: const Text(
                      '   Terms & Conditions',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.privacy_tip_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return Privacy(
                            username: username,
                          );
                        },
                      ));
                    },
                    child: const Text(
                      '   Privacy Policy',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ],
          )
        ])
      ])),
    );
  }
}
