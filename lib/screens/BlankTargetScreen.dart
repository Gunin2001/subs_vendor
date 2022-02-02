// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/screens/LoginScreen.dart';

import 'SignUpOtpScreen.dart';

class blank extends StatelessWidget {
  static String routeName = '/blank';

  const blank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
    );
  }
}
