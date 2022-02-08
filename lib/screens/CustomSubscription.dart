// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:subs_vendor/screens/HomeScreen.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

class CustomSubScreen extends StatefulWidget {
  static String routeName = '/customSub';

  const CustomSubScreen({Key? key}) : super(key: key);

  @override
  _CustomSubScreenState createState() => _CustomSubScreenState();
}

class _CustomSubScreenState extends State<CustomSubScreen> {
  int val = 1;
  List dropdownItemCategoryList = [
    {'label': 'Milk', 'value': 'Milk'}, // label is required and unique
    {'label': 'Newspaper', 'value': 'Newspaper'},
    {'label': 'Dairy', 'value': 'Dairy'},
    {'label': 'Grocery', 'value': 'Grocery'},
    {'label': 'Custom', 'value': 'Custom'},
  ];
  List dropdownItemList = [
    {'label': 'Daily', 'value': 'Daily'}, // label is required and unique
    {'label': 'Weekly', 'value': 'Weekly'},
    {'label': 'Bi-Weekly', 'value': 'Bi-Weekly'},
    {'label': 'Fortnight', 'value': 'Fortnight'},
    {'label': 'Monthly', 'value': 'Monthly'},
  ];
  String dropdownValue = 'Daily';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ScreenSizeButton(
            "Add Subscription ( Rs.320 )", context, HomeScreen.routeName),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGrey,
        elevation: 0,
        title: Text("Custom Subscription"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Vendor Name :",
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "A1 milk Services",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Contact No. :",
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "+91 9999999999",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category :",
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              CoolDropdown(
                dropdownWidth: 150,
                resultWidth: 170,
                dropdownHeight: 250,
                dropdownList: dropdownItemCategoryList,
                dropdownItemTopGap: 5,
                dropdownItemBottomGap: 5,
                onChange: (a) {},
                resultBD: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.iconGrey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                dropdownBD: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: AppColors.iconGrey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                defaultValue: dropdownItemCategoryList[0],
                dropdownItemReverse: true,
                isTriangle: false,
                dropdownItemAlign: Alignment.center,
                dropdownItemMainAxis: MainAxisAlignment.center,
                resultMainAxis: MainAxisAlignment.center,
                gap: 10,
                resultIcon: Container(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.tileSelectGreen,
                      ),
                    )),
                selectedItemBD: BoxDecoration(
                    color: AppColors.sideMenuGreen,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                selectedItemTS: TextStyle(color: Colors.black, fontSize: 18),
                resultTS: TextStyle(color: Colors.black, fontSize: 18),
                unselectedItemTS: TextStyle(color: Colors.black, fontSize: 18),
                isAnimation: true,
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product Name :",
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              Container(
                width: 170,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1, color: AppColors.iconGrey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price :",
                    style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
                  ),
                  Text(
                    "per quantity",
                    style: TextStyle(color: AppColors.iconGrey, fontSize: 12),
                  ),
                ],
              ),
              Container(
                width: 170,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1, color: AppColors.iconGrey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Text(
                "SI unit :",
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
          Theme(
            data: Theme.of(context).copyWith(
                unselectedWidgetColor: AppColors.iconGrey,
                disabledColor: Colors.blue),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (index) {
                                setState(() {
                            
                                val = 1;
                                });
                              },
                              activeColor: AppColors.tileSelectGreen,
                              ),
                          Expanded(
                            child: Text(
                              'Kilogram',
                              style: TextStyle(
                                  color: AppColors.iconGrey, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: 2,
                              groupValue: val,
                              onChanged: (index) {
                                setState(() {
                                val = 2;
                                });
                              }
                              ,activeColor: AppColors.tileSelectGreen,),
                          Expanded(
                              child: Text(
                            'Litre',
                            style: TextStyle(
                                color: AppColors.iconGrey, fontSize: 16),
                          ))
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: 3,
                              groupValue: val,
                              onChanged: (index) {
                                setState(() {
                                val = 3;
                                });
                              },activeColor: AppColors.tileSelectGreen,),
                          Expanded(
                              child: Text(
                            'Piece',
                            style: TextStyle(
                                color: AppColors.iconGrey, fontSize: 16),
                          ))
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Radio(
                              value: 4,
                              groupValue: val,
                              onChanged: (index) {
                                setState(() {
                                val = 4;
                                });
                              },activeColor: AppColors.tileSelectGreen,),
                          Expanded(
                              child: Text(
                            'Packet',
                            style: TextStyle(
                                color: AppColors.iconGrey, fontSize: 16),
                          ))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Radio(
                              value: 5,
                              groupValue: val,
                              onChanged: (index) {
                                setState(() {
                                val = 5;
                                });
                              },activeColor: AppColors.tileSelectGreen,),
                          Expanded(
                              child: Text(
                            'Tray',
                            style: TextStyle(
                                color: AppColors.iconGrey, fontSize: 16),
                          ))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Radio(
                              value: 6,
                              groupValue: val,
                              onChanged: (index) {
                                setState(() {
                                val = 6;
                                });
                              },activeColor: AppColors.tileSelectGreen,),
                          Expanded(
                            child: Text(
                              'Other',
                              style: TextStyle(
                                  color: AppColors.iconGrey, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quantity",
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                      onTap: () {},
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    5))), //here we set the circular figure
                            color: AppColors.primaryGrey),
                        child: Center(
                            child: Icon(
                          Icons.remove,
                          size: 15,
                          color: Colors.black,
                        )),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border:
                            Border.all(width: 1, color: AppColors.iconGrey)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18.0, top: 8.0, bottom: 8.0),
                      child: Center(
                        child: Text(
                          "1.5",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    5))), //here we set the circular figure
                            color: AppColors.tileSelectGreen),
                        child: Center(
                            child: Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.white,
                        )),
                      )),
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Interval :",
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              CoolDropdown(
                dropdownWidth: 150,
                resultWidth: 170,
                dropdownHeight: 200,
                dropdownList: dropdownItemList,
                dropdownItemTopGap: 5,
                dropdownItemBottomGap: 5,
                onChange: (a) {},
                resultBD: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.iconGrey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                dropdownBD: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: AppColors.iconGrey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                defaultValue: dropdownItemList[0],
                dropdownItemReverse: true,
                isTriangle: false,
                dropdownItemAlign: Alignment.center,
                dropdownItemMainAxis: MainAxisAlignment.center,
                resultMainAxis: MainAxisAlignment.center,
                gap: 10,
                resultIcon: Container(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.tileSelectGreen,
                      ),
                    )),
                selectedItemBD: BoxDecoration(
                    color: AppColors.sideMenuGreen,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                selectedItemTS: TextStyle(color: Colors.black, fontSize: 18),
                resultTS: TextStyle(color: Colors.black, fontSize: 18),
                unselectedItemTS: TextStyle(color: Colors.black, fontSize: 18),
                isAnimation: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
