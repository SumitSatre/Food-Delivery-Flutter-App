import 'dart:convert';
import 'dart:io';

import 'package:fooddeliveryflutterapp/utils/api_http_response.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://flutter-fooddelivery-backend.onrender.com/api/v1";

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
        {"success": false, "message":"Something went wrong."});
    return apiResponse;
  }
}

Future<ApiHttpResponse> callUserGetMethod(String apiUrl, String token) async {
  try {
    String url = baseUrl + apiUrl;

    Map<String, String> header = {
      'authorization': 'bearer $token'
    };

    final response = await http.get(Uri.parse(url), headers: header);
    // print("This is response : ${json.decode(response.body).toString()}");
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
        {"success": false, "message":"Something went wrong"});
    return apiResponse;
  }
}

Future<ApiHttpResponse> callUserPutMethod(
    Map authData, String apiUrl, String token) async {
  print("This is authData $authData");
  try {
    String url = baseUrl + apiUrl;

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };

    http.Response response = await http.put(Uri.parse(url),
        body: json.encode(authData), headers: header);
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = response.statusCode;
    apiResponse.responceString = response.body;

    return apiResponse;
  } on SocketException catch (_) {
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;
    apiResponse.responceString = json.encode(
        {"success": false, "message": _.message});
    return apiResponse;
  } catch (e) {
    ApiHttpResponse apiResponse = ApiHttpResponse();
    apiResponse.responseCode = 401;
    apiResponse.responceString = json.encode(
        {"success": false, "message": "Something went wrong"});
    return apiResponse;
  }
}