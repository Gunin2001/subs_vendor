// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/AddProdScreen.dart';
import 'package:subs_vendor/screens/EditProdScreen.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';
import 'package:subs_vendor/widgets/Product_Card.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';
import 'package:subs_vendor/widgets/Search_Bar.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: Text("Subscription App"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: AppColors.iconBlack,
              ),
              onPressed: () {
                // do something
              })
        ],
      ),
      body: HomeScreenBody(),
    );
  }
}
class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        SearchBar(),
        SizedBox(height:25.0),
        ScreenSizeButton("Add a Product", context, AddProdScreen.routeName),
        SizedBox(height: 25),
        Text("Your Products",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        SizedBox(height:10.0),
        productTile("Gupta Dairy","9999999999","Cow Milk","80","litre","lib/assets/images/milk.png",context,EditProdScreen.routeName),
        SizedBox(height:10.0),
        productTile("Gupta Dairy","9999999999","Cow Milk","80","litre","lib/assets/images/milk.png",context,EditProdScreen.routeName),
        SizedBox(height:10.0),
        productTile("Gupta Dairy","9999999999","Cow Milk","80","litre","lib/assets/images/milk.png",context,EditProdScreen.routeName),
      ],
    );
  }
}