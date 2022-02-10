// ignore_for_file: unused_import, file_names

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddSubscriptionApi {
  static Future addSub(token, var category, var price, var productname,
      var unit, var quantity, var interval, var amount, var phoneno) async {
    var dio = Dio();
    print(token);
    print(price);
    print(category);
    print(productname);
    print(unit);
    print(quantity);
    print(interval);
    print(amount);
    print(phoneno);
    FormData formData = FormData.fromMap({
      'productname': productname,
      "quantity": quantity.toString(),
      "interval": interval,
      "amount": amount.toString(),
      "category": category,
      "priceperquantity": price.toString(),
      "vendorphoneno": phoneno
    });
    var response = await dio.post(
        'https://nameless-woodland-16457.herokuapp.com/subscription/subscribe',
        data: formData,
        options: Options(
            headers: {
              "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.IjYxZjQwYTdiMmViY2VlZjdmODNlMGY3ZCI.w_Ka7vdaUHDROcDkHLUr_iOWaQnfuugT9IcHaBpVspA" ,
            },
            validateStatus: (status) {
              return status! < 500;
            }));
    print(response.data);
    if (response.statusCode == 200) {
      print(response.data);
      return response;
    } else if (response.statusCode == 400) {
      return response;
    } else {
      return null;
    }
  }
}
