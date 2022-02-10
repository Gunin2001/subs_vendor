// ignore_for_file: unused_import, file_names

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateBankDetails {
  static Future updateBank(var holdername, var accno, var ifsc, var upi) async {
    var dio = Dio();
    FormData formData = FormData.fromMap({
      'accountno': accno,
      'accountholdername': holdername,
      'ifsccode': ifsc,
      'upidetails': upi,
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await dio.post(
        'https://nameless-woodland-16457.herokuapp.com/vendor/updatebankdetails',
        data: formData,
        options: Options(
            headers: {
              "authorization": "Bearer ${prefs.getString('UserToken')}",
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
      return response.statusCode;
    } else if (response.statusCode == 400) {
      return response.statusCode;
    } else {
      return null;
    }
  }
}