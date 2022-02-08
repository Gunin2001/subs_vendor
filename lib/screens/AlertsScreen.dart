// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/ApprovalsScreen.dart';
import 'package:subs_vendor/screens/NotificationsScreen.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({ Key? key }) : super(key: key);
  static String routeName = "/alerts";

  @override
  _AlertsScreenState createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  final _bottomNavigationBarItems = [
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left:13,right:13,bottom: 5),
        child: BottomNavBar(),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGrey,
        elevation: 0,
        title: Text("Alerts"),
        centerTitle: true,
      ),
      body: PageView(
        children: [
          ApprovalsScreen(),
          NotificationScreen()
        ],
      ),
    );
  }
}
