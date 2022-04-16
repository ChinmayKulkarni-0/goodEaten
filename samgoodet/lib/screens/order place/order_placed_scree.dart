// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/main_page.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFBEE),
      body: SafeArea(child: 
      Stack(children: [
         Column(
        children: [
          12.h.heightBox,
          Card(
            elevation: 4,
            child: SizedBox(
              height: 20.h,
              width: 90.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  'Thank You!'.text.black.bold.size(16.sp).make(),

                  Image.asset("assets/icon/tick.png", height: 6.h,).centered(),
              
                  'Your Order have been placed successfully'.text.semiBold.black.size(10.sp).make(),
                ],
              ),
            ),
          ).pSymmetric(v: 0.h),
        
         
          // RecButton(title: 'Back to home', ontap: (){}, size: 12.sp).h(5.h).pSymmetric(v: 3.h),
          Card(
            elevation: 4,
            child: SizedBox(
             
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Image.asset("assets/icon/rate our app.png").centered(),
                  'Rate Our App'.text.black.size(12.sp).make(),
                  VxRating(
                      stepInt: true,
                      // value: appRating,
                      selectionColor: Colors.yellow.shade700,
                      onRatingUpdate: (value){}
                  ).pSymmetric(v: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'Not Now'.text.gray500.size(12.sp).make(),
                      10.w.widthBox,
                      'Submit'.text.black.size(12.sp).make(),
                    ],
                  ).pSymmetric(v: 2.h)
                ],
              ),
            ),
          ).pSymmetric(v: 3.h),
        1.h.heightBox,
         Container(
            height: 5.h,
            width: 90.w,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey,width: 2)
            ),
            child: 'Track your Order'.text.bold.black.size(12.sp).makeCentered(),
          ).onTap(() {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>TrackOrderScreen()));
          }),
          1.h.heightBox,
         Container(
            height: 5.h,
            width: 90.w,
            decoration: BoxDecoration(
              color: Color(0xFFE2BF53),
              borderRadius: BorderRadius.circular(6),
            
            ),
            child: 'Back To Home'.text.bold.black.size(12.sp).makeCentered(),
          ).onInkTap(() {
            Get.off(()=> MainPage(i: 0,));
          })
        ],
      ).pSymmetric(h: 5.w),
    
        app_Bar(0.w.widthBox, "Order Place".text.bold.size(15.sp).make(), Spacer())
      ],
      
      )
      ),
    );
  }
}