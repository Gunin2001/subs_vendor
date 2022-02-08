// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/UpdateProfileApi.dart';
import 'package:subs_vendor/screens/HomeScreen.dart';
import 'package:subs_vendor/widgets/CommonTextField.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

import 'BankDetailsScreen.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = "/userInfo";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String type = 'vendor';
  String shopname = 'none';
  final nameController = TextEditingController();
  final shopController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  List<String> Images = [
    'lib/assets/images/Ellipse 13.png',
'lib/assets/images/Ellipse 14.png',
'lib/assets/images/Ellipse 15.png',
'lib/assets/images/Ellipse 16.png',
'lib/assets/images/Ellipse 17.png',
'lib/assets/images/Ellipse 18.png',
'lib/assets/images/Ellipse 19.png',
'lib/assets/images/Ellipse 20.png',
'lib/assets/images/Ellipse 21.png',
'lib/assets/images/Ellipse 22.png',
'lib/assets/images/Ellipse 23.png',
'lib/assets/images/Ellipse 24.png',
'lib/assets/images/Ellipse 25.png',
'lib/assets/images/Ellipse 26.png',
'lib/assets/images/Ellipse 27.png',
'lib/assets/images/Ellipse 28.png',
'lib/assets/images/Ellipse 29.png',
'lib/assets/images/Ellipse 30.png',
'lib/assets/images/Ellipse 31.png',
'lib/assets/images/Ellipse 32.png',
  ];
  @override
  Widget build(BuildContext context) {
    double defaultFontSize = 14;
    double ContainerSize = 170;
    double picSize = 60;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: ContainerSize,
              decoration: BoxDecoration(
                color: AppColors.primaryGrey,
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(30),
                    bottomStart: Radius.circular(30)),
              ),
            ),
            Text(
              "User Info",
              style: TextStyle(fontSize: 18),
            ),
            Positioned(
                top: ContainerSize - picSize,
                child: Container(
                  child: ClipOval(
                    child: Image.asset(
                      Images[Random().nextInt(Images.length)],
                      height: picSize * 2,
                      width: picSize * 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 55,
        ),
        ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10),
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Name",
                      style: TextStyle(color: AppColors.iconGrey))),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: TextField(
                  showCursor: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.tileSelectGreen, width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                        color: AppColors.iconGrey, fontSize: defaultFontSize),
                    hintText: "Enter your Name",
                  ),
                  textCapitalization: TextCapitalization.words,
                  controller: nameController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email-ID",
                      style: TextStyle(color: AppColors.iconGrey))),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: TextField(
                  showCursor: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.tileSelectGreen, width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                        color: AppColors.iconGrey, fontSize: defaultFontSize),
                    hintText: "Enter your Email-ID",
                  ),
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Shop Name",
                      style: TextStyle(color: AppColors.iconGrey))),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: TextField(
                  showCursor: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.tileSelectGreen, width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                        color: AppColors.iconGrey, fontSize: defaultFontSize),
                    hintText: "Enter your Shop Name",
                  ),
                  controller: shopController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Address",
                    style: TextStyle(color: AppColors.iconGrey),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                child: TextField(
                  showCursor: true,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(36),

                    /// here char limit is 5
                  ],
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.tileSelectGreen, width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                        color: AppColors.iconGrey, fontSize: defaultFontSize),
                    hintText: "Enter your address",
                  ),
                  controller: addressController,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pincode",
                    style: TextStyle(color: AppColors.iconGrey),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: TextField(
                  showCursor: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.tileSelectGreen, width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.tileSelectGreen),
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                        color: AppColors.iconGrey, fontSize: defaultFontSize),
                    hintText: "Enter your pincode",
                  ),
                  controller: pincodeController,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: TextButton(
                    onPressed: () async {
                      var response = await UpdateProfile.updateProfile(
                          nameController.text,
                          emailController.text,
                          addressController.text,
                          pincodeController.text,
                          type,
                          shopname);
                      if (response == 200) {
                        Navigator.pushNamed(
                            context, BankDetailScreen.routeName);
                      }
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
                      'Proceed',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              )
            ])
      ]),
    );
  }
}

/*  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to pick image $e'),
        duration: Duration(seconds: 4),
      ));
    }
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Photo Library'),
                    onTap: () {
                      pickImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      pickImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
*/