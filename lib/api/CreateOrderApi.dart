
// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/shared_preferences/type_preference.dart';

Future createOrder(token ,var ID) async {
    print(ID);
    var dio = Dio();
    FormData formData = FormData.fromMap({
      'subscriptionId': ID
    });
    var response = await dio.post(
        'https://nameless-woodland-16457.herokuapp.com/purchase/createsubsciptionorder',
        data: formData,
        options: Options(
          headers: {
      'Authorization': "Bearer " + token
      // 'eyJhbGciOiJIUzI1NiJ9.IjYxYjVmZTllMDY2ZjNhOWJmYjc0ODFiMiI.1BrDUIYNTertbV74L05Zc-6UC6p0WqLkIXBA1Outxac'
      // token
    },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    print("in create order api");
    print(response);
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 400) {
      return response;
    } else {
      return null;
    }
  }