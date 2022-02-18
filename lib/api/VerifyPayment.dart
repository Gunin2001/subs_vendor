// ignore_for_file: file_names

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:subs_vendor/Models/SearchModel.dart';
import 'package:subs_vendor/Models/UserSubscriptionModel.dart';

//var tokens = tokenProfile?.token;
Future verifyPayment(token, var orderCreationId, var razorpayPaymentId , var razorpaySignature,
      var subscriptionId, var vendorid) async {
    var dio = Dio();
    FormData formData = FormData.fromMap({
      'orderCreationId': orderCreationId,
      "razorpayPaymentId": razorpayPaymentId.toString(),
      "razorpaySignature": razorpaySignature,
      "subscriptionId": subscriptionId.toString(),
      "vendorid": vendorid,
    });
    var response = await dio.post(
        'https://nameless-woodland-16457.herokuapp.com/purchase/subscription',
        data: formData,
        options: Options(
            headers: {
              "Authorization": "Bearer "+ token ,
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
