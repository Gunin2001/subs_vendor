// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:subs_vendor/Models/SearchModel.dart';
import 'package:subs_vendor/Models/UserSubscriptionModel.dart';

//var tokens = tokenProfile?.token;
Future getUser(token) async {
  http.Response res = await http.get(
    Uri.parse(
        'https://nameless-woodland-16457.herokuapp.com/user/userdetails'),
    headers: {
      'Authorization': "Bearer " + token
      // 'eyJhbGciOiJIUzI1NiJ9.IjYxYjVmZTllMDY2ZjNhOWJmYjc0ODFiMiI.1BrDUIYNTertbV74L05Zc-6UC6p0WqLkIXBA1Outxac'
      // token
    },
  );
  var share1 = json.decode(res.body);
  var share2 = json.decode(res.body)['message'];
  if (res.statusCode == 200) {
    print("resdata.............");
    print('S2$share2');
    print('S1$share1');
    // print(res);
    return share1;
  } else if (res.statusCode == 400) {
    print('-----');
    print(res.body);
    return null;
  } else {
    return null;
  }
  //return {"statusCode": res.statusCode, "response": share1};
}
