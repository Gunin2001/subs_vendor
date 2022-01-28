// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subs_vendor/Utils/Constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextField(
        autofocus: false,
        cursorColor: AppColors.iconGrey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.search, color: AppColors.iconGrey),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.sideMenuGreen, width: 0.5),
              borderRadius: BorderRadius.circular(15),
              ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.iconGrey),
              borderRadius: BorderRadius.circular(15)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.iconGrey),
              borderRadius: BorderRadius.circular(15)
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.iconGrey),
              borderRadius: BorderRadius.circular(15)
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.iconGrey),
              borderRadius: BorderRadius.circular(15)
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.iconGrey),
              borderRadius: BorderRadius.circular(15)
            ),
          hintText: "Search e.g Sweatshirt",
          hintStyle: TextStyle(fontSize: 14, color: AppColors.iconGrey),
        ),
      ),
    );
  }
}
