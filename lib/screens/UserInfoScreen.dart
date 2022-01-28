// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/HomeScreen.dart';
import 'package:subs_vendor/widgets/CommonTextField.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

import 'BankDetailsScreen.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = "/userInfo";
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double defaultFontSize = 14;
    double ContainerSize = 170;
    double picSize = 60;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView
      (
        children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: ContainerSize,
              decoration: BoxDecoration(
                color: AppColors.primaryGrey,
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(30),
                    bottomStart: Radius.circular(30)),
              ),
            ),
            Text(
              "User Info",
              style: TextStyle(fontSize: 18),
            ),
            Positioned(
              top: ContainerSize - picSize,
              child: CircleAvatar(
                radius: picSize,
                child: Image.asset("lib/assets/images/profile.png"),
              ),
            )
          ],
        ),
        SizedBox(
          height: 55,
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(10), 
          children: [
          Align(
              alignment: Alignment.centerLeft,
              child:
                  Text("Name", style: TextStyle(color: AppColors.iconGrey))),
          SizedBox(
            height: 10,
          ),
         commonTextField("Enter your Name", defaultFontSize),
         SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Phone Number",
                  style: TextStyle(color: AppColors.iconGrey))),
          SizedBox(
            height: 10,
          ),
         commonTextField("Enter your Phone Number", defaultFontSize),
         SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Email-ID",
                  style: TextStyle(color: AppColors.iconGrey))),
          SizedBox(
            height: 10,
          ),
         commonTextField("Enter your Email-ID", defaultFontSize), SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Address",
                style: TextStyle(color: AppColors.iconGrey),
              )),
          SizedBox(
            height: 10,
          ),
         commonTextField("Enter your Address", defaultFontSize), SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Pincode",
                style: TextStyle(color: AppColors.iconGrey),
              )),
          SizedBox(
            height: 10,
          ),
         commonTextField("Enter your Pincode", defaultFontSize),
         SizedBox(
            height: 50,
          ),
          ScreenSizeButton("Proceed",context,BankDetailScreen.routeName)
        ])
      ]),
    );
  }
}
