// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserSubModel {
  bool success;
  String message;
  List data;
  UserSubModel({
    required this.success,
    required this.message,
    required this.data,
  });

  UserSubModel copyWith({
    bool? success,
    String? message,
    List? data,
  }) {
    return UserSubModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }

  factory UserSubModel.fromMap(Map<String, dynamic> map) {
    return UserSubModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: List.from(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSubModel.fromJson(String source) => UserSubModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserSubModel(success: $success, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserSubModel &&
      other.success == success &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ data.hashCode;
}
