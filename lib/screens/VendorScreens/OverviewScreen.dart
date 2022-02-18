// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/CommonScreens.dart/AlertsScreen.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';
import 'package:subs_vendor/widgets/Search_Bar.dart';

class OverviewScreen extends StatefulWidget {
  static var routeName = '/overview';

  const OverviewScreen({Key? key}) : super(key: key);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    double height, width;
height = MediaQuery.of(context).size.height;
width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(height: height*0.032),
          Text(
            "Today's Overview",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height*0.013,
          ),
          Row(
            children: [
              Card(
                color: AppColors.primaryGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: height*0.09,
                  width: width*0.29,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sales Today:"),
                      SizedBox(
                        height: 4,
                      ),
                      Text('3500',
                          style: TextStyle(
                              color: Color.fromRGBO(74, 90, 152, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              Card(
                color: AppColors.primaryGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: height*0.09,
                  width: width*0.29,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" Pending Orders"),
                      SizedBox(
                        height: 4,
                      ),
                      Text('14',
                          style: TextStyle(
                              color: Color.fromRGBO(74, 90, 152, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              Card(
                color: AppColors.primaryGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: height*0.09,
                  width: width*0.29,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Delivered Orders"),
                      SizedBox(
                        height: 4,
                      ),
                      Text('60',
                          style: TextStyle(
                              color: Color.fromRGBO(74, 90, 152, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: height*0.02,
          ),
          Text(
            "Recent Transactions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height*0.02,
          ),
          SearchBar(),
          SizedBox(
            height: height*0.02,
          ),
          cashNotificationCard(width, height),
        ],
      ),
    );
  }
}

Widget cashNotificationCard(double width, double height) {
  return Card(
    color: AppColors.primaryGrey,
    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: height*0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: width*0.0125,),
            ClipOval(
              child: Image.asset(
                Images[Random().nextInt(Images.length)],
                height: height*0.065,
                width: width*0.11,),
            ),
            SizedBox(width: width*0.025,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Riyaz Mohammed',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                Text('through UPI')
              ],),
            SizedBox(width: width*0.16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Rs 320',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('11:32 am',style: TextStyle(color: AppColors.iconGrey),)
              ],
            )

          ],
        ),
      ),
    ),
  );
}
