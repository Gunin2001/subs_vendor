
import 'package:shared_preferences/shared_preferences.dart';

TypePreference ?typePreference;

class TypePreference {
  static const _type_STATUS = 'typeSTATUS';

  settypeStatus(String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_type_STATUS, status);
    
  }
  
  Future<String> gettypeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getString(_type_STATUS) ?? '';
    } catch (e) {
      print('Error in type preference : $e');
      return '';
    }
  }
 
}