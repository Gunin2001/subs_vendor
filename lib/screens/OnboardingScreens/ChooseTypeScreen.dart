// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/OnboardingScreens/SignUpOtpScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/SignUpScreen.dart';
import 'package:subs_vendor/shared_preferences/type_preference.dart';

class ChooseTypeScreen extends StatefulWidget {
  static var routeName = '/choose';

  const ChooseTypeScreen({Key? key}) : super(key: key);

  @override
  _ChooseTypeScreenState createState() => _ChooseTypeScreenState();
}

class _ChooseTypeScreenState extends State<ChooseTypeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    typePreference = TypePreference();
  }

  @override
  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(
            height: height * 0.08,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Describe Yourself!",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: height * 0.26,
          ),
          Container(
            width: width,
            height: height * 0.065,
            child: TextButton(
                onPressed: () async {
                  typePreference?.setTypeStatus(false);
                  ConstantType = false;
                  Navigator.pushNamed(context, SignUpOtpScreen.routeName);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const SignUpScreen(phone: '99999999899')));
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
                  'Customer',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            width: width,
            height: height * 0.065,
            child: TextButton(
                onPressed: () async {
                  typePreference?.setTypeStatus(true);
                  ConstantType = true;
                  Navigator.pushNamed(context, SignUpOtpScreen.routeName);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const SignUpScreen(phone: '99999999899')));
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
                  'Vendor',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          )
        ],
      ),
    );
  }
}
