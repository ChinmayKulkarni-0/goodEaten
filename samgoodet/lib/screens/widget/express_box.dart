// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/model/get_all_collectionmodel.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';



Widget expressBox() {
  
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.sp),
    ),
    child: Container(
      height: 22.h,
      width: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/image/bakery.png',
          ),
        ),
      ),
      child: 'BAKERY PRODUCTS'
          .text
          .white
          .bold
          .center
          .size(20.sp)
          .make()
          .centered(),
    ),
  );
}
