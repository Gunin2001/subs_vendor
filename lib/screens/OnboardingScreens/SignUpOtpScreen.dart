// ignore_for_file: file_names, prefer_const_constructors

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/OnboardingScreens/OTPcontrollerScreen.dart';

class SignUpOtpScreen extends StatefulWidget {
  const SignUpOtpScreen({Key? key}) : super(key: key);
  static String routeName = '/loginOTP';

  @override
  _SignUpOtpScreenState createState() => _SignUpOtpScreenState();
}

class _SignUpOtpScreenState extends State<SignUpOtpScreen> {
  String dialCodeDigits = '+91';
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height, width;
height = MediaQuery.of(context).size.height;
width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height*0.13,
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text("Phone (OTP) Verification",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                )),
            SizedBox(
              height: height*0.065,
            ),
            SizedBox(
              width: width,
              height: height*0.08,
              child: CountryCodePicker(
                onChanged: (country) {
                  setState(() {
                    dialCodeDigits = country.dialCode!;
                  });
                },
                initialSelection: 'IN',
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                favorite: ["+91", "IN"],
              ),
            ),
            Container(
              height: height*0.1,
              margin: EdgeInsets.only(left: 15, right: 15),
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
                    hintStyle:
                        TextStyle(color: AppColors.iconGrey, fontSize: 18),
                    hintText: "Phone Number",
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(dialCodeDigits),
                    )),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: height*0.065,
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.tileSelectGreen),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => OtpControllerScreen(
                            phone: _controller.text,
                            codeDigits: dialCodeDigits)));
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
