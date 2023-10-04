 // ignore_for_file: use_build_context_synchronously

 import 'dart:convert';
 import 'dart:js_util';

 import 'package:flutter/material.dart';
 import 'package:fooddeliveryflutterapp/utils/api_http_response.dart';
 import 'package:fooddeliveryflutterapp/utils/http_wrappers.dart';
 import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';
 import 'package:fooddeliveryflutterapp/utils/snackBar.dart';

class RegisterProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

   String _accessToken = "";
   bool _isObscure = true;
   bool get isObscure => _isObscure;
   bool _isLoading = false;
   bool get isLoading => _isLoading;

   void togglePasswordVisibility() {
     _isObscure = !isObscure;
     notifyListeners();
   }

  void register(BuildContext context) async {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text) &&
        passwordController.text.length >= 8  &&
        nameController.text.isNotEmpty ) {
      _isLoading = true;
      notifyListeners();
      String res = await sendRegisterRequest();
      if (res == "Success") {
        showSnackBar(context, res, Colors.green);
        SharedPreferenceService().setLogin(_accessToken);
        _isLoading = false;
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
            context, "home", (route) => false);
      } else {
        showSnackBar(context, "Some error occoured", Colors.red);
        _isLoading = false;
        notifyListeners();
      }
    } else {
      if (nameController.text.isEmpty) {
        showSnackBar(
            context, "First Name and Last name cannot be empty", Colors.red);
      } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        showSnackBar(context, "Invalid email", Colors.red);
      } else if (passwordController.text.length < 8) {
        showSnackBar(
            context, "Password should be of minimum 8 characters", Colors.red);
      }
    }
  }

   Future<String> sendRegisterRequest() async {
     String res = "Some error occurred";
     ApiHttpResponse response = await callPostMethod(
         {"name":nameController.text , "email": emailController.text, "password": passwordController.text},
         "/registerUser");
     final data = jsonDecode(response.responceString!);
     print("the is $data");
     print(response.responseCode);
     if (response.responseCode == 201) {
       _accessToken = data["authToken"];
       notifyListeners();
       debugPrint(_accessToken);
       res = "Success";
     } else {
       res = data["message"];
     }
     return res;
   }
}
