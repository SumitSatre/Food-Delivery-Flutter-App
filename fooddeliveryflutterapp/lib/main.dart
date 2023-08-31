import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/Authentication/loginPage.dart';
import 'package:fooddeliveryflutterapp/Authentication/signupPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'signup',
      routes: {
        "login": (context) => LoginScreen(),
        "signup": (context) => SignupScreen(),
        // "home": (context) => ,
      },

    );
  }
}
