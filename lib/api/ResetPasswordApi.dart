// ignore_for_file: unused_import, file_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/shared_preferences/type_preference.dart';

class ResetApi {
  static Future resetPassword(var phoneno, var password) async {
    print(phoneno);
    print(password);
    var dio = Dio();
    FormData formData = FormData.fromMap({
      'phoneno': phoneno,
      'password': password,
    });
    var response = await dio.post(
        'https://nameless-woodland-16457.herokuapp.com/user/resetpassword',
        data: formData,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    print("in reset api");
    print(response);
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 400) {
      return response;
    } else {
      return null;
    }
  }
}
