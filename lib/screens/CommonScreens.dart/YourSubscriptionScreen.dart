// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:subs_vendor/Models/UserSubscriptionModel.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/CreateOrderApi.dart';
import 'package:subs_vendor/api/GetSubscriptionByID.dart';
import 'package:subs_vendor/api/MarkUndelivered.dart';
import 'package:subs_vendor/api/PutHoldApi.dart';
import 'package:subs_vendor/api/VerifyPayment.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/MySubscriptionsScreen.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/shared_preferences/type_preference.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:subs_vendor/api/GetSubscriptionByID';

List now = [];
List not_delivered = [];

class YourSubscriptionScreen extends StatefulWidget {
  var ID;
  var vendor_ID;
  YourSubscriptionScreen({
    required this.ID,
    required this.vendor_ID,
  });

  @override
  _YourSubscriptionScreenState createState() => _YourSubscriptionScreenState();
}

class _YourSubscriptionScreenState extends State<YourSubscriptionScreen> {
  void initState() {
    super.initState();
    getDataForSub();
    getType();
    typePreference = TypePreference();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  var order_id;
  var _isLoading;
  final _razorpay = Razorpay();
  void getOrderID(var amount) async {
    var response = await createOrder(tokenProfile!.token, widget.ID);
    setState(() {
      _isLoading = true;
    });
    if (response.statusCode == 200) {
      //orderID = response.o
      order_id = response.data['id'];
      print('-----');
      print(order_id);
      setState(() {
       openCheckout(amount);
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void openCheckout(var amount) async {
    var options = {
      'key': 'rzp_test_orf7FfPHZRXYvN',
      'amount': amount * 100,
      'name': 'ManageMySubscriptions',
      'description': 'Subscirption',
      //'order_id': order_id.toString(),
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    var orderID = response.orderId;
    var paymentID = response.paymentId;
    var signatureID = response.signature;
    var responsed = await verifyPayment(tokenProfile!.token, orderID, paymentID,
        signatureID, widget.ID, widget.vendor_ID);

    if (responsed.statusCode == 200) {
      if (responsed['is_verified'] == true) {
        Navigator.pushNamed(context, MySubScreen.routeName);
      } else {
        Navigator.pushNamed(context, blank.routeName);
      }
    }

    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  var isType;
  var type;
  bool _isLoadingMark = false;
  getDataForSub() async {
    UserSubModel? mapOfSubs;
    mapOfSubs = await getSubsByID(tokenProfile?.token, widget.ID);
    print('In your subscription list');
    print(mapOfSubs);
    now = mapOfSubs!.data[0]['delivereddates'];
    // var abc = mapOfSubs!.data[0]['delivereddates'] as List;
    // now = abc.map((e) => e as DateTime.parse(e.toString()).toList();
    //  var abcd = mapOfSubs.data[0]['notdelivered'] as List;
    // not_delivered = abcd.map((e) => e as DateTime).toList();
    not_delivered = mapOfSubs.data[0]['notdelivered'];
    // for (int i = 0; i < mapOfSubs!.data[0]['notdelivered'].length; i++) {
    //   not_delivered
    //       .add(DateTime.parse(mapOfSubs.data[0]['notdelivered'][i]));
    // }
    // for (int i = 0; i < mapOfSubs.data[0]['delivereddates'].length; i++) {
    //   now.add(DateTime.parse(mapOfSubs.data[0]['delivereddates'][i]).day);
    // }
    print("not delivered dates");
    print(not_delivered);
    print(" delivered dates");
    print(now);
    return mapOfSubs.data;
  }

  getType() async {
    isType = await typePreference!.getTypeStatus();
    type = isType ? 'Vendor' : "Customer";
    print(type.toString());
  }

  onHoldButton() async {
    var response =
        await PutHold.putHoldApi(tokenProfile!.token, widget.ID, true);

    if (response.statusCode == 200) {
      Navigator.pop(context);
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Subscription put on hold successfully"),
          duration: Duration(seconds: 4),
        ));
      });
      Navigator.pushNamed(context, MySubScreen.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Unknown Error"),
        duration: Duration(seconds: 4),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    late var _selectedDay;
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.primaryGrey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          "Your Subscription",
        ),
      ),
      body: FutureBuilder(
          future: getDataForSub(),
          builder: (context, AsyncSnapshot list) {
            if (list.data != null) {
              return ListView(
                padding: EdgeInsets.all(15),
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Vendor Name :",
                        style:
                            TextStyle(color: AppColors.iconGrey, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            list.data[0]['vendor_details']['name'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Contact No. :",
                        style:
                            TextStyle(color: AppColors.iconGrey, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            list.data[0]['vendor_details']['phoneno']
                                .toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Category:",
                        style:
                            TextStyle(color: AppColors.iconGrey, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            list.data[0]['category'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Name :",
                        style:
                            TextStyle(color: AppColors.iconGrey, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            list.data[0]['productName'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price :",
                        style:
                            TextStyle(color: AppColors.iconGrey, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Rs.${list.data[0]['priceperquantity'].toString()}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quantity :",
                        style:
                            TextStyle(color: AppColors.iconGrey, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            list.data[0]['quantity'].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Interval :",
                        style:
                            TextStyle(color: AppColors.iconGrey, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            list.data[0]['interval'].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount Due :",
                        style:
                            TextStyle(color: AppColors.iconGrey, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Rs. ${(list.data[0]['amount'] * now.length).toString()}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.026,
                  ),
                  Container(
                    width: width,
                    height: height * 0.065,
                    child: TextButton(
                        onPressed: () async {
                          if (ConstantType == false) {
                            getOrderID(
                                list.data[0]['amount'] * now.length as int);
                            // if (_isLoading) {
                            //   openCheckout(
                            //       list.data[0]['amount'] * now.length as int);
                            // }
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(74, 90, 152, 1)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            )),
                        child: isType
                            ? Text(
                                "Request Payment (Rs. ${(list.data[0]['amount'] * now.length).toString()})",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))
                            : Text(
                                " Pay (Rs. ${(list.data[0]['amount'] * now.length).toString()})",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                  ),
                  SizedBox(
                    height: height * 0.026,
                  ),
                  Container(
                    height: height * 0.52,
                    width: width * 0.842,
                    child: TableCalendar(
                      onDaySelected: (selectedDay, focusedDay) {
                        print('tap $selectedDay $focusedDay');
                        if (selectedDay.isBefore(
                            DateTime.parse(list.data[0]['duedate']))) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                elevation: 16,
                                child: Container(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      TextButton(
                                          onPressed: () async {
                                            var response =
                                                await MarkUpdate.markGreen(
                                                    tokenProfile!.token,
                                                    widget.ID,
                                                    selectedDay);

                                            if (response.statusCode == 200) {
                                              setState(() {
                                                now.add(selectedDay);
                                                print(not_delivered);
                                              });
                                              Navigator.pop(context);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text("Unknown Error"),
                                                duration: Duration(seconds: 4),
                                              ));
                                            }
                                          },
                                          child: Text("Mark Delivered")),
                                      TextButton(
                                          onPressed: () async {
                                            var response =
                                                await MarkUpdate.markRed(
                                                    tokenProfile!.token,
                                                    widget.ID,
                                                    selectedDay);

                                            if (response.statusCode == 200) {
                                              setState(() {
                                                not_delivered.add(selectedDay);
                                                print(not_delivered);
                                              });
                                              Navigator.pop(context);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text("Unknown Error"),
                                                duration: Duration(seconds: 4),
                                              ));
                                            }
                                          },
                                          child: Text("Mark Not Delivered")),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        // setState(() {
                        //   //   CalendarBuilders(
                        //   //       selectedBuilder: (context, day, selectedDay) {
                        //   //         print('selected build');
                        //   //     return Padding(
                        //   //       padding: const EdgeInsets.all(4.0),
                        //   //       child: Container(
                        //   //         decoration: BoxDecoration(
                        //   //             color: AppColors.sideMenuGreen,
                        //   //             borderRadius: BorderRadius.circular(10)),
                        //   //         child: Center(
                        //   //           child: Text(
                        //   //             day.day.toString(),
                        //   //             style: TextStyle(color: Colors.black),
                        //   //           ),
                        //   //         ),
                        //   //       ),
                        //   //     );
                        //   //   });
                        //   print(edit);
                        // });
                      },
                      calendarStyle: CalendarStyle(
                          weekendTextStyle: TextStyle(color: Colors.black),
                          weekendDecoration: BoxDecoration(
                              color: AppColors.iconGrey,
                              borderRadius: BorderRadius.circular(10)),
                          defaultTextStyle: TextStyle(color: Colors.black),
                          defaultDecoration: BoxDecoration(
                              color: AppColors.iconGrey,
                              borderRadius: BorderRadius.circular(10))),
                      firstDay: DateTime.utc(2010, 10, 16),
                      rangeStartDay: DateTime.parse(list.data[0]['createdAt']),
                      //DateTime.now().add(Duration(days: 1)),
                      rangeEndDay: DateTime.parse(list.data[0]['duedate']),
                      //DateTime.now().add(Duration(days: 3)),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.parse(list.data[0]['duedate']),
                      calendarBuilders: CalendarBuilders(
                        selectedBuilder: (context, day, selectedDay) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.sideMenuGreen,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  day.day.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                        todayBuilder: (context, day, focusedDay) {
                          print('--');
                          print(day);
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: now.contains(
                                          day.toString().substring(0, 10))
                                      ? AppColors.sideMenuGreen
                                      : not_delivered.contains(
                                              day.toString().substring(0, 10))
                                          ? Colors.red
                                          : AppColors.iconGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  day.day.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                        rangeStartBuilder: (context, day, focusedDay) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: now.contains(
                                          day.toString().substring(0, 10))
                                      ? AppColors.sideMenuGreen
                                      : not_delivered.contains(
                                              day.toString().substring(0, 10))
                                          ? Colors.red
                                          : Color.fromRGBO(74, 90, 152, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  day.day.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                        rangeEndBuilder: (context, day, focusedDay) {
                          {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(74, 90, 152, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    day.day.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        withinRangeBuilder: (context, day, focusedDay) {
                          {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: now.contains(
                                            day.toString().substring(0, 10))
                                        ? AppColors.sideMenuGreen
                                        : not_delivered.contains(
                                                day.toString().substring(0, 10))
                                            ? Colors.red
                                            : AppColors.iconGrey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    day.day.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        rangeHighlightBuilder: (context, day, isWithinRange) {
                          if (isWithinRange == true) {
                            return Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(74, 90, 152, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                // child: Text(
                                //   day.day.toString(),
                                //   style: TextStyle(color: Colors.white),
                                // ),
                              ),
                            );
                          }
                        },
                        // dowBuilder: (context, day) {
                        //   if (day.weekday == DateTime.sunday) {
                        //     final text = DateFormat.E().format(day);

                        //     return Center(
                        //       child: Text(
                        //         text,
                        //         style: TextStyle(color: Colors.red),
                        //       ),
                        //     );
                        //   }
                        // },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Container(
                        height: _heightScale * 8,
                        width: _widthScale * 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.sideMenuGreen,
                        ),
                      ),
                      SizedBox(width: _widthScale * 8),
                      Text(
                        'Delivered',
                        style: TextStyle(
                          color: const Color(0xFFABABAB),
                          fontSize: _widthScale * 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: _widthScale * 46),
                      Container(
                        height: _heightScale * 8,
                        width: _widthScale * 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFEF4C48),
                        ),
                      ),
                      SizedBox(width: _widthScale * 8),
                      Text(
                        'Not Delivered',
                        style: TextStyle(
                          color: const Color(0xFFABABAB),
                          fontSize: _widthScale * 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: _heightScale * 8,
                        width: _widthScale * 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(74, 90, 152, 1),
                        ),
                      ),
                      SizedBox(width: _widthScale * 8),
                      Text(
                        'Next Due',
                        style: TextStyle(
                          color: const Color(0xFFABABAB),
                          fontSize: _widthScale * 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: _widthScale * 47),
                      Container(
                        height: _heightScale * 8,
                        width: _widthScale * 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFABABAB),
                        ),
                      ),
                      SizedBox(width: _widthScale * 8),
                      Text(
                        'Yet to come',
                        style: TextStyle(
                          color: const Color(0xFFABABAB),
                          fontSize: _widthScale * 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.052,
                  ),
                  Container(
                    width: double.infinity,
                    height: height * 0.065,
                    child: TextButton(
                        onPressed: () async {
                          if (ConstantType == false) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    elevation: 16,
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      height: height * 0.165,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Are you sure you want to put this subscription on hold",
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                  onPressed: () async {
                                                    await onHoldButton();
                                                  },
                                                  child: Text("Yes")),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("No")),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.iconGrey),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            )),
                        child: ConstantType
                            ? Text(
                                "Mark Payment",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            : Text(
                                "Set this subscription on HOLD ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                  ),
                  SizedBox(
                    height: height * 0.026,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 0.375,
                        height: height * 0.065,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, blank.routeName);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.tileSelectGreen),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                )),
                            child: Text(
                              'Edit',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      ),
                      Container(
                        width: width * 0.375,
                        height: height * 0.065,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, blank.routeName);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(249, 138, 138, 1)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                )),
                            child: Text(
                              'Delete',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      )
                    ],
                  ),
                ],
              );
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}
