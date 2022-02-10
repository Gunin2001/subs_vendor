import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: file_names

class Vendor {
  //  "_id": "61f96ddbd9c007a2b9689e56",
  //       "userid": "61f40a7b2ebceef7f83e0f7d",
  //       "productid": "61f96af0d9c007a2b9689e4a",
  //       "vendor": "61f40a7b2ebceef7f83e0f7d",
  //       "quantity": 3,
  //       "interval": "Daily",
  //       "amount": 100,
  //       "createdAt": "2022-02-01T17:28:59.326Z",
  //       "updatedAt": "2022-02-01T18:10:43.012Z",
  //       "__v": 0,
  //       "status": true,
  //       "vendor_details"
  String id;
  String userid;
  String productid;
  String vendor;
  String quantity;
  String interval;
  String amount;
  String createdAt;
  String updatedAt;
  String v;
  bool status;
  List vendor_details;
  Vendor({
    required this.id,
    required this.userid,
    required this.productid,
    required this.vendor,
    required this.quantity,
    required this.interval,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.status,
    required this.vendor_details,
  });

  Vendor copyWith({
    String? id,
    String? userid,
    String? productid,
    String? vendor,
    String? quantity,
    String? interval,
    String? amount,
    String? createdAt,
    String? updatedAt,
    String? v,
    bool? status,
    List? vendor_details,
  }) {
    return Vendor(
      id: id ?? this.id,
      userid: userid ?? this.userid,
      productid: productid ?? this.productid,
      vendor: vendor ?? this.vendor,
      quantity: quantity ?? this.quantity,
      interval: interval ?? this.interval,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      status: status ?? this.status,
      vendor_details: vendor_details ?? this.vendor_details,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userid': userid,
      'productid': productid,
      'vendor': vendor,
      'quantity': quantity,
      'interval': interval,
      'amount': amount,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'v': v,
      'status': status,
      'vendor_details': vendor_details,
    };
  }

  factory Vendor.fromMap(Map<String, dynamic> map) {
    return Vendor(
      id: map['id'] ?? '',
      userid: map['userid'] ?? '',
      productid: map['productid'] ?? '',
      vendor: map['vendor'] ?? '',
      quantity: map['quantity'] ?? '',
      interval: map['interval'] ?? '',
      amount: map['amount'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      v: map['v'] ?? '',
      status: map['status'] ?? false,
      vendor_details: List.from(map['vendor_details']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Vendor.fromJson(String source) => Vendor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Vendor(id: $id, userid: $userid, productid: $productid, vendor: $vendor, quantity: $quantity, interval: $interval, amount: $amount, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, status: $status, vendor_details: $vendor_details)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Vendor &&
      other.id == id &&
      other.userid == userid &&
      other.productid == productid &&
      other.vendor == vendor &&
      other.quantity == quantity &&
      other.interval == interval &&
      other.amount == amount &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.v == v &&
      other.status == status &&
      listEquals(other.vendor_details, vendor_details);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userid.hashCode ^
      productid.hashCode ^
      vendor.hashCode ^
      quantity.hashCode ^
      interval.hashCode ^
      amount.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      v.hashCode ^
      status.hashCode ^
      vendor_details.hashCode;
  }
}
