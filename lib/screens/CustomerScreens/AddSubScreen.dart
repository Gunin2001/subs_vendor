// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:subs_vendor/api/AddProductApi.dart';
import 'package:subs_vendor/api/AddSubscription.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/HomeScreen.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';

class AddSubScreen extends StatefulWidget {
  static String routeName = '/addProd';
  final String vendorName;
  final String phoneNo;
  AddSubScreen({
    required this.vendorName,
    required this.phoneNo,
  });

  @override
  _AddSubScreenState createState() => _AddSubScreenState();
}

class _AddSubScreenState extends State<AddSubScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final prodNameController = TextEditingController();
  final priceController = TextEditingController();
  int val = 1;
  double quantity = 0.5;
  String unit = 'Kilogram';
  List dropdownItemCategoryList = [
    {'label': 'Milk', 'value': 'Milk'}, // label is required and unique
    {'label': 'Newspaper', 'value': 'Newspaper'},
    {'label': 'Dairy', 'value': 'Dairy'},
    {'label': 'Grocery', 'value': 'Grocery'},
    {'label': 'Custom', 'value': 'Custom'},
  ];
  var category = {'label': 'Milk', 'value': 'Milk'};
  List dropdownItemList = [
    {'label': 'Daily', 'value': 'Daily'}, // label is required and unique
    {'label': 'Weekly', 'value': 'Weekly'},
    {'label': 'Bi-Weekly', 'value': 'Bi-Weekly'},
    {'label': 'Fortnight', 'value': 'Fortnight'},
    {'label': 'Monthly', 'value': 'Monthly'},
  ];
  var interval = {'label': 'Daily', 'value': 'Daily'};
  String dropdownValue = 'Daily';
  @override
  void initState() {
    super.initState();
  }

  _onAdd() async {
    print('add called');
    if (_form.currentState!.validate() == true) {
      double amount = double.parse(priceController.text) * quantity;
      print(amount);
      var response = await AddSubscriptionApi.addSub(
        tokenProfile?.token,
        category['value'].toString(),
        priceController.text,
        prodNameController.text,
        unit,
        quantity,
        interval['value'].toString(),
        amount,
        widget.phoneNo,
      );
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, HomeScreen.routeName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.error.toString()),
          duration: Duration(seconds: 4),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields must be filled"),
        duration: Duration(seconds: 4),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGrey,
        elevation: 0,
        title: Text("Add Subscription"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
            )),
      ),
      body: Form(
        key: _form,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15),
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
                SizedBox(
                  width: 170,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        widget.vendorName,
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
                  "Contact No. :",
                  style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
                ),
                SizedBox(
                  width: 170,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        widget.phoneNo,
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
                  onChange: (a) {
                    category = a;
                  },
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
                  unselectedItemTS:
                      TextStyle(color: Colors.black, fontSize: 18),
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
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(errorStyle: const TextStyle(fontSize: 0.01),),
                        controller: prodNameController,
                        style: TextStyle(fontSize: 18),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
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
                      child: TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(errorStyle: const TextStyle(fontSize: 0.01),),
                          style: TextStyle(fontSize: 18),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Empty';
                            }
                            return null;
                          }),
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
                                  unit = 'Kilogram';
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
                                  unit = 'Litre';
                                });
                              },
                              activeColor: AppColors.tileSelectGreen,
                            ),
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

                                  unit = 'Piece';
                                });
                              },
                              activeColor: AppColors.tileSelectGreen,
                            ),
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
                                  unit = 'Packet';
                                });
                              },
                              activeColor: AppColors.tileSelectGreen,
                            ),
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

                                  unit = 'Tray';
                                });
                              },
                              activeColor: AppColors.tileSelectGreen,
                            ),
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

                                  unit = 'Other';
                                });
                              },
                              activeColor: AppColors.tileSelectGreen,
                            ),
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
            SizedBox(
              height: 15,
            ),
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
                        onTap: () {
                          setState(() {
                            if (quantity != 0.5) {
                              quantity -= 0.5;
                            } else {
                              GetSnackBar(
                                title: "Quantity can't be 0",
                              );
                            }
                          });
                        },
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
                            quantity.toString(),
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
                        onTap: () {
                          setState(() {
                            quantity += 0.5;
                          });
                        },
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
                  onChange: (a) {
                    interval = a;
                  },
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
                  unselectedItemTS:
                      TextStyle(color: Colors.black, fontSize: 18),
                  isAnimation: true,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: TextButton(
                  onPressed: () async {
                     print('add called');
    if (_form.currentState!.validate() == true) {
      double amount = double.parse(priceController.text) * quantity;
      print(amount);
      var response = await AddSubscriptionApi.addSub(
        tokenProfile?.token,
        category['value'].toString(),
        priceController.text,
        prodNameController.text,
        unit,
        quantity,
        interval['value'].toString(),
        amount,
        widget.phoneNo,
      );
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, HomeScreen.routeName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.toString()),
          duration: Duration(seconds: 4),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields must be filled"),
        duration: Duration(seconds: 4),
      ));
    }
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
                    'Add Subscription',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
