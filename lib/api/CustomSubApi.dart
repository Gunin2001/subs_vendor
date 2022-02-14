// ignore_for_file: unused_import, file_names
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCustomSubscriptionApi {
  static Future addCustomSub(
      token,
      var category,
      var price,
      var productname,
      var unit,
      var quantity,
      var interval,
      var amount,
      var phoneno,
      var name) async {
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
    print(name);
    FormData formData = FormData.fromMap({
      'productname': productname,
      "quantity": quantity.toString(),
      "interval": interval,
      "amount": amount.toString(),
      "category": category,
      "priceperquantity": price.toString(),
      "vendorphoneno": phoneno,
      "vendorname": name
    });
    var response = await dio.post(
        'https://nameless-woodland-16457.herokuapp.com/subscription/addcustomsubscription',
        data: formData,
        options: Options(
            headers: {
              "Authorization": "Bearer " + token,
            },
            validateStatus: (status) {
              return status! < 500;
            }));
    print('In custom api');
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
