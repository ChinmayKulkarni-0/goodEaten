// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
Widget app_Bar(Widget lead, Widget title , Widget side){
  return Container(
              height: 8.h,
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              decoration: BoxDecoration(
                color: Color(0xFFE4CC80),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.sp),
                  bottomLeft: Radius.circular(10.sp),
                ),
              ),
              child: Row(
                children: [
                 lead,
                  Spacer(),
                  title,
                  Spacer(),
                  side,
                ],
              ),
            );
}