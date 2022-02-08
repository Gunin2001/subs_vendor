// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/screens/OnboardingScreens/LoginScreen.dart';
import 'package:subs_vendor/screens/YourSubscriptionScreen.dart';

import 'OnboardingScreens/SignUpOtpScreen.dart';

class blank extends StatelessWidget {
  static String routeName = '/blank';

  const blank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(65),
          width: double.infinity,
          child: ElevatedButton(
            child: Text("Logout"),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(65),
          width: double.infinity,
          child: ElevatedButton(
            child: Text("Calendar Screen"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => YourSubscriptionScreen(
                        name: 'ABC',
                        startdate: DateTime.utc(2022, 2, 7),
                        enddate: DateTime.utc(2022, 2, 23),
                        interval: 7)),
              );
            },
          ),
        ),
      ]),
    );
  }
}
