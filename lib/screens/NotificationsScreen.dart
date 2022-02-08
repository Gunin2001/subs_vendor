// ignore_for_file: file_names, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> listOfTitle = [
    "2L Cow Milk Delivered today",
    "2L Cow Milk Delivered today",
    "2L Cow Milk Delivered today",
    "2L Cow Milk Delivered today",
    "2L Cow Milk Delivered today",
    "2L Cow Milk Delivered today",
    "2L Cow Milk Delivered today",
  ];
  List<String> listOfTime = [
    "11:32 am",
    "11:32 am",
    "11:32 am",
    "11:32 am",
    "11:32 am",
    "11:32 am",
    "11:32 am",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25,),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5,);
                },
              padding: EdgeInsets.all(10),
              itemCount: listOfTitle.length,
              itemBuilder: (context, index) =>
                  NotificationCard(listOfTitle[index], listOfTime[index])),
        ),
      ],
    );
  }
}

Widget NotificationCard(String text, String time) {
  return Card(
    color: AppColors.primaryGrey,
    elevation: 2,
    child: Row(
      children: [
        Container(
          height: 40,
          margin: EdgeInsets.all(10),
          child: AutoSizeText(
            text,
            maxLines: 1,
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          width: 25,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              time,
              style: TextStyle(color: AppColors.iconGrey),
            )
          ],
        )
      ],
    ),
  );
}
