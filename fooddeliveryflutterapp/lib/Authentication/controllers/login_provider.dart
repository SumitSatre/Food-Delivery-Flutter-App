// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/utils/api_http_response.dart';
import 'package:fooddeliveryflutterapp/utils/http_wrappers.dart';
import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';
import 'package:fooddeliveryflutterapp/utils/snackBar.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwoordController = TextEditingController();
  String _accessToken = "";
  bool _isObscure = true;
  bool get isObscure => _isObscure;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void togglePasswordVisibility() {
    _isObscure = !isObscure;
    notifyListeners();
  }

  login(BuildContext context) async {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text) &&
        passwoordController.text.length >= 8) {
      _isLoading = true;
      notifyListeners();
      String res = await sendLoginRequest();

      if (res == "Login success") {
        showSnackBar(context, res, Colors.green);
        SharedPreferenceService().setLogin(_accessToken);
        _isLoading = false;
        notifyListeners();
          Navigator.pushNamedAndRemoveUntil(
              context, "home", (route) => false);
      } else {
        showSnackBar(context, res, Colors.red);
        _isLoading = false;
        notifyListeners();
      }
    } else {
      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(emailController.text) &&
          passwoordController.text.length < 8) {
        showSnackBar(
            context,
            "Invalid Email and Password should be of atleast 8 characters",
            Colors.red);
      } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        showSnackBar(context, "Invalid Email", Colors.red);
      } else if (passwoordController.text.length < 8) {
        showSnackBar(
            context, "Password should be of atleast 8 characters", Colors.red);
      }
    }
  }

  Future<String> sendLoginRequest() async {
    String res = "Some error occurred";
    ApiHttpResponse response = await callPostMethod(
        {"email": emailController.text, "password": passwoordController.text},
        "auth/login");
    final data = jsonDecode(response.responceString!);
    print("thi is $data");
    if (response.responseCode == 200) {
      _accessToken = data["data"]["accessToken"];
      notifyListeners();
      debugPrint(_accessToken);
      res = "Login success";
    } else {
      res = data["message"];
    }
    return res;
  }
}
