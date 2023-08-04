import 'package:flutter/material.dart';
import 'package:project/Screens/Bottom.dart';
import 'package:project/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _usernameController = TextEditingController();

class Login extends StatefulWidget {
 
   Login({super.key, });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xFFFDC603), Color(0xFFFCFF5B)],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(),
              const SizedBox(
                height: 50,
              ),
              _inputField("Username", _usernameController, isUsername: true),
              const SizedBox(
                height: 50,
              ),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 120,
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isUsername = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));

    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: _usernameController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'No Username found';
        } else {
          return null;
        }
      },
      obscureText: isUsername,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          checkLogin(context);
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => Bottom( ),
          // ));
        }
         else {
          print('empty value');
        }
      },
      child: const SizedBox(
          width: double.infinity,
          //height: 10,
          child: Text(
            "Sign in",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final username = _usernameController.text;
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool(Save_Key, true);
    await sharedPrefs.setString('username', username);

    Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(
          builder: (ctx1) => Bottom(
            username: username,
          ),
        ));
  }
}
