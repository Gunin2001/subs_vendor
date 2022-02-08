


import 'package:shared_preferences/shared_preferences.dart';

LoginPreference ?loginPreference;

class LoginPreference {
  static const _LOGIN_STATUS = 'LOGINSTATUS';

  setLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_LOGIN_STATUS, status);
    
  }
  
  Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getBool(_LOGIN_STATUS) ?? false;
    } catch (e) {
      print('Error in login preference : $e');
      return false;
    }
  }
 
}
