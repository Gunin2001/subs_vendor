// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: filetitles, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/Models/UserSubscriptionModel.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/GetVendorCustomers.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';
import 'package:subs_vendor/widgets/NavDrawer.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';
import 'package:subs_vendor/widgets/Search_Bar.dart';

import '../CommonScreens.dart/AlertsScreen.dart';

class MyCustomerScreen extends StatefulWidget {
  static String routeName = "/myCustomers";
  const MyCustomerScreen({Key? key}) : super(key: key);

  @override
  _MyCustomerScreenState createState() => _MyCustomerScreenState();
}

class _MyCustomerScreenState extends State<MyCustomerScreen> {
  @override
  void initState() {
    super.initState();
    fetchCustomers();
  }

  fetchCustomers() async {
    UserSubModel? mapOfSubs = null;
    mapOfSubs = await getVendorCustomers(
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
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(height: height * 0.032),
          Text(
            "Your Customers",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: height * 0.013),
          FutureBuilder(
              future: fetchCustomers(),
              builder: (context, AsyncSnapshot list) {
                if (list.data != null) {
                  return list.data.length ==0 ?Text("No customers"):ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: list.data.length,
                      itemBuilder: (context, index) {
                        print("In listview");
                        print(list.data);
                        return customerTile(
                                list.data[index]['customer_details'][0]['name'],
                                list.data[index]['interval'].toString(),
                                "Milk",
                                list.data[index]['amount'].toString(),
                                "Kilo",
                                ImagesRect[Random().nextInt(ImagesRect.length)],
                                context,
                                list.data[index]['customer_details'][0]
                                        ['address']
                                    .toString(),
                                height,
                                width);
                      });
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
          // customerTile("Rohit Sharma","Daily","Cow Milk","160","2 litre","lib/assets/images/person.png"
          // ,context,"House No. 12A,Block - D, Gangotri Apartments, Sector-11, Delhi-110085"),
        ],
      ),
    );
  }
}

Widget customerTile(
    String title,
    String interval,
    String prod,
    String price,
    String unit,
    String image,
    BuildContext context,
    String address,
    double height,
    double width) {
  return Card(
    elevation: 5.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        SizedBox(
          height: height * 0.006,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.012,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                image,
                height: height * 0.156,
                width: width * 0.3,
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
                          child: SizedBox(
                            height: height * 0.065,
                            width: width * 0.325,
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
                      width: width * 0.025,
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
                        SizedBox(height: height * 0.04)
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
