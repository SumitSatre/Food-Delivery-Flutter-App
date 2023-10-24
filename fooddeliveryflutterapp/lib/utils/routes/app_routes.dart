import 'package:fooddeliveryflutterapp/Authentication/loginPage.dart';
import 'package:fooddeliveryflutterapp/Authentication/signupPage.dart';
import 'package:fooddeliveryflutterapp/Authentication/splash_screen.dart';
import 'package:fooddeliveryflutterapp/home/screens/cart/cart_screen.dart';
import 'package:fooddeliveryflutterapp/home/screens/home_screen.dart';
import 'package:fooddeliveryflutterapp/home/screens/household_detail_screen.dart';
import 'package:fooddeliveryflutterapp/home/screens/profile.dart';

class AppRoutes {
  static final routes = {
    "login": (context) => LoginScreen(),
    "signup": (context) => SignupScreen(),
    "home" : (context) => HomeScreen(),
    "profile" : (context) => ProfilePage(),
    "splash-screen" : (context) => SplashScreen(),
    "house-hold-details-page" : (context) => MyPage(),
    "cart-screen" : (context) => CartPage(),
  };
}
