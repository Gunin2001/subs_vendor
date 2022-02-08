

// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:subs_vendor/screens/AddProdScreen.dart';
import 'package:subs_vendor/screens/AlertsSCreen.dart';
import 'package:subs_vendor/screens/BankDetailsScreen.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/ChooseTypeScreen.dart';
import 'package:subs_vendor/screens/CustomSubscription.dart';
import 'package:subs_vendor/screens/EditProdScreen.dart';
import 'package:subs_vendor/screens/HomeScreen.dart';
import 'package:subs_vendor/screens/SettingsScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/SignUpOtpScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/LoginScreen.dart';
import 'package:subs_vendor/screens/MyCustomers.dart';
import 'package:subs_vendor/screens/OnboardingScreens/OTPcontrollerScreen.dart';
import 'package:subs_vendor/screens/WelcomeScreen.dart';
import 'package:subs_vendor/screens/UserInfoScreen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfilePage.routeName: (context) => ProfilePage(),
  BankDetailScreen.routeName: (context) => BankDetailScreen(),
  EditProdScreen.routeName:(context) => EditProdScreen(),
  AddProdScreen.routeName:(context) => AddProdScreen(),
  MyCustomerScreen.routeName:(context) => MyCustomerScreen(),
  SignUpOtpScreen.routeName:(context) => SignUpOtpScreen(),
  AlertsScreen.routeName: (context) => AlertsScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  CustomSubScreen.routeName: (context) => CustomSubScreen(),
  ChooseTypeScreen.routeName: (context) => ChooseTypeScreen(),
  blank.routeName: (context) => blank(),
};