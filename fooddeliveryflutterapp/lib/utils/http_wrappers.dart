import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

const baseUrl = "https://api.ekalakaar.com/api/v1";

Future<String> getToken() async {
  return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGU2MzcwNzdmNWNjYTA3ZTM1YmI5MjYiLCJpYXQiOjE2OTQ4NzEwMzMsImV4cCI6MTY5NDk1NzQzM30._-7JLP4Oomt568Sw4CAUh_e6hzqU7lMlu8sRicsQaU8";
}

class ApiHttpResponse {
  String? message, responceString, token;
  String? processStatus, status;
  int? responseCode, apiStatus;
  bool? success;
  ApiHttpResponse({
    this.responseCode,
    this.responceString,
    this.message,
    this.token,
    this.processStatus,
    this.success,
    this.status,
  });
}

Future<dynamic> get(String url) async {
  try {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await getToken()}',
      'accept': ' */*',
    };

    http.Response response =
        await http.get(Uri.parse(baseUrl + url), headers: header);
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = response.statusCode;
    apiResponse.responceString = response.body;
    apiResponse.success = true;
    return jsonDecode(apiResponse.responceString!);
  } on SocketException catch (_) {
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;
    apiResponse.responceString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.internetConnectionMsg"});
    return apiResponse;
  } catch (e) {
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;
    apiResponse.responceString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.someThingWentWrong"});
    return apiResponse;
  }
}

Future<dynamic> patch(String url, Map<String, dynamic> data) async {
  try {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await getToken()}',
      'accept': ' */*',
    };

    http.Response response = await http.patch(Uri.parse(baseUrl + url),
        headers: header, body: jsonEncode(data));
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = response.statusCode;
    apiResponse.responceString = response.body;
    apiResponse.success = true;
    return jsonDecode(apiResponse.responceString!);
  } on SocketException catch (_) {
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;

    apiResponse.responceString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.internetConnectionMsg"});
    return apiResponse;
  } catch (e) {
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;
    apiResponse.responceString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.someThingWentWrong"});
    return apiResponse;
  }
}

Future<dynamic> post(String url, Map<String, dynamic> data) async {
  try {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await getToken()}',
      'accept': ' */*',
    };

    http.Response response = await http.post(Uri.parse(baseUrl + url),
        headers: header, body: jsonEncode(data));
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = response.statusCode;
    apiResponse.responceString = response.body;
    apiResponse.success = true;
    return jsonDecode(apiResponse.responceString!);
  } on SocketException catch (_) {
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;

    apiResponse.responceString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.internetConnectionMsg"});
    return apiResponse;
  } catch (e) {
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;
    apiResponse.responceString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.someThingWentWrong"});
    return apiResponse;
  }
}

Future<dynamic> delete(String url) async {
  try {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await getToken()}',
      'accept': ' */*',
    };

    http.Response response =
        await http.delete(Uri.parse(baseUrl + url), headers: header);
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = response.statusCode;
    apiResponse.responceString = response.body;
    apiResponse.success = true;
    return jsonDecode(apiResponse.responceString!);
  } on SocketException catch (_) {
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;

    apiResponse.responceString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.internetConnectionMsg"});
    return apiResponse;
  } catch (e) {
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;
    apiResponse.responceString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.someThingWentWrong"});
    return apiResponse;
  }
}
