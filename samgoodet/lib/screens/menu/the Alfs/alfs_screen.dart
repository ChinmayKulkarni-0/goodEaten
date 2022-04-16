// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class AlfsScreen extends StatelessWidget {
  const AlfsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(     
      backgroundColor:    Vx.amber100,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
               11.5.h.heightBox,
              Container(
              
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    width: 0.2.w
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 2,
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    2.h.heightBox,
                    "#THEALFS CIRCLE".text.color(Color(0xFF6FA334)).bold.size(16.sp).make(),
                    2.h.heightBox,
                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's. ".text.italic.size(12.sp).make()  ,
                     2.h.heightBox,
                     "'# THEALFS Circle Membership or Reward Program'".text.bold.size(10.sp).make(),
                     2.h.heightBox,
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's. ".text.italic.size(12.sp).make()  ,
                      2.h.heightBox,
                      Container(
                       
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFA6D74D)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            1.h.heightBox,
                            "Green Package".text.semiBold.color(Color(0xFFA6D74D)).size(16.sp).make().px(3.w),
                            1.h.heightBox,
                            "• INR 321 per month".text.color(Color(0xFFA6D74D)).size(12.sp).make().px(6.w),
                            1.h.heightBox,
                              "• Enjoy 5 free Delivery for 1 month and\n  coupon benfits".text.color(Color(0xFFA6D74D)).size(12.sp).make().px(6.w),
                              1.h.heightBox,
                              Container(
                              height: 5.h,
                              width: 35.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFA6D74D),
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                                child: "BUY PREMIUM".text.white.bold.size(14.sp).makeCentered(),
                              ).centered()
                            
                          ],
                        ).p4(),
                      ),
                      2.h.heightBox,
                       Container(
                      
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFF4C945)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            1.h.heightBox,
                            "Green Package".text.semiBold.color(Color(0xFFF4C945)).size(16.sp).make().px(3.w),
                            1.h.heightBox,
                            "• INR 321 per month".text.color(Color(0xFFF4C945)).size(12.sp).make().px(6.w),
                            1.h.heightBox,
                              "• Enjoy 5 free Delivery for 1 month and\n  coupon benfits".text.color(Color(0xFFF4C945)).size(12.sp).make().px(6.w),
                              1.h.heightBox,
                              Container(
                                 height: 5.h,
                              width: 35.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF4C945),
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                                child: "BUY PREMIUM".text.white.bold.size(14.sp).makeCentered(),
                              ).centered()
                            
                          ],
                        ).p4(),
                      )
                     
                  ],
                ).p8(),
              ).p8()
                ],
              ).px(3.w),
               app_Bar(Icon(Icons.arrow_back_ios).onInkTap(() {
            Get.back();
          }), "THEALFS".text.semiBold.size(15.sp).make(), Spacer())
            ],
          ),
        ),
      ),
    );
  }
}