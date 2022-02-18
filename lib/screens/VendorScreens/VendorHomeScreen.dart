// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:subs_vendor/Models/SearchModel.dart';
import 'package:subs_vendor/Models/UserSubscriptionModel.dart';
import 'package:subs_vendor/Models/Vendor_model.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/GetSubscriptions.dart';
import 'package:subs_vendor/api/SearchVendor.dart';
import 'package:subs_vendor/screens/CommonScreens.dart/AlertsScreen.dart';
import 'package:subs_vendor/screens/CommonScreens.dart/SettingsScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/AddSubScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/CustomSubscription.dart';
import 'package:subs_vendor/screens/CustomerScreens/FindVendor.dart';
import 'package:subs_vendor/screens/CustomerScreens/MySubscriptionsScreen.dart';
import 'package:subs_vendor/screens/VendorScreens/MyCustomers.dart';
import 'package:subs_vendor/screens/VendorScreens/OverviewScreen.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/widgets/Bar.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';
import 'package:subs_vendor/widgets/Product_Card.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';
import 'package:subs_vendor/widgets/Search_Bar.dart';

class VendorHomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const VendorHomeScreen({Key? key}) : super(key: key);

  @override
  _VendorHomeScreenState createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
 
final _inactiveColor = Colors.white;
  Widget _buildBottomBar() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: CustomAnimatedBottomBar(
        containerHeight: 70,
        backgroundColor: AppColors.tileSelectGreen,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 50,
       // curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: ImageIcon(
                    AssetImage('lib/assets/images/contacts.png')),
            title: Text(''),
            activeColor: Color.fromRGBO(255, 255, 255, 0.6),
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: ImageIcon(
                    AssetImage(
                      'lib/assets/images/tasks.png'),
                    ),
            title: Text(''),
            activeColor: Color.fromRGBO(255, 255, 255, 0.6),
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: ImageIcon(
                    AssetImage(
                      'lib/assets/images/icon4.png'),
                    ),
            title: Text(''),
            activeColor: Color.fromRGBO(255, 255, 255, 0.6),
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      Container(
        alignment: Alignment.center,
        child: MyCustomerScreen(),
      ),
      Container(
        alignment: Alignment.center,
        child:OverviewScreen()
        ),
      Container(
        alignment: Alignment.center,
        child: SettingsScreen()
      ),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _buildBottomBar(),
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
      body: getBody(),
      
    //   body:
    );
  }
}


