// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/SignUpapi.dart';
import 'package:subs_vendor/screens/OnboardingScreens/UserInfoScreen.dart';
import 'package:subs_vendor/shared_preferences/login_preferences.dart';
import 'package:subs_vendor/shared_preferences/token_preferences.dart';
import 'package:subs_vendor/shared_preferences/type_preference.dart';
import 'package:subs_vendor/widgets/CommonTextField.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';
import 'LoginScreen.dart';
import 'SignUpScreen.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/signUp";
  final String phone;
  const SignUpScreen({required this.phone});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final phonetxtController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool _isLoading = false;
  var isType;
  var type;

  @override
  void initState() {
    super.initState();
    getType();
    typePreference = TypePreference();
    phonetxtController.text = widget.phone;
  }

  getType() async {
    var isType = await typePreference!.getTypeStatus();
    type = isType ? 'Vendor' : "Customer";
    print(type.toString());
  }

  onSignUp() async {
    if (_form.currentState!.validate() == true) {
      setState(() {
        _isLoading = true;
      });
      var response = await SignUp.signUp(
          phonetxtController.text, passwordController.text, type.toString());

      if (response.statusCode == 200) {
        loginPreference?.setLoginStatus(true);
        setState(() {
          Navigator.pushNamed(context, ProfilePage.routeName);
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        loginPreference?.setLoginStatus(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Number is already registered"),
          duration: Duration(seconds: 4),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password doesn't match"),
        duration: Duration(seconds: 4),
      ));
    }
  }

  Widget build(BuildContext context) {
    double defaultFontSize = 14;
    double height, width;
height = MediaQuery.of(context).size.height;
width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _form,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            SizedBox(
              height: height*0.09,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "hello!",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: height*0.04),
                Container(
                  height: height*0.065,
                  child: TextField(
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.tileSelectGreen, width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.tileSelectGreen),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.tileSelectGreen),
                          borderRadius: BorderRadius.circular(15)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.tileSelectGreen),
                          borderRadius: BorderRadius.circular(15)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.tileSelectGreen),
                          borderRadius: BorderRadius.circular(15)),
                      disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.tileSelectGreen),
                          borderRadius: BorderRadius.circular(15)),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                          color: AppColors.iconGrey, fontSize: defaultFontSize),
                      hintText: "Enter you Phone Number",
                    ),
                    controller: phonetxtController,
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Container(
                  height: height*0.065,
                  child: TextFormField(
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.tileSelectGreen, width: 0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.tileSelectGreen),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.tileSelectGreen),
                            borderRadius: BorderRadius.circular(15)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.tileSelectGreen),
                            borderRadius: BorderRadius.circular(15)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.tileSelectGreen),
                            borderRadius: BorderRadius.circular(15)),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.tileSelectGreen),
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                            color: AppColors.iconGrey,
                            fontSize: defaultFontSize),
                        hintText: "Enter you password",
                      ),
                      controller: passwordController,
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Empty';
                        }
                        return null;
                      }),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Container(
                  // height: 50,
                  child: TextFormField(
                      showCursor: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.tileSelectGreen, width: 0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.tileSelectGreen),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.tileSelectGreen),
                            borderRadius: BorderRadius.circular(15)),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: AppColors.tileSelectGreen),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.tileSelectGreen),
                            borderRadius: BorderRadius.circular(15)),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.tileSelectGreen),
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                            color: AppColors.iconGrey,
                            fontSize: defaultFontSize),
                        hintText: "Confirm password",
                      ),
                      controller: confirmController,
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty) return 'Empty';
                        if (val != passwordController.text)
                          return "Password doesn't match";
                        return null;
                      }),
                ),
                SizedBox(
                  height: height*0.006,
                ),
                /* Container(
                  width: double.infinity,
                  child: Text(
                    "Password doesn't match!",
                    style: TextStyle(
                      color: Color.fromRGBO(249, 138, 138, 1),
                      fontSize: defaultFontSize,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),*/
                SizedBox(
                  height: height*0.052,
                ),
                Container(
                  width: width,
                  height: height*0.065,
                  child: TextButton(
                      onPressed: () async {
                        await onSignUp();
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.tileSelectGreen),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )),
                      child:  _isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height*0.04,
                                  width: width*0.075,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: width*0.05,
                                ),
                                Text(
                                  "Please Wait...",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )
                              ],
                            )
                          : Text(
                              'Sign Up',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                ),
                SizedBox(
                  height: height*0.013,
                ),
              ],
            ),
            SizedBox(height: height*0.364),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: defaultFontSize,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      )
                    },
                    child: Container(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.tileSelectGreen,
                          fontSize: defaultFontSize,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
