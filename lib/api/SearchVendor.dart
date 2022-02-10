// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:subs_vendor/Models/SearchModel.dart';
import 'package:subs_vendor/Models/UserSubscriptionModel.dart';

//var tokens = tokenProfile?.token;
Future getSearch(token, var phoneNo) async {
  http.Response res = await http.get(
    Uri.parse('https://nameless-woodland-16457.herokuapp.com/user/searchvendor?phoneno=$phoneNo'),
    headers: {'Authorization': "Bearer " + token
     },
  );
 // http.MultipartFile.fromPath(, filePath)
  var share1 = json.decode(res.body)['data'];
  if (res.statusCode == 200) {
    print("skills.............");
   
    print('mioio$share1');
    print(res);
    return share1;
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}