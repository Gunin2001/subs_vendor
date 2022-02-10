import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

TokenPreference tokenPreference = TokenPreference();

class TokenPreference {
  static const _USER_DATA = 'USERDATA';

  setTokenPreferenceData(var data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(_USER_DATA, data);
  }

  getTokenPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic data;
    try {
      data = prefs.get(_USER_DATA);
      data = json.decode(data);
    } catch (e) {
      data = 'null';
    }

    return data;
  }

  cleartTokenPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
        prefs.remove(_USER_DATA);
    //  return tokenProfile?.token = null;
      
    } catch (e) {
      print('inside userPref clear error: $e');
    }
  }
}
