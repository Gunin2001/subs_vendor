import 'package:flutter/material.dart';
import 'package:subs_vendor/screens/AddProdScreen.dart';
import 'package:subs_vendor/screens/HomeScreen.dart';
import 'package:subs_vendor/screens/WelcomeScreen.dart';

import 'Utils/Routes.dart';

void main() {
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
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}

