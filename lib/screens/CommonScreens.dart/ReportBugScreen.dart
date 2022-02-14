// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';

class ReportBugScreen extends StatefulWidget {
  static String routeName = "/report";
  const ReportBugScreen({ Key? key }) : super(key: key);

  @override
  _ReportBugScreenState createState() => _ReportBugScreenState();
}

class _ReportBugScreenState extends State<ReportBugScreen> {
  @override
  Widget build(BuildContext context) {
    double height, width;
height = MediaQuery.of(context).size.height;
width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGrey,
        elevation: 0,
        title: Text("Subscription App"),
        centerTitle: true,
      ),
      body:ListView(
        children: [
          Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "title",
            style: TextStyle(color: AppColors.iconGrey),
          )),
      SizedBox(
        height: height*0.013,
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
            hintStyle: TextStyle(color: AppColors.iconGrey, fontSize: 14),
            hintText: "hint",
          ),
          textCapitalization: TextCapitalization.sentences,
        ),
      ),
      SizedBox(height: height*0.02,)
        ],
      )
      
      );
  }
}