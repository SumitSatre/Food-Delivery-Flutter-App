import 'dart:convert';
import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';
import 'package:http/http.dart' as http;

Future<bool> registerUser(Map<String, String> payload) async {
  try {
    final response = await http.post(
      Uri.parse("https://flutter-fooddelivery-backend.onrender.com/api/v1/registerUser"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(payload),
    );

      var responseData = json.decode(response.body);
      print(responseData.toString());

      if (responseData['success']) {

        print("not ok");
        SharedPreferenceService().setLogin(responseData['authToken']);
        print("ok");
        return true;
      } else {
        // Registration failed, handle the error
        throw Exception('Registration failed: ${responseData['message']}');
      }
  } catch (e) {
    // Handle any exceptions that may occur during the request
    throw Exception('An error occurred during registration: $e');
  }
}
