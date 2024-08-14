import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preference/login_screen.dart';
import 'package:shared_preference/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            child: Text("Hello $finalEmail"),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            color: Colors.deepOrangeAccent,
            onPressed: () async {
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.remove('email');

              Get.to(LoginScreen());
              print("Remove the data");
            },
            child: const Text('Remove all credential'),
          ),
        ]),
      ),
    );
  }
}
