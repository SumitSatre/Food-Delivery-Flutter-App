import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/Authentication/controllers/login_provider.dart';
import 'dart:convert';
import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Consumer<LoginProvider>(builder: (context, ref, child)
    {
      return ref.isLoading
          ? const Center(
        child: CircularProgressIndicator(
        ),
      )
          : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.emailController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blueAccent,
                            ),
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: controller.passwoordController,
                          obscureText: controller.isObscure,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.vpn_key_sharp,
                              color: Colors.blueAccent,
                            ),
                            labelText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  controller.togglePasswordVisibility();
                                });
                              },
                              child: Icon(
                                controller.isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            controller.login(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 40,
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'signup');
                              },
                              child: Text(
                                "Register Here",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
      )
    );
  }
}
