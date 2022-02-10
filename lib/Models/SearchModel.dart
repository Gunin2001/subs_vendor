// ignore: file_names
// To parse this JSON data, do
//
//     final SearchModel = SearchModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

SearchModel SearchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String SearchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
    SearchModel({
        required this.success,
        required this.message,
        required this.data,
    });

    bool success;
    String message;
    Data data;

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.password,
        required this.phoneno,
        required this.adminverified,
        required this.isVendor,
        required this.v,
        required this.address,
        required this.email,
        required this.image,
        required this.name,
        required this.pincode,
        required this.shopname,
    });

    String id;
    String password;
    String phoneno;
    bool adminverified;
    bool isVendor;
    int v;
    String address;
    String email;
    String image;
    String name;
    String pincode;
    String shopname;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        password: json["password"],
        phoneno: json["phoneno"],
        adminverified: json["adminverified"],
        isVendor: json["isVendor"],
        v: json["__v"],
        address: json["address"],
        email: json["email"],
        image: json["image"],
        name: json["name"],
        pincode: json["pincode"],
        shopname: json["shopname"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "password": password,
        "phoneno": phoneno,
        "adminverified": adminverified,
        "isVendor": isVendor,
        "__v": v,
        "address": address,
        "email": email,
        "image": image,
        "name": name,
        "pincode": pincode,
        "shopname": shopname,
    };
}
