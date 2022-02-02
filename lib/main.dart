import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/screens/AddProdScreen.dart';
import 'package:subs_vendor/screens/BankDetailsScreen.dart';
import 'package:subs_vendor/screens/HomeScreen.dart';
import 'package:subs_vendor/screens/SignUpOtpScreen.dart';
import 'package:subs_vendor/screens/LoginScreen.dart';
import 'package:subs_vendor/screens/SignUpScreen.dart';
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
      initialRoute: AddProdScreen.routeName,
      routes: routes,
    );
  }
}
