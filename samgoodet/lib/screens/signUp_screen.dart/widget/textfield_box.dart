// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

Widget TextFieldBox(String text, TextEditingController controller) {
  return Container(
    height: 5.h,
    padding: EdgeInsets.symmetric(horizontal: 6.w),
    child: TextFormField(
      controller:controller ,
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
        filled: true,
        fillColor: Vx.white,
        enabledBorder: OutlineInputBorder(
          //borderRadius: BorderRadius.circular(5.sp),
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
        border: OutlineInputBorder(),
        hintText: text,
        hintStyle: TextStyle(color: Vx.gray400),
        contentPadding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 10.sp),
      ),
    ),
  );
}
