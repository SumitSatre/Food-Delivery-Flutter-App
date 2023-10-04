import 'dart:convert';
import 'dart:io';

import 'package:fooddeliveryflutterapp/utils/api_http_response.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://flutter-fooddelivery-backend.onrender.com/api/v1";

Future<String> getToken() async {
  return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjUxYTM5NTJhMzJlMTlkODYxM2M5YWFkIiwiZW1haWwiOiJzYXVyYWJoQGdtYWlsLmNvbSIsInVzZXJuYW1lIjoic2F1cmFiaCIsInJvbGUiOiJ1c2VyIn0sImlhdCI6MTY5NjIxNzQ2MSwiZXhwIjoxNjk2MzAzODYxfQ.k1tZAjD7lUhN6a7xWkTtcziz4-ftLtTu-4OfoHEKRZs"; // Replace with your actual access token
}

class ApiResponse {
  String? message, responseString, token;
  String? processStatus, status;
  int? responseCode, apiStatus;
  bool? success;
  ApiResponse({
    this.responseCode,
    this.responseString,
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
      'accept': 'application/json',
    };

    http.Response response =
    await http.get(Uri.parse(baseUrl + url), headers: header);

    if (response.statusCode == 200) {
      ApiResponse apiResponse = ApiResponse();
      apiResponse.responseString = response.body;
      apiResponse.success = true;
      return jsonDecode(apiResponse.responseString!);
    } else {
      throw Exception('Failed to get data: ${response.statusCode}');
    }
  } on SocketException catch (_) {
    ApiResponse apiResponse = ApiResponse();
    apiResponse.responseCode = 401;
    apiResponse.responseString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.internetConnectionMsg"});
    return apiResponse;
  } catch (e) {
    ApiResponse apiResponse = ApiResponse();
    apiResponse.responseCode = 401;
    apiResponse.responseString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.someThingWentWrong"});
    return apiResponse;
  }
}

Future<dynamic> patch(String url, Map<String, dynamic> data) async {
  try {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await getToken()}',
      'accept': 'application/json',
    };

    http.Response response = await http.patch(Uri.parse(baseUrl + url),
        headers: header, body: jsonEncode(data));
    ApiResponse apiResponse = ApiResponse();
    apiResponse.responseCode = response.statusCode;
    apiResponse.responseString = response.body;
    apiResponse.success = true;
    return jsonDecode(apiResponse.responseString!);
  } on SocketException catch (_) {
    ApiResponse apiResponse = ApiResponse();
    apiResponse.responseCode = 401;
    apiResponse.responseString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.internetConnectionMsg"});
    return apiResponse;
  } catch (e) {
    ApiResponse apiResponse = ApiResponse();
    apiResponse.responseCode = 401;
    apiResponse.responseString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.someThingWentWrong"});
    return apiResponse;
  }
}

Future<dynamic> post(String url, Map<String, dynamic> data) async {
  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await getToken()}'
    };

    http.Response response = await http.post(
      Uri.parse(baseUrl + url),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      ApiResponse apiResponse = ApiResponse();
      apiResponse.responseString = response.body;
      apiResponse.success = true;
      return jsonDecode(apiResponse.responseString!);
    } else {
      throw Exception('Failed to post data: ${response.statusCode}');
    }
  } on SocketException catch (_) {
    throw Exception('No internet connection');
  } catch (e) {
    throw Exception('Something went wrong: $e');
  }
}

Future<dynamic> delete(String url) async {
  try {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await getToken()}',
      'accept': 'application/json',
    };

    http.Response response =
    await http.delete(Uri.parse(baseUrl + url), headers: header);
    ApiResponse apiResponse = ApiResponse();
    apiResponse.responseCode = response.statusCode;
    apiResponse.responseString = response.body;
    apiResponse.success = true;
    return jsonDecode(apiResponse.responseString!);
  } on SocketException catch (_) {
    ApiResponse apiResponse = ApiResponse();
    apiResponse.responseCode = 401;
    apiResponse.responseString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.internetConnectionMsg"});
    return apiResponse;
  } catch (e) {
    ApiResponse apiResponse = ApiResponse();
    apiResponse.responseCode = 401;
    apiResponse.responseString = json.encode(
        {"success": false, "message": "AppRemoteRoutes.someThingWentWrong"});
    return apiResponse;
  }
}

Future<ApiHttpResponse> callPostMethod(
    Map<String, dynamic> authData, String apiUrl) async {
  try {
    String url = baseUrl + apiUrl;
    print(url);
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'accept': ' */*'
    };

    http.Response response = await http.post(Uri.parse(url),
        body: json.encode(authData), headers: header);
    ApiHttpResponse apiResponse = ApiHttpResponse();

    apiResponse.responseCode = response.statusCode;
    apiResponse.responceString = response.body;

    return apiResponse;
  } on SocketException catch (_) {
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;
    apiResponse.message = _.message;
    apiResponse.responceString =
        json.encode({"success": false, "message": _.message});
    return apiResponse;
  } catch (e) {
    print("catch error $e");
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;
    apiResponse.message = "Something went wrong.";
    apiResponse.responceString = json.encode(
        {"success": false, "message": "Something went wrong!! Please check internet connection."});
    return apiResponse;
  }
}

