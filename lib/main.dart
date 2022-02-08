import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/screens/AddProdScreen.dart';
import 'package:subs_vendor/screens/AlertsScreen.dart';
import 'package:subs_vendor/screens/BankDetailsScreen.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/ChooseTypeScreen.dart';
import 'package:subs_vendor/screens/CustomSubscription.dart';
import 'package:subs_vendor/screens/EditProdScreen.dart';
import 'package:subs_vendor/screens/HomeScreen.dart';
import 'package:subs_vendor/screens/MyCustomers.dart';
import 'package:subs_vendor/screens/OnboardingScreens/SignUpOtpScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/LoginScreen.dart';
import 'package:subs_vendor/screens/UserInfoScreen.dart';
import 'package:subs_vendor/screens/WelcomeScreen.dart';

import 'Utils/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Museo',
        primarySwatch: Colors.grey,
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
