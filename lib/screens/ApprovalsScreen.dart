// ignore_for_file: file_names, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/widgets/Bottom_Navigation_Bar.dart';

class ApprovalsScreen extends StatefulWidget {
  const ApprovalsScreen({ Key? key }) : super(key: key);

  @override
  _ApprovalsScreenState createState() => _ApprovalsScreenState();
}

class _ApprovalsScreenState extends State<ApprovalsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        SizedBox(height:10.0),
        Text("Your Customers",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        SizedBox(height:10.0),
        customerTile("Gupta Dairy","Daily","Cow Milk","160","2 litre","lib/assets/images/person.png"
        ,context,"House No. 12A,Block - D, Gangotri Apartments, Sector-11, Delhi-110085"),
        SizedBox(height:10.0),
        customerTile("Vikas Poultry","Daily","Eggs","320","2 trays","lib/assets/images/person.png"
        ,context,"House No. 12A,Block - D, Gangotri Apartments, Sector-11, Delhi-110085"),
        SizedBox(height:10.0),
        customerTile("Gupta Dairy","Daily","Cow Milk","80","litre","lib/assets/images/person.png"
        ,context,"House No. 12A,Block - D, Gangotri Apartments, Sector-11, Delhi-110085 "),
      ],
    );
  }
}

Widget customerTile(String title, String interval, String prod, String price,
    String unit, String image, BuildContext context,String date) {
  return Card(
    elevation: 5.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 120.0,
              width: 120.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 0.0, bottom: 4, top: 12, left: 8),
                  child: Text(
                    title,
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
                            prod,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(19, 19, 21, 1.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 0.0, bottom: 4, top: 8, left: 8),
                          child: Text(interval,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(19, 19, 21, 1.0))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 0.0, bottom: 4, top: 8, left: 8),
                          child: SizedBox(
                            height: 45,
                            width: 130,
                            child: AutoSizeText(date,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(19, 19, 21, 1.0))),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Text(
                          "Rs." + price,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(19, 19, 21, 1.0)),
                        ),
                        Center(
                          child: Text(unit),
                        ),
                        SizedBox(height: 30)
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
       Padding(
         padding: const EdgeInsets.all(10.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             RichText(
                      text: TextSpan(
                          text: "Decline Request",
                          style: TextStyle(
                            color: Color.fromRGBO(74, 90, 152, 1),
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("sub added");
                              Navigator.pushNamed(context, blank.routeName);
                            }),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Accept Request",
                          style: TextStyle(
                            color: Color.fromRGBO(74, 90, 152, 1),
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("sub added");
                              Navigator.pushNamed(context, blank.routeName);
                            }),
                    ),
           ],
         ),
       ),
      ],
    ),
  );
}