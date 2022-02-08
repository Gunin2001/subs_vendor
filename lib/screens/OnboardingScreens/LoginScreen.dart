// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subs_vendor/SharedPreferences_service.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/LoginApi.dart';
import 'package:subs_vendor/screens/OnboardingScreens/ChooseTypeScreen.dart';
import 'package:subs_vendor/screens/HomeScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/SignUpOtpScreen.dart';
import 'package:subs_vendor/shared_preferences/login_preferences.dart';
import 'package:subs_vendor/shared_preferences/token_preferences.dart';
import 'package:subs_vendor/widgets/CommonTextField.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  final String type = 'vendor';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void initState() {
    super.initState();
    loginPreference = LoginPreference();
    tokenPreference = TokenPreference();
  }

  _onSubmit() async {
    setState(() {
      _isLoading = true;
    });
    var response = await LoginApi.login(
        usernameController.text, passwordController.text, widget.type);
    if (response.statusCode == 200) {
      tokenPreference.setTokenPreferenceData(response.data['data'].toString());
      print(await tokenPreference.getTokenPreferenceData());
      loginPreference?.setLoginStatus(true);
      setState(() {
        Navigator.pushNamed(context, HomeScreen.routeName);
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      loginPreference?.setLoginStatus(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Username or Password doesn't match"),
        duration: Duration(seconds: 4),
      ));
    }
  }

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
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
                    keyboardType: TextInputType.phone,
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
                      hintText: "Enter your Phone Number",
                    ),
                    controller: usernameController,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  child: TextField(
                    obscureText: true,
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
                      hintText: "Enter your password",
                    ),
                    controller: passwordController,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                      color: AppColors.tileSelectGreen,
                      fontSize: defaultFontSize,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                      onPressed: () async {
                        await _onSubmit();
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
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Please Wait...",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )
                              ],
                            )
                          : Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(height: 350),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Don't have an account? ",
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
                        MaterialPageRoute(
                            builder: (context) => ChooseTypeScreen()),
                      )
                    },
                    child: Container(
                      child: Text(
                        "Register",
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
