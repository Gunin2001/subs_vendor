// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/ResetPasswordApi.dart';
import 'package:subs_vendor/screens/OnboardingScreens/LoginScreen.dart';
import 'package:subs_vendor/shared_preferences/token_preferences.dart';

class ResetPasswordScreen extends StatefulWidget {
  static var routeName = '/reset';
  final String phone;
  ResetPasswordScreen({required this.phone});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    tokenPreference = TokenPreference();
  }

  onReset() async {
    if (_form.currentState!.validate() == true) {
      setState(() {
        _isLoading = true;
      });
      var response = await ResetApi.resetPassword(
        widget.phone,
        passwordController.text,
      );

      if (response.statusCode == 200) {
        setState(() {
          Navigator.pushNamed(context, LoginScreen.routeName);
        });
      }
      // } else {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("Number is already registered"),
      //     duration: Duration(seconds: 4),
      //   ));
      // }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password doesn't match"),
        duration: Duration(seconds: 4),
      ));
    }
  }

  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Form(
      key: _form,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(padding: EdgeInsets.all(20), children: <Widget>[
              SizedBox(
                height: height * 0.08,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                  Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: height * 0.04),
                Container(
                  height: height * 0.065,
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
                        hintStyle:
                            TextStyle(color: AppColors.iconGrey, fontSize: 14),
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
                  height: height * 0.02,
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
                        hintStyle:
                            TextStyle(color: AppColors.iconGrey, fontSize: 14),
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
                  height: height * 0.065,
                ),
                Container(
                  width: width,
                  height: height * 0.065,
                  child: TextButton(
                      onPressed: () async {
                        await onReset();
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.tileSelectGreen),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )),
                      child: _isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.075,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.05,
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
              ])
            ])));
  }
}
