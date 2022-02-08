// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/OnboardingScreens/SignUpOtpScreen.dart';
import 'package:subs_vendor/shared_preferences/type_preference.dart';

class ChooseTypeScreen extends StatelessWidget {
  static var routeName = '/type';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(height: 60,),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Describe Yourself!",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 200,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: TextButton(
                onPressed: () async {
                  typePreference?.settypeStatus('Customer');
                  Navigator.pushNamed(context, SignUpOtpScreen.routeName);
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
          SizedBox(height: 15,),
          Container(
            width: double.infinity,
            height: 50,
            child: TextButton(
                onPressed: () async {
                  typePreference?.settypeStatus('Vendor');
                  Navigator.pushNamed(context, SignUpOtpScreen.routeName);
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
