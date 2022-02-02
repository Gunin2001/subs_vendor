// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/UpdateBankDetailsApi.dart';
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
  final accountHolderNameController = TextEditingController();
  final accountNoController = TextEditingController();
  final ifscCodeController = TextEditingController();
  final upiController = TextEditingController();
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
          Container(
    height: 50,
    child: TextField(
      showCursor: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.tileSelectGreen, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.white,
        hintStyle:
            TextStyle(color: AppColors.iconGrey, fontSize: defaultFontSize),
        hintText: "Enter your account number",
      ),
      controller: accountNoController,
    ),
  ),
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
         Container(
    height: 50,
    child: TextField(
      showCursor: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.tileSelectGreen, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.white,
        hintStyle:
            TextStyle(color: AppColors.iconGrey, fontSize: defaultFontSize),
        hintText: "Enter account holder name:",
      ),
      controller: accountHolderNameController,
    ),
  ),
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("IFSC Code",
                  style: TextStyle(color: AppColors.iconGrey))),
          SizedBox(
            height: 10,
          ),Container(
    height: 50,
    child: TextField(
      showCursor: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.tileSelectGreen, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.white,
        hintStyle:
            TextStyle(color: AppColors.iconGrey, fontSize: defaultFontSize),
        hintText: "Enter IFSC Code",
      ),
      controller: ifscCodeController,
    ),
  ),
          
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
          Container(
    height: 50,
    child: TextField(
      showCursor: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.tileSelectGreen, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.tileSelectGreen),
            borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.white,
        hintStyle:
            TextStyle(color: AppColors.iconGrey, fontSize: defaultFontSize),
        hintText: "Enter Upi ID or Phone Number",
      ),
      controller: upiController,
    ),
  )
          ,
          SizedBox(height: 180,),
          Container(
    width: double.infinity,
    height: 50,
    child: TextButton(
        onPressed: () async {
                      var response = await UpdateBankDetails.updateBank(
                        accountNoController.text,
                        accountHolderNameController.text,
                        ifscCodeController.text,
                        upiController.text
                      );
                      if (response == 200) {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      }
                    },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AppColors.tileSelectGreen),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            )),
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
  ),
          ]
           ,
      )
      );
  }
}