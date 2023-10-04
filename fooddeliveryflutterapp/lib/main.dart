import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/Authentication/controllers/login_provider.dart';
import 'package:fooddeliveryflutterapp/Authentication/controllers/register_provider.dart';
import 'package:fooddeliveryflutterapp/home/controllers/home_controller.dart';
import 'package:fooddeliveryflutterapp/utils/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "splash-screen",
        routes: AppRoutes.routes

      ),
    );
  }
}
