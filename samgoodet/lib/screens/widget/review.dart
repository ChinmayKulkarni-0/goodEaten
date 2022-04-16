// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class ReviewsTile extends StatelessWidget {
  ReviewsTile({Key? key,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VxCircle(
          customDecoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assetName")
            )
          ),
        ).h(5.h).w(5.h),
        5.w.widthBox,
        SizedBox(
          width: 70.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Name".text.black.size(12.sp).make().pSymmetric(v: 1.h),
                  VxRating(
                      // value: review.reviewcount! as double ,
                      isSelectable: false,
                      onRatingUpdate: (value){},
                  ).objectCenterRight()
                ],
              ),
              SizedBox(
                  width: 75.w,
                  child: "".text.black.overflow(TextOverflow.clip).make()),
            ],
          ),
        )
      ],
    ).pSymmetric(v: 2.h);
  }
}
