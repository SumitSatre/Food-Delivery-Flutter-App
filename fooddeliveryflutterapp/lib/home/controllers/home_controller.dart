import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooddeliveryflutterapp/utils/api_http_response.dart';
import 'package:fooddeliveryflutterapp/utils/http_wrappers.dart';
import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier{

  
  void init() async {
    await sendUserGetRequest();
  }

  Future<void> sendUserGetRequest() async {
    String accessToken = await SharedPreferenceService().getAccessToken();
    ApiHttpResponse response =
    await callUserGetMethod("artists/profile", accessToken);
    final json = jsonDecode(response.responceString!);
    debugPrint("This is profile json : ${json.toString()}");

    final data = json["data"];
    debugPrint("This is profile data : ${data.toString()}");
  }
}