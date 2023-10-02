import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  String logInkey = "LOGIN";
  String accessTokenKey = "ACCESS_Token";
  void setLogin(String accessToken) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(logInkey, true);
    sp.setString(accessTokenKey, accessToken);
  }

  Future<bool> checkLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(logInkey) ?? false;
  }

  void clearLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
  }

  Future<String> getAccessToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(accessTokenKey) ?? '';
  }
}
