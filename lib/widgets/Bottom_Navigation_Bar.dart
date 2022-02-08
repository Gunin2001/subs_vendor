
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/screens/HomeScreen.dart';
import 'package:subs_vendor/screens/MyCustomers.dart';
import 'package:subs_vendor/screens/SettingsScreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var currentIndex = 0;
  @override
  
  Widget build(BuildContext context) {
    double displayWidth = (MediaQuery.of(context).size.width);
    return  Container(
        margin: EdgeInsets.only(bottom: displayWidth * .05),
        height: displayWidth * .22,
        decoration: BoxDecoration(
          color: Color.fromRGBO(84, 177, 117, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .05),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
                Navigator.pushNamed(context, routeNames[index]);
              });
            },
            splashColor: Colors.white,
            highlightColor: Colors.white,
            child: Row(children: [
              SizedBox(width: displayWidth * .04),
              ImageIcon(
               AssetImage(listOfIcons[index]),
               size: displayWidth * .07,
                     color: index == currentIndex
                        ? Colors.white
                        : Color.fromRGBO(255, 255, 255, 0.6),
                  ),
              SizedBox(width: displayWidth * .115)
            ] 
              )
            ),
          )
    );
  }

  List<String> listOfIcons = [
    'lib/assets/images/fruitsbasket.png',
    'lib/assets/images/contacts.png',
    'lib/assets/images/tasks.png',
    'lib/assets/images/icon4.png',

    /*Icons.shopping_basket_outlined,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.ac_unit */
  ];
  List<String> routeNames = [
    HomeScreen.routeName,
    MyCustomerScreen.routeName,
    blank.routeName,
    SettingsScreen.routeName,
  ];
}
