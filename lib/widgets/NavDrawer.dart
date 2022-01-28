// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
/*
import 'package:flutter/material.dart';
import 'package:subscription_app/Utils/Constants.dart';
import 'package:subscription_app/screens/CustomSubscription.dart';
import 'package:subscription_app/screens/DairyScreen.dart';
import 'package:subscription_app/screens/GroceryScreen.dart';
import 'package:subscription_app/screens/NewspaperScreen.dart';

int isSelected = 0;

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  late Color color;
  late Color color1;
  late Color color2;
  late Color color3;
  late Color color4;

  @override
  void initState() {
    super.initState();

    color = Colors.transparent;
    color1 = Colors.transparent;
    color2 = Colors.transparent;
    color3 = Colors.transparent;
    color4 = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          padding: EdgeInsets.only(right: 30),
      color: AppColors.sideMenuGreen,
      child: Column(children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 15,),
              Container(
                height: 130,
                child: DrawerHeader(
                  child: Text(
                    'Shop',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.sideMenuGreen,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Categories",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Container(
                decoration:
                BoxDecoration(
                  color: color,
                  borderRadius:  BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                ),
                child: ListTile(
                  title: Text('Newspaper'),
                  onTap: () => {
                    setState(() {
                      color = AppColors.tileSelectGreen;
                      color1 = Colors.transparent;
                      color2 = Colors.transparent;
                      color3 = Colors.transparent;
                    }),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => NewspaperScreen(),
              ))
                  }
                ),
              ),
              Container(
                decoration:
                BoxDecoration(
                  color: color1,
                  borderRadius:  BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                ),
                child: ListTile(
                  title: Text('Milk'),
                  onTap: () => {
                    setState(() {
                      color1 = AppColors.tileSelectGreen;
                      color = Colors.transparent;
                      color2 = Colors.transparent;
                      color3 = Colors.transparent;
                    }),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => DairyScreen(),
              )
                    )}
                ),
              ),
              Container(
                decoration:
                BoxDecoration(
                  color: color2,
                  borderRadius:  BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                ),
                child: ListTile(
                  title: Text('Grocery'),
                  onTap: () => {
                    setState(() {
                      color2 = AppColors.tileSelectGreen;
                      color1 = Colors.transparent;
                      color = Colors.transparent;
                      color3 = Colors.transparent;
                    })
                    ,
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => GroceryScreen(),
              ))
                  }
                ),
              ),
              Container(
                decoration:
                BoxDecoration(
                  color: color3,
                  borderRadius:  BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                ),
                child: ListTile(
                  title: Text('Custom'),
                  onTap: () => {
                    setState(() {
                      color3 = AppColors.tileSelectGreen;
                      color1 = Colors.transparent;
                      color2 = Colors.transparent;
                      color = Colors.transparent;
                    }),
                    Navigator.pushNamed(context, CustomSubScreen.routeName)
                  }
                ),
              ),
            ],
          ),
        ),
        Container(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                    child: Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                      title: Text('Help center'),
                      onTap: () {},
                      selectedTileColor: AppColors.tileSelectGreen,
                    ),
                    ListTile(title: Text('About')),
                    Padding(
                      padding: const EdgeInsets.only(left:30.0),
                      child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(250, double.minPositive)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              )),
                          child: Text(
                            "Logout",
                            style: TextStyle(color: Colors.black),
                          )),
                    )
                  ],
                ))))
      ]),
    ));
  }
}
*/