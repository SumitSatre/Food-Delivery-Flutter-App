import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooddeliveryflutterapp/home/model/user_model.dart';
import 'package:fooddeliveryflutterapp/utils/api_http_response.dart';
import 'package:fooddeliveryflutterapp/utils/http_wrappers.dart';
import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier{

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  void init() async {
    await sendUserGetRequest();
  }

  Future<void> sendUserGetRequest() async {
    String accessToken = await SharedPreferenceService().getAccessToken();
    print(accessToken);
    ApiHttpResponse response =
    await callUserGetMethod("/UserProfile", accessToken);
    final json = jsonDecode(response.responceString!);
    debugPrint("This is profile json : ${json.toString()}");

    final data = json["data"];
    debugPrint("This is profile data : ${data.toString()}");

    //if (response.responseCode == 200) {
    //  _userModel = UserModel.fromJson(data["data"]);
    //  notifyListeners();
    //} else {
    //  notifyListeners();
    //}
  }


}