// ignore_for_file: file_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/CustomerScreens/HomeScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/SignUpOtpScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/SignUpScreen.dart';

import '../BlankTargetScreen.dart';
import 'ResetPasswordScreen.dart';

class OtpControllerScreen extends StatefulWidget {
  static String routeName = '/otpController';
  final String phone;
  final String codeDigits;
  OtpControllerScreen({required this.phone, required this.codeDigits});

  @override
  _OtpControllerScreenState createState() => _OtpControllerScreenState();
}

class _OtpControllerScreenState extends State<OtpControllerScreen> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOtpController = TextEditingController();
  final FocusNode _pinOtpCodeFocus = FocusNode();
  String? verificationCode;

  final BoxDecoration pinOtpBoxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.grey,
      ));
  @override
  void initState() {
    super.initState();
    sendOtpCode();
  }

  sendOtpCode() async {
    print('otp sent');
    print(widget.phone);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.codeDigits + widget.phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          if (value.user != null && screenNumber == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SignUpScreen(phone: widget.codeDigits + widget.phone)),
            );
          } else if (value.user != null && screenNumber == 1) {
             Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ResetPasswordScreen(phone:widget.phone)),
            );
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message.toString()),
          duration: Duration(seconds: 4),
        ));
      },
      codeSent: (String vID, int? resentToken) {
        setState(() {
          verificationCode = vID;
        });
      },
      codeAutoRetrievalTimeout: (String vID) {
        setState(() {
          verificationCode = vID;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Otp Verification"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text("Verifying : ${widget.codeDigits}-${widget.phone}"),
          ),
          Padding(
            padding: EdgeInsets.all(40),
            child: PinPut(
              fieldsCount: 6,
              eachFieldHeight: height * 0.052,
              eachFieldWidth: width * 0.1,
              focusNode: _pinOtpCodeFocus,
              controller: _pinOtpController,
              submittedFieldDecoration: pinOtpBoxDecoration,
              selectedFieldDecoration: pinOtpBoxDecoration,
              followingFieldDecoration: pinOtpBoxDecoration,
              pinAnimationType: PinAnimationType.rotation,
              onSubmit: (pin) async {
                try {
                  FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: verificationCode!, smsCode: pin))
                      .then((value) {
                    if (value.user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignUpScreen(phone: widget.phone)),
                      );
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Invalid OTP"),
                    duration: Duration(seconds: 4),
                  ));
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () {
                sendOtpCode();
              },
              child: Text("Resend OTP"),
            ),
          )
        ],
      ),
    );
  }
}
