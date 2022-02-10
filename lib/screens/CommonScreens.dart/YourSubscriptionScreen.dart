// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:table_calendar/table_calendar.dart';

class YourSubscriptionScreen extends StatefulWidget {
  var name;
  var startdate;
  var enddate;
  var interval;
  YourSubscriptionScreen(
      {required this.name,
      required this.startdate,
      required this.enddate,
      required this.interval});

  @override
  _YourSubscriptionScreenState createState() => _YourSubscriptionScreenState();
}

class _YourSubscriptionScreenState extends State<YourSubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    late var _selectedDay;
    List now = [
      DateTime.utc(2022, 2, 9),
    ];
    List not_delivered = [
      DateTime.utc(2022, 2, 10),
    ];
    List edit = [];
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
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
      body: ListView(
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
                    "+91 9982727272",
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
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Milk",
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
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Cow Milk",
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
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              Padding(
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
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quantity :",
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "1.5",
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
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Daily",
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
                style: TextStyle(color: AppColors.iconGrey, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Rs. 640",
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
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, blank.routeName);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(74, 90, 152, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )),
                child: Text(
                  " Pay (Rs. 640)",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 400,
            width: 337,
            child: TableCalendar(
              onDayLongPressed: (selectedDay, focusedDay) {
                print('long tap $selectedDay');
              },
              onDaySelected: (selectedDay, focusedDay) {
                print('tap $selectedDay $focusedDay');
                setState(() {
                  //   CalendarBuilders(
                  //       selectedBuilder: (context, day, selectedDay) {
                  //         print('selected build');
                  //     return Padding(
                  //       padding: const EdgeInsets.all(4.0),
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //             color: AppColors.sideMenuGreen,
                  //             borderRadius: BorderRadius.circular(10)),
                  //         child: Center(
                  //           child: Text(
                  //             day.day.toString(),
                  //             style: TextStyle(color: Colors.black),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   });
                  edit.add(selectedDay);
                  print(edit);
                });
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
              rangeStartDay: widget.startdate,
              //DateTime.now().add(Duration(days: 1)),
              rangeEndDay: widget.enddate,
              //DateTime.now().add(Duration(days: 3)),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
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
                },
                rangeStartBuilder: (context, day, focusedDay) {
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
                            color: edit.contains(day)
                                ? Colors.yellow
                                : now.contains(day)
                                    ? AppColors.sideMenuGreen
                                    : Colors.red,
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
                width: 20,
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
            height: 16,
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
            height: 40,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, blank.routeName);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.iconGrey),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )),
                child: Text(
                  "Set this subscription on HOLD ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 50,
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
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(249, 138, 138, 1)),
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
          ),
        ],
      ),
    );
  }
}
