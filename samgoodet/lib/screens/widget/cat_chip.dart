import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';

Widget catChip(String ?name) {
  return Chip(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    label: '$name +'.text.size(9.sp).semiBold.black.make(),
    backgroundColor: Vx.white,
    elevation: 2.sp,
    shadowColor: Colors.grey[60],
    padding: EdgeInsets.all(4.sp),
  ).py(1.sp);
}
