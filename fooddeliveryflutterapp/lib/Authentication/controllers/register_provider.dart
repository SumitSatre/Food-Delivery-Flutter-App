// ignore_for_file: use_build_context_synchronously

//import 'package:ekalakaar_app/api%20repository/api_http_response.dart';
//import 'package:ekalakaar_app/api%20repository/product_repository.dart';
//import 'package:ekalakaar_app/auth/models/user_register_model.dart';
//import 'package:ekalakaar_app/auth/screens/login_screen.dart';
//import 'package:ekalakaar_app/auth/screens/sign_up_screen.dart';
//import 'package:ekalakaar_app/utils/utils.dart';
//import 'package:flutter/material.dart';
//
//class RegisterProvider extends ChangeNotifier {
//  bool _isObscure = true;
//  bool get isObscure => _isObscure;
//  bool _isLoading = false;
//  bool get isLoading => _isLoading;
//  String role = '';
//
//  //text editing controllers
//  final TextEditingController emailController = TextEditingController();
//  final TextEditingController passwordController = TextEditingController();
//  final TextEditingController confirmPasswordController =
//      TextEditingController();
//  final TextEditingController nameController = TextEditingController();
//  final TextEditingController lastNameController = TextEditingController();
//  final TextEditingController contactController = TextEditingController();
//
//  @override
//  void dispose() {
//    super.dispose();
//    emailController.dispose();
//    passwordController.dispose();
//    confirmPasswordController.dispose();
//    nameController.dispose();
//    lastNameController.dispose();
//    contactController.dispose();
//  }
//
//  void togglePasswordVisibility() {
//    _isObscure = !isObscure;
//    notifyListeners();
//  }
//
//  void updateRole(String role, BuildContext context) {
//    this.role = role;
//    notifyListeners();
//    debugPrint(role);
//    Navigator.pushNamed(context, SignUpScreen.routeName);
//  }
//
//  void register(BuildContext context) async {
//    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//            .hasMatch(emailController.text) &&
//        passwordController.text.length >= 8 &&
//        passwordController.text == confirmPasswordController.text &&
//        contactController.text.length == 10 &&
//        nameController.text.isNotEmpty &&
//        lastNameController.text.isNotEmpty) {
//      _isLoading = true;
//      notifyListeners();
//      UserRegisterModel userRegisterModel = UserRegisterModel(
//          firstName: nameController.text,
//          lastName: lastNameController.text,
//          email: emailController.text,
//          phoneNumber: "+91${contactController.text}",
//          password: passwordController.text,
//          passwordConfirm: confirmPasswordController.text,
//          role: role);
//      String res = await sendRegisterRequest(userRegisterModel);
//      if (res == "Success") {
//        _isLoading = false;
//        notifyListeners();
//        showSnackBar(
//            context,
//            "Resgister Successful Please login now to access your profile",
//            Colors.green);
//        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
//      } else {
//        showSnackBar(context, "Some error occoured", Colors.red);
//        _isLoading = false;
//        notifyListeners();
//      }
//    } else {
//      if (nameController.text.isEmpty || lastNameController.text.isEmpty) {
//        showSnackBar(
//            context, "First Name and Last name cannot be empty", Colors.red);
//      } else if (!RegExp(
//              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//          .hasMatch(emailController.text)) {
//        showSnackBar(context, "Invalid email", Colors.red);
//      } else if (passwordController.text.length < 8) {
//        showSnackBar(
//            context, "Password should be of minimum 8 characters", Colors.red);
//      } else if (passwordController.text != confirmPasswordController.text) {
//        showSnackBar(
//            context, "Password and Confirm Password do not match", Colors.red);
//      } else if (contactController.text.length != 10) {
//        showSnackBar(context, "Invalid Phone Number", Colors.red);
//      }
//    }
//  }
//
//  Future<String> sendRegisterRequest(
//      UserRegisterModel userRegisterModel) async {
//    String res = "Some Error occoured";
//
//    ApiHttpResponse response =
//        await callPostMethod(userRegisterModel.toMap(), "auth/register");
//    debugPrint(response.responceString);
//    if (response.responseCode == 201) {
//      res = "Success";
//    }
//    return res;
//  }
//}
//