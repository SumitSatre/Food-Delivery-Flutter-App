import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final nameController = TextEditingController();

  bool isObscure = true;

  Future<void> registerUser () async {
    String name = nameController.text;
    String email = emailController.text;
    String password = pwdController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all the fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      var data = {
        'name': name,
        'email': email,
        'password': password,
      };

      try {
        final response = await http.post(
          Uri.parse("https://flutter-fooddelivery-backend.onrender.com/api/v1/registerUser"),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(data),
        );

        var responseData = json.decode(response.body);
        print(responseData.toString());

        if (responseData['success']) {

          print("not ok");
          SharedPreferenceService().setLogin(responseData['authToken']);
          print("ok");

          Navigator.pushNamed(context,  "login");
        } else {
          // Registration failed, handle the error
          throw Exception('Registration failed: ${responseData['message']}');
        }
      } catch (e) {
        // Handle any exceptions that may occur during the request
        throw Exception('An error occurred during registration: $e');
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Icon(
                  Icons.person,
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
                          controller: nameController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blueAccent,
                            ),
                            labelText: "Enter Your Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),

                        SizedBox(height: 20),

                        TextFormField(
                          controller: emailController,
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
                          controller: pwdController,
                          obscureText: isObscure,
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
                                  isObscure = !isObscure;
                                });
                              },
                              child: Icon(
                                isObscure
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
                          onPressed:  () async{
                            String name = nameController.text;
                            String email = emailController.text;
                            String password = pwdController.text;

                            if (name.isEmpty || email.isEmpty || password.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Please fill in all the fields.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              var data = {
                                'name': name,
                                'email': email,
                                'password': password,
                              };

                              try {
                                final response = await http.post(
                                  Uri.parse("https://flutter-fooddelivery-backend.onrender.com/api/v1/registerUser"),
                                  headers: {
                                    'Content-Type': 'application/json',
                                  },
                                  body: json.encode(data),
                                );

                                var responseData = json.decode(response.body);
                                print(responseData.toString());

                                if (responseData['success']) {

                                  print("not ok");
                                  SharedPreferenceService().setLogin(responseData['authToken']);
                                  print("ok");

                                  Navigator.pushNamed(context,  "login");
                                } else {
                                  // Registration failed, handle the error
                                  throw Exception('Registration failed: ${responseData['message']}');
                                }
                              } catch (e) {
                                // Handle any exceptions that may occur during the request
                                throw Exception('An error occurred during registration: $e');
                              }

                            }

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 40,
                            ),
                          ),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        Column(
                          children: [
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
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  child: Text(
                                    "Login Here",
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Text("Or"),

                            TextButton(
                              onPressed: () {
                                // Handle skipping the registration
                              },
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                  color: Colors.blueGrey,
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
      ),
    );
  }
}
