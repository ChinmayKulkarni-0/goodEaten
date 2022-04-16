// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
class HelpScreen extends StatelessWidget {
  const HelpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: App_Bar(),
      
      body: SafeArea(child: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
               color: Color(0xFFFFFBEE),
            child: Column(
              
              children: [
              18.h.heightBox,
                Container(
                  height: 40.h,
                  width: 100.w,
                  decoration:     BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 2
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
          child: Column(
                          children: [
                            4.h.heightBox,
                            Row(
                              children: [
                                Image.asset("assets/icon/location.png", height: 6.h,),
                                4.w.widthBox,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Address".text.bold.size(16.sp).make(),
                                    // 1.h.heightBox,
                                    '''Lorem Ipsem is a dummy text  
of the typing and printing industry'''.text.size(11.sp).make()
                                  ],
                                )
                              ],
                            ),
                            4.h.heightBox,
                            Row(
                              children: [
                                Image.asset("assets/icon/phone.png", 
                                height: 6.h,
                                ),
                                4.w.widthBox,
                                Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Contact".text.bold.size(16.sp).make(),
                                    "+91 1123567890".text.size(11.sp).make()
                                  ],
                                )
                              ],
                            ),
                            4.h.heightBox,
                            Row(
                              children: [
                                Image.asset("assets/icon/mail.png", height: 6.h,),
                                4.w.widthBox,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Mail".text.size(16.sp).bold.make(),
                                    "abcd@gmail.com".text.size(11.sp).make()
                                  ],
                                )
                              ],
                            )
                          ],
                        ).px(3.w),
                   
                ).px(10.w),
              ],
            ),
          ),
          app_Bar(Icon(Icons.arrow_back_ios).onInkTap(() {
            Get.back();
          }), "Help & Support".text.semiBold.size(15.sp).make(), Spacer())
        ],
      ),
      ),
    );
  }
}