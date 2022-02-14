// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/Models/SearchModel.dart';
import 'package:subs_vendor/Models/UserSubscriptionModel.dart';
import 'package:subs_vendor/Models/Vendor_model.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/GetSubscriptions.dart';
import 'package:subs_vendor/api/SearchVendor.dart';
import 'package:subs_vendor/screens/CommonScreens.dart/AlertsScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/AddSubScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/CustomSubscription.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';
import 'package:subs_vendor/widgets/Product_Card.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';
import 'package:subs_vendor/widgets/Search_Bar.dart';

var mapOfSubs = null;

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    mapOfSubs = null;
  }

  bool _isLoading = false;

  fetchVendor(String phoneno) async {
    mapOfSubs = await getSearch(tokenProfile?.token, phoneno);
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
    return mapOfSubs;
  }

  Widget build(BuildContext context) {
    double height, width;
height = MediaQuery.of(context).size.height;
width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 13, right: 13, bottom: 5),
        child: BottomNavBar(),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          Container(
            height: height*0.065,
            child: TextField(
              autofocus: false,
              cursorColor: AppColors.iconGrey,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: AppColors.iconGrey),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.sideMenuGreen, width: 0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.iconGrey),
                    borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.iconGrey),
                    borderRadius: BorderRadius.circular(15)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.iconGrey),
                    borderRadius: BorderRadius.circular(15)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.iconGrey),
                    borderRadius: BorderRadius.circular(15)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.iconGrey),
                    borderRadius: BorderRadius.circular(15)),
                hintText: "Search e.g 9899125432",
                hintStyle: TextStyle(fontSize: 14, color: AppColors.iconGrey),
              ),
              controller: searchController,
              onSubmitted: (value) async {
                setState(() {
                  mapOfSubs = [''];
                  _isLoading = true;
                });
                if (searchController.text.length == 10) {
                  var list = await fetchVendor(value);
                  setState(() {
                    mapOfSubs = list;
                    _isLoading = false;
                  });
                } else {
                  setState(() {
                    _isLoading = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text("Enter a Valid Number"),
                    duration: Duration(seconds: 4),
                  ));
                }
              },
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(height: height*0.032),
          ScreenSizeButton(
              "Add a Custom Subscription", context, CustomSubScreen.routeName),
          SizedBox(height: height*0.032),
          mapOfSubs == null
              ? ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: height*0.052),
                    Image.asset(
                      "lib/assets/images/EmptySearch.png",
                      height: height*0.234,
                      width: height*0.234,
                    ),
                  ],
                )
              : _isLoading
                  ? SizedBox(height: height*0.156,child: Center(child: CircularProgressIndicator()))
                  : mapOfSubs == true
                      ? Text(
                          "Contact not listed try adding a custom subscription")
                      : mapOfSubs['isVendor']
                          ? vendorTile(mapOfSubs['name'], mapOfSubs['phoneno'],
                              'abc', 'lib/assets/images/milk.png', context,height)
                          : Text("Vendor Not Found"),

          // FutureBuilder(
          //     future: fetchSubs(),
          //     builder: (context, AsyncSnapshot list) {
          //       if (list.data != null) {
          //         return ListView.builder(
          //           shrinkWrap: true,
          //             itemCount: list.data.length,
          //             itemBuilder: (context, index) {
          //               return productTile(
          //                   list.data[index]['vendor_details'][0]['name'],
          //                   list.data[index]['vendor_details'][0]['phoneno'],
          //                   list.data[index]['vendor_details'][0]['name'],
          //                   "80",
          //                   "litre",
          //                   "lib/assets/images/milk.png",
          //                   context,
          //                   EditProdScreen.routeName);
          //             });
          //       } else {
          //         return Container(
          //           child: Center(
          //             child: Text("Loading..."),
          //           ),
          //         );
          //       }
          //     })
        ],
      ),
    );
  }
}

Widget vendorTile(String name, String phoneno, String desc, String image,
    BuildContext context,double height) {
  return Card(
    elevation: 5.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          height: height*0.156,
          width: height*0.156,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 0.0, bottom: 4, top: 12, left: 8),
              child: Text(
                name,
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
                        "+91 " + phoneno,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(19, 19, 21, 1.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 0.0, bottom: 4, top: 8, left: 8),
                      child: Text(desc,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(19, 19, 21, 1.0))),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Add to Subscription",
                    style: TextStyle(
                      color: Color.fromRGBO(74, 90, 152, 1),
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("sub added");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddSubScreen(
                                      vendorName: name,
                                      phoneNo: phoneno,
                                    )));
                      }),
              ),
            )
          ],
        )
      ],
    ),
  );
}
