

// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:subs_vendor/screens/CommonScreens.dart/AlertsScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/AddSubScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/MySubscriptionsScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/SubSuccessScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/BankDetailsScreen.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/ChooseTypeScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/CustomSubscription.dart';
import 'package:subs_vendor/screens/CustomerScreens/HomeScreen.dart';
import 'package:subs_vendor/screens/CommonScreens.dart/SettingsScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/SignUpOtpScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/LoginScreen.dart';
import 'package:subs_vendor/screens/VendorScreens/MyCustomers.dart';
import 'package:subs_vendor/screens/OnboardingScreens/OTPcontrollerScreen.dart';
import 'package:subs_vendor/screens/VendorScreens/OverviewScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/WelcomeScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/UserInfoScreen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfilePage.routeName: (context) => ProfilePage(),
  BankDetailScreen.routeName: (context) => BankDetailScreen(),
  MyCustomerScreen.routeName:(context) => MyCustomerScreen(),
  SignUpOtpScreen.routeName:(context) => SignUpOtpScreen(),
  AlertsScreen.routeName: (context) => AlertsScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  CustomSubScreen.routeName: (context) => CustomSubScreen(),
  ChooseTypeScreen.routeName: (context) => ChooseTypeScreen(),
  OverviewScreen.routeName: (context) => OverviewScreen(),
  SubSuccess.routeName: (context) => SubSuccess(),
  MySubScreen.routeName: (context) => MySubScreen(),
  blank.routeName: (context) => blank(),
};