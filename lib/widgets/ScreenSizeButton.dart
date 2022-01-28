// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Routes.dart';

import '../Utils/Constants.dart';

Widget ScreenSizeButton(String text,BuildContext context, String Screen ) {
  return Container(
    width: double.infinity,
    height: 50,
    child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, Screen);
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AppColors.tileSelectGreen),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            )),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
  );
}
