// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';

Widget commonTextField(String hint, double defaultFontSize) {
  return Container(
    height: 50,
    child: TextField(
      showCursor: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.tileSelectGreen, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.white,
        hintStyle:
            TextStyle(color: AppColors.iconGrey, fontSize: defaultFontSize),
        hintText: hint,
      ),
    ),
  );
}
