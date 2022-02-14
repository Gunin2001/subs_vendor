// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/screens/OnboardingScreens/LoginScreen.dart';
import 'package:subs_vendor/screens/CommonScreens.dart/YourSubscriptionScreen.dart';
import 'package:subs_vendor/shared_preferences/login_preferences.dart';
import 'package:subs_vendor/shared_preferences/token_preferences.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/shared_preferences/type_preference.dart';

import 'OnboardingScreens/SignUpOtpScreen.dart';

class blank extends StatefulWidget {
  static String routeName = '/blank';
  const blank({Key? key}) : super(key: key);

  @override
  _blankState createState() => _blankState();
}

class _blankState extends State<blank> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginPreference = LoginPreference();
    tokenPreference = TokenPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
