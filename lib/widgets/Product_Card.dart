// ignore_for_file: filetitles, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget productTile(String title, String number, String prod, String price,
    String unit, String image, BuildContext context, String Screen) {
  return Card(
    elevation: 5.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          height: 120.0,
          width: 120.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 0.0, bottom: 4, top: 12, left: 8),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(19, 19, 21, 1.0)),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 0.0, bottom: 4, top: 8, left: 8),
                      child: Text(
                        "+91 " + number,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(19, 19, 21, 1.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 0.0, bottom: 4, top: 8, left: 8),
                      child: Text(prod,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(19, 19, 21, 1.0))),
                    ),
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Text(
                      "Rs." + price,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(19, 19, 21, 1.0)),
                    ),
                    Center(
                      child: Text("per " + unit),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:55),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Edit Product",
                    style: TextStyle(
                      color: Color.fromRGBO(74, 90, 152, 1),
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("sub added");
                        Navigator.pushNamed(context, Screen);
                      }),
              ),
            )
          ],
        )
      ],
    ),
  );
}
