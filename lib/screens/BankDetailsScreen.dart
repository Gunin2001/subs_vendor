// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/widgets/CommonTextField.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

import 'HomeScreen.dart';

class BankDetailScreen extends StatefulWidget {
  static String routeName = '/bank';

  const BankDetailScreen({ Key? key }) : super(key: key);

  @override
  _BankDetailScreenState createState() => _BankDetailScreenState();
}

class _BankDetailScreenState extends State<BankDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double defaultFontSize = 14;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGrey,
        elevation: 0,
        title: Text("Bank Details"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body:ListView(
        padding: EdgeInsets.all(10), 
        children:[
          SizedBox(height:15),
          Text("Account Details",
          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
          SizedBox(height:15),
          Align(
              alignment: Alignment.centerLeft,
              child:
                  Text("Account Number:", style: TextStyle(color: AppColors.iconGrey))),
          SizedBox(
            height: 10,
          ),
          commonTextField("Enter your Account Number", defaultFontSize),
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Account Holder Name :",
                  style: TextStyle(color: AppColors.iconGrey))),
          SizedBox(
            height: 10,
          ),
         commonTextField("Enter Account Holder Name :", defaultFontSize),
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("IFSC Code",
                  style: TextStyle(color: AppColors.iconGrey))),
          SizedBox(
            height: 10,
          ),
          commonTextField("Enter IFSC Code", defaultFontSize),
          SizedBox(
            height: 10,
          ),
          SizedBox(height:5),
          Text("UPI Details",
          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
          SizedBox(height:15),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("UPI ID or Phone Number",
                  style: TextStyle(color: AppColors.iconGrey))),
          SizedBox(
            height: 10,
          ),
          commonTextField("Enter your UPI ID or Phone Number", defaultFontSize),
          SizedBox(height: 180,),
          ScreenSizeButton("Submit",context,HomeScreen.routeName),
          ]
           ,
      )
      );
  }
}