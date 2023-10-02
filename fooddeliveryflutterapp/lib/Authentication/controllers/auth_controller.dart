import 'dart:convert';
import 'dart:io';
import 'package:fooddeliveryflutterapp/utils/http_wrappers.dart';
import 'package:http/http.dart' as http;

Future<Map<String , dynamic>> registerUser(Map<String, String> payload) async {

    //  Applied, In-Progress, Hired, Rejected
  var response = await http.post(
    Uri.parse("https://flutter-app-backend-qy7f.onrender.com/api/user/signup"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(payload),
  );

  var responseData = json.decode(response.body);

  // If post api fetched correctly
  if (responseData['success']) {

    var pref = await SharedPreferences.getInstance();
    await pref.setString("authToken", responseData["authToken"]);
    await pref.setString("emailToken", email);

    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

    // print(body);
    if (body["success"] != true) {
      throw Exception("something went wrong here");
    }
    return {"status": true};

}