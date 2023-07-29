// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';


// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   TextEditingController usernameController = TextEditingController();
//    TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//         colors: [Color(0xFFFDC603), Color(0xFFFCFF5B)],
//       )),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: _page(),
        
//       ),
//     );
//   }

//   Widget _page() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _icon(),
//           _inputField("Username",usernameController),
//            _inputField("password",usernameController)
          
//         ],
//       ),
//     );
//   }

//   Widget _icon() {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.white, width: 2),
//           shape: BoxShape.circle),
//       child: Icon(
//         Icons.person,
//         color: Colors.white,
//         size: 120,
//       ),
//     );
//   }

//   Widget _inputField(String hintText, TextEditingController controller) {
//     var border = OutlineInputBorder(
//         borderRadius: BorderRadius.circular(18),
//         borderSide: const BorderSide(color: Colors.white));

//     return TextField(
      


//     );
//   }
// }
