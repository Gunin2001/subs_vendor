// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: filetitles, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';
import 'package:subs_vendor/widgets/NavDrawer.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';
import 'package:subs_vendor/widgets/Search_Bar.dart';

class MyCustomerScreen extends StatefulWidget {
  static String routeName = "/mySubs";
  const MyCustomerScreen({Key? key}) : super(key: key);

  @override
  _MyCustomerScreenState createState() => _MyCustomerScreenState();
}

class _MyCustomerScreenState extends State<MyCustomerScreen> {
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
      body: MyCustomerScreenBody(),
    );
  }
}
class MyCustomerScreenBody extends StatefulWidget {
  const MyCustomerScreenBody({Key? key}) : super(key: key);

  @override
  _MyCustomerScreenBodyState createState() => _MyCustomerScreenBodyState();
}

class _MyCustomerScreenBodyState extends State<MyCustomerScreenBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        SearchBar(),
        SizedBox(height:25.0),
        Text("Your Subscriptions",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        SizedBox(height:10.0),
        subTile("Gupta Dairy","Daily","Cow Milk","160","2 litre","lib/assets/images/milk.png"
        ,context,"8th Feb 2022"),
        SizedBox(height:10.0),
        subTile("Vikas Poultry","Daily","Eggs","320","2 trays","lib/assets/images/eggs.png"
        ,context,"8th Feb 2022"),
        SizedBox(height:10.0),
        subTile("Gupta Dairy","Daily","Cow Milk","80","litre","lib/assets/images/milk.png"
        ,context,"8th Feb 2022"),
      ],
    );
  }
}

Widget subTile(String title, String interval, String prod, String price,
    String unit, String image, BuildContext context,String date) {
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
                          child: Text("Due on $date",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(19, 19, 21, 1.0))),
                        )
                      ],
                    ),
                    SizedBox(width: 20,),
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
       
      ],
    ),
  );
}