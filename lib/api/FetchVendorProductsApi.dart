// ignore_for_file: unused_import, file_names

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subs_vendor/SharedPreferences_service.dart';

class FetchVendorProducts {
  static Future fetchProducts() async {
    var dio = Dio();
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await dio.get(
        'https://nameless-woodland-16457.herokuapp.com/vendor/products',
        options: Options(
            headers: {
              "authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.IjYxZjQwYTdiMmViY2VlZjdmODNlMGY3ZCI.w_Ka7vdaUHDROcDkHLUr_iOWaQnfuugT9IcHaBpVspA",
            },
            validateStatus: (status) {
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
      print('error');
      return response;
    } else {
      return null;
    }
  }
}
