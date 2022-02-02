// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  Future<bool> getOnBoardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isOnBoardingComplete = prefs.getBool('isOnBoardingComplete');
    if (isOnBoardingComplete == null) {
      return false;
    }
    return true;
  }
  Future<void> setUserToken( String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Usertoken', token);
  }
  Future<String> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    final UserToken = prefs.getString('Usertoken');
    if (UserToken == null) {
      return '';
    }
    return UserToken;
  }

  Future<void> setOnBoardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnBoardingComplete', true);
  }
}