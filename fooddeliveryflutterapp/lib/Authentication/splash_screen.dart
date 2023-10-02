import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});
  static const String routeName = "splash-screen";

  @override
  State<SpalshScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SpalshScreen> {
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
        Navigator.pushNamed(context, HomePage.routeName);
      } else {
        Navigator.pushNamed(context, );
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
          image: DecorationImage(
            image: AssetImage("assets/images/Onboarding_background.jpg"),
            fit: BoxFit.cover,
          ),
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
              child: const Image(
                image: AssetImage('assets/images/eK_Logo_Transparent.png'),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: width * 0.75,
              height: height * 0.13,
              child: Text(
                'eKalakaar',
                textAlign: TextAlign.center,
                style: GoogleFonts.sansitaSwashed(
                  color: kprimaryColor,
                  fontSize: 65 * textScale,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.73,
              height: height * 0.06,
              child: Text(
                'Art Beyond Entertainment',
                textAlign: TextAlign.center,
                style: GoogleFonts.sansitaSwashed(
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Onboarding_picture.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
