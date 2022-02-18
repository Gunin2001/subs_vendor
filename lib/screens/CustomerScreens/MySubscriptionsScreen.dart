// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: filetitles, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/Models/UserSubscriptionModel.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/GetSubscriptions.dart';
import 'package:subs_vendor/api/GetVendorCustomers.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/screens/CommonScreens.dart/YourSubscriptionScreen.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';
import 'package:subs_vendor/widgets/NavDrawer.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';
import 'package:subs_vendor/widgets/Search_Bar.dart';

import 'AddSubScreen.dart';

class MySubScreen extends StatefulWidget {
  static String routeName = "/mySubs";
  const MySubScreen({Key? key}) : super(key: key);

  @override
  _MySubScreenState createState() => _MySubScreenState();
}

class _MySubScreenState extends State<MySubScreen> {
   void initState() {
    super.initState();
    fetchCustomers();
  }

  fetchCustomers() async {
    UserSubModel? mapOfSubs = null;
    mapOfSubs = await getUserSubs(
      tokenProfile?.token,
    );
    print('In my customers list');
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
    double height, width;
height = MediaQuery.of(context).size.height;
width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
      padding: EdgeInsets.all(height*0.02),
      children: [
        SearchBar(),
        SizedBox(height:height*0.032),
        Text("Your Subscriptions",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        SizedBox(height:height*0.013),
        FutureBuilder(
              future: fetchCustomers(),
              builder: (context, AsyncSnapshot list) {
                if (list.data != null) {
                  return list.data.length == 0? SizedBox(
                    height: height*0.5,
                    child: Center(child: Text("No subscriptions found"))):ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: list.data.length,
                      itemBuilder: (context, index) {
                        return subTile(
                            list.data[index]['vendor_details'][0]['name'].toString(),
                            list.data[index]['interval'].toString(),
                            list.data[index]['productName'].toString(),
                            list.data[index]['amount'].toString(),
                            "${list.data[index]['quantity']} Kilo",
                            ImagesRect[Random().nextInt(ImagesRect.length)],
                            context,
                            list.data[index]['_id'].toString(),
                            list.data[index]['vendor'].toString(),
                            list.data[index]["status"]?"Your Sub is on HOLD":
                            list.data[index]['duedate'].toString()
                            ,height,width);
                      });
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
              ]
    ),
    );
  }
}
Widget subTile(String title, String interval, String prod, String price,
    String unit, String image, BuildContext context, String subID ,String vendorID ,String date , double height,double width) {
  return Card(
    elevation: 5.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:8.0,top: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: Image.asset(
                  image,
                  height: height*0.143,
                  width: height*0.143,
                ),
              ),
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
                          child: Text("Due on $date",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(19, 19, 21, 1.0))),
                        )
                      ],
                    ),
                    SizedBox(width: width*0.06,),
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
                        SizedBox(height: height*0.04)
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
    width: double.infinity,
    height: height*0.065,
    child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => YourSubscriptionScreen(
                                       ID: subID,
                                       vendor_ID: vendorID,
                                      ))
          
          );
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AppColors.tileSelectGreen),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            )),
        child: Text(
          "Tap to view more",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
  ),
        )
      ],
    ),
  );
}