import 'package:flutter/material.dart';
import 'package:project/Screens/Bottom.dart';
import 'package:project/Screens/login.dart';
import 'package:project/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'Assets/Money.jpg',
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => const Login()));
  }

  Future<void> checkUserLoggedIn() async {
   
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrefs.getBool(Save_Key);
     
    if (userLoggedIn == null || userLoggedIn == false) {
      gotologin();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => Bottom(),
      ));
    }
  }
  
}
