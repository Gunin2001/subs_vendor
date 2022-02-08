// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
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
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ScreenSizeButton('Logout', context, blank.routeName),
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
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(
              height: 25,
            ),
            settingCard("Profile", context, blank.routeName),
            SizedBox(
              height: 10,
            ),
            settingCard("Payment History", context, blank.routeName),
            SizedBox(
              height: 10,
            ),
            settingCard("Help Center", context, blank.routeName),
            SizedBox(
              height: 10,
            ),
            settingCard("About", context, blank.routeName),
            SizedBox(
              height: 10,
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
