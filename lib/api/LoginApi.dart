// ignore_for_file: unused_import, file_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {
  static Future login(var phoneno, var password, var type) async {
    print(phoneno);
    print(password);
    print(type);
    var dio = Dio();
    FormData formData = FormData.fromMap({
      'userinfo': phoneno,
      'password': password,
      'type': type,
    });
    var response = await dio.post(
        'https://nameless-woodland-16457.herokuapp.com/user/login',
        data: formData, options: Options(validateStatus: (status) {
      return status! < 500;
    }));
    print(response.data);
    if (response.statusCode == 200) {
      print(response.data);
      return response.statusCode;
    } else if (response.statusCode == 400) {
      return response.statusCode;
    } else {
      return null;
    }
  }

}