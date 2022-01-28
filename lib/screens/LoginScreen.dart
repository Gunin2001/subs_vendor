// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/HomeScreen.dart';
import 'package:subs_vendor/widgets/CommonTextField.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double defaultFontSize = 14;
    double defaultIconSize = 17;

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
                commonTextField('Email-Id or Phone Number', defaultFontSize),
                SizedBox(
                  height: 15,
                ),
                commonTextField('Password', defaultFontSize),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                      color: AppColors.tileSelectGreen,
                      fontSize: defaultFontSize,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ScreenSizeButton("Login",context,HomeScreen.routeName),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(height: 350),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Don't have an account? ",
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
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      )
                    },
                    child: Container(
                      child: Text(
                        "Register",
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