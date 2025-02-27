import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';// Import the icon library you want to use

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "splash-screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextPage();
  }

  void navigateToNextPage() async {
    Future.delayed(
      const Duration(seconds: 2),
    );
    SharedPreferenceService().checkLogin().then((value) {
      if (value) {
        Navigator.pushNamed(context, "home"); // HomePage.routeName
      } else {
        // Replace this with the route you want to navigate to when not logged in
        Navigator.pushNamed(context, "login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double textScale = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/images/Onboarding_background.jpg"),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            Text(
              'Welcome to',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32 * textScale,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: width * 0.5,
              height: height * 0.2,
              child: Icon(
                Icons.rocket_launch,
                size: 100.0,
                color: Colors.blue, // Change the color to your preference
              ),
            ),
            SizedBox(
              width: width * 0.75,
              height: height * 0.13,
              child: Text(
                'Food Delivery App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue, // Change the color to your preference
                  fontSize: 65 * textScale,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.73,
              height: height * 0.06,
              child: Text(
                'Eat Healthy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3.98,
                ),
              ),
            ),
            Container(
              width: width * 0.53,
              height: height * 0.38,
              child: Icon(
                Icons.assistant, // Replace with your desired icon
                size: 150.0,
                color: Colors.green, // Change the color to your preference
              ),
            ),
          ],
        ),
      ),
    );
  }
}
