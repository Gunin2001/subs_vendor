// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/LoginScreen.dart';
import 'package:subs_vendor/shared_preferences/login_preferences.dart';
import 'package:subs_vendor/shared_preferences/token_preferences.dart';
import 'package:subs_vendor/shared_preferences/type_preference.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static String routeName = "/settings";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double height, width;
height = MediaQuery.of(context).size.height;
width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 13, right: 13, bottom: 5),
        child: BottomNavBar(),
      ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.all(height*0.02),
          child: Container(
    width: width,
    height: height*0.065,
    child: TextButton(
        onPressed: () {
          loginPreference!.setLoginStatus(false);
              tokenPreference.cleartTokenPreferenceData();
              typePreference!.clearTypeStatus();
              FirebaseAuth.instance.signOut();
          Navigator.pushNamed(context, LoginScreen.routeName);
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
          "Logout",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
  ),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.primaryGrey,
          elevation: 0,
          title: Text("Subscription App"),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: AppColors.iconBlack,
                ),
                onPressed: () {
                  // do something
                })
          ],
        ),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(
              height: height*0.032,
            ),
            settingCard("Profile", context, blank.routeName),
            SizedBox(
              height: height*0.013,
            ),
            settingCard("Payment History", context, blank.routeName),
            SizedBox(
              height: height*0.013,
            ),
            settingCard("Help Center", context, blank.routeName),
            SizedBox(
              height: height*0.013,
            ),
            settingCard("About", context, blank.routeName),
            SizedBox(
              height: height*0.013,
            ),
            settingCard("Report a bug", context, blank.routeName),
          ],
        ));
  }
}

Widget settingCard(
  String text,
  BuildContext context,
  String Screen,
) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, Screen);
    },
    child: Card(
      color: AppColors.primaryGrey,
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "   $text",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Screen);
            },
            icon: Icon(Icons.arrow_forward_ios),
            color: AppColors.iconGrey,
          )
        ],
      ),
    ),
  );
}
