

// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:subs_vendor/screens/AddProdScreen.dart';
import 'package:subs_vendor/screens/BankDetailsScreen.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/screens/EditProdScreen.dart';
import 'package:subs_vendor/screens/HomeScreen.dart';
import 'package:subs_vendor/screens/LoginScreen.dart';
import 'package:subs_vendor/screens/MyCustomers.dart';
import 'package:subs_vendor/screens/SignUpScreen.dart';
import 'package:subs_vendor/screens/WelcomeScreen.dart';
import 'package:subs_vendor/screens/UserInfoScreen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfilePage.routeName: (context) => ProfilePage(),
  BankDetailScreen.routeName: (context) => BankDetailScreen(),
  EditProdScreen.routeName:(context) => EditProdScreen(),
  AddProdScreen.routeName:(context) => AddProdScreen(),
  MyCustomerScreen.routeName:(context) => MyCustomerScreen(),
  blank.routeName: (context) => blank(),
};