// ignore_for_file: unused_import, file_names

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subs_vendor/SharedPreferences_service.dart';

class SignUp {
  static Future signUp(var phoneno, var password, var type) async {
    print(phoneno);
    print(password);
    print(type);
    var dio = Dio();
    FormData formData = FormData.fromMap({
      'phoneno': phoneno,
      'password': password,
      'type': type,
    });
    var response = await dio.post(
        'https://nameless-woodland-16457.herokuapp.com/user/signup',
        data: formData, options: Options(validateStatus: (status) {
      return status! < 500;
    }));
    print(response.data);
    if (response.statusCode == 200) {
      print(response.data);
      /*SharedPrefsService().setUserToken(response.data.toString());
      String token = SharedPrefsService().getUserToken().toString();
      print(' the user token is $token'); */
      // Map<String, dynamic> jsonResponse = convert.jsonDecode(response.data) as Map<String, dynamic>;
      return response;
    } else if (response.statusCode == 400) {
      return response;
    } else {
      return null;
    }
  }
}

//json.decode("${response.data['data']}"