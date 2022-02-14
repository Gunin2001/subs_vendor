// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class SubSuccess extends StatefulWidget {
  const SubSuccess({Key? key}) : super(key: key);
  static String routeName = "/subSuccess";
  @override
  _SubSuccessState createState() => _SubSuccessState();
}

class _SubSuccessState extends State<SubSuccess> {
  late Timer _timer;
  _SubSuccessState()
  {
    _timer = Timer( const Duration(seconds: 3),(){
      setState(() {
       Navigator.pushNamed(context, HomeScreen.routeName);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Gupta Dairy",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Image.asset('lib/assets/images/success.png'),
        ));
  }
}
