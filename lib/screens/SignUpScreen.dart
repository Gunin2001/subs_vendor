// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/UserInfoScreen.dart';
import 'package:subs_vendor/widgets/CommonTextField.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

import 'LoginScreen.dart';
import 'SignUpScreen.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/signUp";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double defaultFontSize = 14;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(20),
          children: <Widget>[
            SizedBox(height: 70,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("hello!",style: 
                  TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height:30),
                commonTextField('E-mail ID or Phone Number', defaultFontSize),
                SizedBox(
                  height: 15,
                ),
                commonTextField('Password', defaultFontSize),
                SizedBox(
                  height: 15,
                ),
                commonTextField('Confirm Password', defaultFontSize),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Password doesn't match!",
                    style: TextStyle(
                      color: Color.fromRGBO(249, 138, 138, 1),
                      fontSize: defaultFontSize,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ScreenSizeButton("Login",context,ProfilePage.routeName),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(height: 280),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: defaultFontSize,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      )
                    },
                    child: Container(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.tileSelectGreen,
                          fontSize: defaultFontSize,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}