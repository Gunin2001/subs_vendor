// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subs_vendor/Utils/Constants.dart';
import 'package:subs_vendor/api/UpdateProfileApi.dart';
import 'package:subs_vendor/screens/CommonScreens.dart/ProfileScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/HomeScreen.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/shared_preferences/type_preference.dart';
import 'package:subs_vendor/widgets/ScreenSizeButton.dart';

class EditProfile extends StatefulWidget {
  var name;
  var email;
  var address;
  var pincode;
  var shopname;
  var desc;
  EditProfile(
      {required this.name,
      required this.address,
      required this.email,
      required this.pincode,
      this.desc = '',
      this.shopname = ''});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var isType;
  var type;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final shopController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final descriptionController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    typePreference = TypePreference();
    nameController.text = widget.name;
    emailController.text = widget.email;
    addressController.text = widget.address;
    pincodeController.text = widget.pincode;
    shopController.text = widget.shopname;
    descriptionController.text = widget.desc;
  }

  getType() async {
    var isType = await typePreference!.getTypeStatus();
    type = isType ? 'Vendor' : "Customer";
    print(type.toString());
    return isType;
  }

  _onProceed() async {
    if (_form.currentState!.validate() == true) {
      setState(() {
        _isLoading = true;
      });
      var response = await UpdateProfile.updateProfile(
          tokenProfile!.token,
          nameController.text,
          emailController.text,
          addressController.text,
          pincodeController.text,
          type.toString(),
          shopController.text,
          descriptionController.text);
      if (response == 200) {
        print("-Changed Details-");
        print(response);
        Navigator.pushNamed(context, DisplayProfile.routeName);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please Enter Valid Details"),
        duration: Duration(seconds: 4),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    double defaultFontSize = 14;
    double ContainerSize = height * 0.221;
    double picSize = height * 0.08;
    return Form(
      key: _form,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: getType(),
            builder: (context, AsyncSnapshot<dynamic> type) {
              return ListView(children: [
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
                  height: height * 0.071,
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
                        height: height * 0.013,
                      ),
                      Container(
                        height: height * 0.065,
                        child: TextFormField(
                          showCursor: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.tileSelectGreen, width: 0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(
                                color: AppColors.iconGrey,
                                fontSize: defaultFontSize),
                            hintText: "Enter your Name",
                          ),
                          textCapitalization: TextCapitalization.words,
                          controller: nameController,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.013,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Email-ID",
                              style: TextStyle(color: AppColors.iconGrey))),
                      SizedBox(
                        height: height * 0.013,
                      ),
                      Container(
                        height: height * 0.065,
                        child: TextFormField(
                          showCursor: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.tileSelectGreen, width: 0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            errorStyle: const TextStyle(fontSize: 0.01),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(
                                color: AppColors.iconGrey,
                                fontSize: defaultFontSize),
                            hintText: "Enter your Email-ID",
                          ),
                          controller: emailController,
                          validator: (value) {
                            // Check if this field is empty
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            // using regular expression
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return "Please enter a valid email address";
                            }

                            // the email is valid
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * 0.013,
                      ),
                      type.data == true
                          ? ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                  InsertText(
                                      "Shop Name",
                                      "Enter your Shop Name",
                                      shopController,
                                      height),
                                  SizedBox(
                                    height: height * 0.013,
                                  ),
                                  InsertText(
                                      "Description",
                                      "Enter a small Description",
                                      descriptionController,
                                      height),
                                ])
                          : SizedBox(),
                      SizedBox(
                        height: height * 0.013,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Address",
                            style: TextStyle(color: AppColors.iconGrey),
                          )),
                      SizedBox(
                        height: height * 0.013,
                      ),
                      Container(
                        height: height * 0.1,
                        child: TextFormField(
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
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(
                                color: AppColors.iconGrey,
                                fontSize: defaultFontSize),
                            hintText: "Enter your address",
                          ),
                          controller: addressController,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.013,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Pincode",
                            style: TextStyle(color: AppColors.iconGrey),
                          )),
                      SizedBox(
                        height: height * 0.013,
                      ),
                      Container(
                        height: height * 0.065,
                        child: TextFormField(
                          showCursor: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.tileSelectGreen, width: 0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            errorStyle: const TextStyle(fontSize: 0.01),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.tileSelectGreen),
                                borderRadius: BorderRadius.circular(15)),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(
                                color: AppColors.iconGrey,
                                fontSize: defaultFontSize),
                            hintText: "Enter your pincode",
                          ),
                          controller: pincodeController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value?.length != 6) {
                              return 'Empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * 0.065,
                      ),
                      Container(
                        width: double.infinity,
                        height: height * 0.065,
                        child: TextButton(
                            onPressed: () async {
                              await _onProceed();
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.tileSelectGreen),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                )),
                            child: _isLoading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.075,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Text(
                                        "Please Wait...",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )
                                    ],
                                  )
                                : Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )),
                      )
                    ])
              ]);
            }),
      ),
    );
  }
}

Widget InsertText(String title, String hint, TextEditingController controller,
    double height) {
  return ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(color: AppColors.iconGrey),
          )),
      SizedBox(
        height: height * 0.013,
      ),
      Container(
        height: height * 0.065,
        child: TextFormField(
          showCursor: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.tileSelectGreen, width: 0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.tileSelectGreen),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.tileSelectGreen),
                borderRadius: BorderRadius.circular(15)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.tileSelectGreen),
                borderRadius: BorderRadius.circular(15)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.tileSelectGreen),
                borderRadius: BorderRadius.circular(15)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.tileSelectGreen),
                borderRadius: BorderRadius.circular(15)),
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: AppColors.iconGrey, fontSize: 14),
            hintText: hint,
          ),
          controller: controller,
          textCapitalization: TextCapitalization.sentences,
        ),
      ),
    ],
  );
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