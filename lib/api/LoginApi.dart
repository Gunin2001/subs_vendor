// ignore_for_file: unused_import, file_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/shared_preferences/type_preference.dart';

class LoginApi {
  static Future login(var phoneno, var password) async {
    print(phoneno);
    print(password);
    var dio = Dio();
    FormData formData = FormData.fromMap({
      'userinfo': phoneno,
      'password': password,
    });
    var response = await dio.post(
        'https://nameless-woodland-16457.herokuapp.com/user/login',
        data: formData,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    print(response.data);
    if (response.statusCode == 200) {
      tokenProfile = TokenProfile.fromJson(
          json.decode('"${response.data['data']['token']}"'));
      if (json.decode('"${response.data['data']['type']}"') == "vendor") {
        typePreference!.setTypeStatus(true);
        ConstantType = true;
        print("if vendor");
        print(await typePreference!.getTypeStatus());
      } else {
        typePreference!.setTypeStatus(false);
        ConstantType = false;
        print("if buyer");
        print(await typePreference!.getTypeStatus());
      }
      print('in login api ');
      print(tokenProfile?.token);
      return response;
    } else if (response.statusCode == 400) {
      return response;
    } else {
      return null;
    }
  }
}
