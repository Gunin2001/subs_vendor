// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

class EditProdScreen extends StatefulWidget {
  static String routeName = '/editProd';

  const EditProdScreen({Key? key}) : super(key: key);

  @override
  _EditProdScreenState createState() => _EditProdScreenState();
}

class _EditProdScreenState extends State<EditProdScreen> {
  List dropdownItemCategoryList = [
    {'label': 'Milk', 'value': 'Milk'}, // label is required and unique
    {'label': 'Newspaper', 'value': 'Newspaper'},
    {'label': 'Dairy', 'value': 'Dairy'},
    {'label': 'Grocery', 'value': 'Grocery'},
    {'label': 'Custom', 'value': 'Custom'},
  ];
  List dropdownItemUnitList = [
    {'label': 'Kilogram', 'value': 'Kilogram'}, // label is required and unique
    {'label': 'Litre', 'value': 'Litre'},
    {'label': 'Tray', 'value': 'Tray'},
    {'label': 'Packet', 'value': 'Packet'},
    {'label': 'Bottle', 'value': 'Bottle'},
  ];
  String dropdownValue = 'Daily';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGrey,
        elevation: 0,
        title: Text("Edit Product"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
            )),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Product Image",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Image.asset('lib/assets/images/milkBottle.png',height: 140,width: 140,),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "Product Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
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
          SizedBox(
            height: 15,
          ),
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
                    child: Text(
                      "Toned Milk",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price :",
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
                    child: Text(
                      "Rs.82",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SI Unit",
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              CoolDropdown(
                dropdownWidth: 150,
                resultWidth: 170,
                dropdownHeight: 250,
                dropdownList: dropdownItemUnitList,
                dropdownItemTopGap: 5,
                dropdownItemBottomGap: 5,
                onChange: () {},
                resultBD: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.iconGrey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                dropdownBD: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: AppColors.iconGrey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                defaultValue: dropdownItemUnitList[0],
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
          SizedBox(height: 130,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, blank.routeName);
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
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    ),
                    Container(
                    width: 150,
                    height: 50,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, blank.routeName);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color.fromRGBO(249, 138, 138, 1)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            )),
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    )
                ],
              )
            
        ],
      ),
    );
  }
}
