// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: filetitles, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/Models/UserSubscriptionModel.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/GetSubscriptions%20copy.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';
import 'package:subs_vendor/widgets/NavDrawer.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';
import 'package:subs_vendor/widgets/Search_Bar.dart';

import '../CommonScreens.dart/AlertsScreen.dart';

class MyCustomerScreen extends StatefulWidget {
  static String routeName = "/mySubs";
  const MyCustomerScreen({Key? key}) : super(key: key);

  @override
  _MyCustomerScreenState createState() => _MyCustomerScreenState();
}

class _MyCustomerScreenState extends State<MyCustomerScreen> {
  fetchCustomers() async {
    UserSubModel? mapOfSubs = null;
    mapOfSubs = await getVendorCustomers(
      tokenProfile?.token,
    );
    print('In homescreen list');
    //print(mapOfSubs.data.toString());
    // final id = mapOfSubs.data.map((e) {
    //   print(e.id);
    //   return e.id;
    // });
    print(mapOfSubs);
    // final model = mapOfSubs.data.map((e) => Vendor.fromMap(e.da));
    //final model = Vendor.fromMap(mapOfSubs.data[0]);
    //print(model.toString());
    //print(id);
    return mapOfSubs!.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 13, right: 13, bottom: 5),
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
                Navigator.pushNamed(context, AlertsScreen.routeName);
              })
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(height: 25.0),
          Text(
            "Your Customers",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          FutureBuilder(
              future: fetchCustomers(),
              builder: (context, AsyncSnapshot list) {
                if (list.data != null) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.data.length,
                      itemBuilder: (context, index) {
                        return customerTile(
                            list.data[index]['customer_details'][0]['name'],
                            list.data[index]['interval'],
                            "Milk",
                            list.data[index]['amount'].toString(),
                            "Kilo",
                            Images[Random().nextInt(Images.length)],
                            context,
                            list.data[index]['customer_details'][0]['address']);
                      });
                } else {
                  return Container(
                    child: Center(
                      child: Text("Loading..."),
                    ),
                  );
                }
              })
          // customerTile("Rohit Sharma","Daily","Cow Milk","160","2 litre","lib/assets/images/person.png"
          // ,context,"House No. 12A,Block - D, Gangotri Apartments, Sector-11, Delhi-110085"),
        ],
      ),
    );
  }
}

Widget customerTile(String title, String interval, String prod, String price,
    String unit, String image, BuildContext context, String address) {
  return Card(
    elevation: 5.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 120.0,
              width: 120.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 0.0, bottom: 4, top: 12, left: 8),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(19, 19, 21, 1.0)),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 0.0, bottom: 4, top: 8, left: 8),
                          child: Text(
                            prod,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(19, 19, 21, 1.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 0.0, bottom: 4, top: 8, left: 8),
                          child: Text(interval,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(19, 19, 21, 1.0))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 0.0, bottom: 4, top: 8, left: 8),
                          child: SizedBox(
                            height: 45,
                            width: 130,
                            child: AutoSizeText(address,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(19, 19, 21, 1.0))),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "Rs." + price,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(19, 19, 21, 1.0)),
                        ),
                        Center(
                          child: Text(unit),
                        ),
                        SizedBox(height: 30)
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ScreenSizeButton("Tap to view more", context, blank.routeName),
        )
      ],
    ),
  );
}
