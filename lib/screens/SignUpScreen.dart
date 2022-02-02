// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subs_vendor/SharedPreferences_service.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/UserInfoScreen.dart';
import 'package:subs_vendor/widgets/CommonTextField.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

import '../api/SignUpapi.dart';
import 'LoginScreen.dart';
import 'SignUpScreen.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/signUp";
  final String phone;
  const SignUpScreen({required this.phone});
  final String type = 'vendor';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final phonetxtController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phonetxtController.text = widget.phone;
  }

  Widget build(BuildContext context) {
    double defaultFontSize = 14;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _form,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            SizedBox(
              height: 70,
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
                SizedBox(height: 30),
                Container(
                  height: 50,
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
                  height: 15,
                ),
                Container(
                  height: 50,
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
                  height: 15,
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
                  height: 5,
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
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                      onPressed: () async {
                        if (_form.currentState!.validate() == true) {
                          var response = await SignUp.signUp(
                              phonetxtController.text,
                              passwordController.text,
                              widget.type);

                          if (response.statusCode == 200) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('phone', phonetxtController.text);
                            prefs.setString(
                                'UserToken', response.data['data'].toString());
                            print('${prefs.getString('UserToken')}');
                            print('${prefs.getString('phone')}');
                            Navigator.pushNamed(context, ProfilePage.routeName);
                          } else {
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
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.tileSelectGreen),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(height: 280),
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
