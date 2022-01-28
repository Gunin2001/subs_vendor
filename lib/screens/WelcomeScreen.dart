// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/LoginScreen.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/welcome";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = double.infinity;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [

        Image.asset(
          'lib/assets/images/welcomeImage__01.jpg',
          width: width,
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(10),
          children:[
        Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Welcome to Subscription App!",style: 
                  TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 10),
               Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Access all your subscription with designated Intervals",style: 
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.iconGrey
                  ),),
                ), 
                SizedBox(height: 40), 
                ScreenSizeButton("Get Started", context, LoginScreen.routeName),
      ]),
      ]
    ));
  }
}
