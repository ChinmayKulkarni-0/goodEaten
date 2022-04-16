import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';

Widget productItem(String img, String name) {
  // List<Color> color = [Color(0xFFE1A46A), Color(0xFFFEEDB8), Color(0xFFE5C89B),
  
  // ];
  return Container(
    padding: EdgeInsets.all(5.sp),
    decoration: BoxDecoration(
        color: Vx.randomColor, borderRadius: BorderRadius.circular(10.sp)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          img,
          height: 6.h,
        ),
        name.text.size(10.sp).bold.make(),
      ],
    ),
  );
}
