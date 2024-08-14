import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preference/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: TextField(
            controller: emailControler,
            decoration: InputDecoration(
                hintText: 'Enter Email',
                contentPadding: EdgeInsets.all(1),
                hintStyle: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.w500)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: TextField(
            controller: passwordControler,
            decoration: InputDecoration(
                hintText: 'Enter password',
                contentPadding: EdgeInsets.all(1),
                hintStyle: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.w500)),
          ),
        ),
        const SizedBox(height: 10),

        // the firse step of all  crate a sharepreference object inside onPressed()
        MaterialButton(
          color: Colors.deepOrangeAccent,
          onPressed: () async {
            final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            //setting the value in sp
            sharedPreferences.setString('email', emailControler.text);

            Get.to(HomePage());
          },
          child: const Text('Sign in'),
        ),

        // ------------------------------------
      ])),
    );
  }
}
