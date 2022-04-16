// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/main_page.dart';
import 'package:food_app/model/profile_model.dart';
import 'package:food_app/screens/menu/categories_expansion/categories_expansion_screen.dart';
import 'package:food_app/screens/menu/collabrate/collabrate.dart';
import 'package:food_app/screens/menu/privacy/privacy_screen.dart';
import 'package:food_app/screens/menu/terms/terms_screen.dart';
import 'package:food_app/screens/menu/the%20Alfs/alfs_screen.dart';
import 'package:food_app/screens/onbording_screen/onboarding_screen.dart';

import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../order place/order_placed_scree.dart';
import 'Address/address_screen.dart';
import 'help n support/help_screen.dart';
class MenuScreen extends StatelessWidget {
  const MenuScreen({ Key? key }) : super(key: key);
@override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
      
       
        body: Stack(
          children: [
           Container(
            color: Color(0xFFFFFBEE),
            height: 100.h,
            width: 100.w,
            child: Column(
              children: [
                Expanded(child: SingleChildScrollView(
                   child: Column(
                      children: [
                        10.h.heightBox,
                        Row(
                          children: [
                           Image.asset("assets/icon/home.png", height: 3.h),
                            3.w.widthBox,
                            "Home".text.semiBold.size(15.sp).make()
                          ],
                        ).onInkTap(() {
                         Get.off(()=> MainPage(i: 0,));
                        }).px(4.w),
                      
                        6.h.heightBox,
                        Row(
                          children: [
                           Image.asset("assets/icon/myorders.png", height: 3.h),
                            3.w.widthBox,
                            "My Orders".text.semiBold.size(15.sp).make()
                          ],
                        ).onTap(() {
                        Get.to(()=>  OrderPlacedScreen());
                        }).px(4.w),
                         6.h.heightBox,
                        Row(
                          children: [
                           Image.asset("assets/icon/categories.png", height: 3.h),
                            3.w.widthBox,
                            "Categories".text.semiBold.size(15.sp).make()
                          ],
                        ).onTap(() {
                        Get.to(()=> CategoriesExpansionScreen());
                        }).px(4.w),
                        6.h.heightBox,
                        Row(
                          children: [
                           Image.asset("assets/icon/favourites.png", height: 3.h),
                            3.w.widthBox,
                            "Favourites".text.semiBold.size(15.sp).make()
                          ],
                        ).px(4.w).onTap(() {
                      Get.off(()=> MainPage(i: 2,));
                        }),
                          6.h.heightBox,
                          Row(
                            children: [
                              Image.asset("assets/icon/alfs.png", height: 4.h),
                              3.w.widthBox,
                             Column(
                               children: [
                                    Image.asset("assets/icon/The ALFS.png", height: 2.7.h),
                                   Image.asset("assets/icon/CIRCLE.png", height: 4.h),
                                  
                               ],
                             )
                            ],
                          ).px(4.w).onInkTap(() {
                            Get.to(()=> AlfsScreen());
                          }),
                        6.h.heightBox,
                        Row(
                          children: [
                           Image.asset("assets/icon/account.png", height: 3.h),
                            3.w.widthBox,
                            "My Account".text.semiBold.size(15.sp).make()
                          ],
                        ).px(4.w).onTap(() {
                        Get.off(()=> MainPage(i: 3,));
                        }),
                        6.h.heightBox,
                        Row(
                          children: [
                           Image.asset("assets/icon/collab.png", height: 3.h),
                            3.w.widthBox,
                            "Collaborate with us".text.semiBold.size(15.sp).make()
                          ],
                        ).px(4.w).onTap(() {
                        Get.to(()=> CollabrationScreen());
                        }),
                        6.h.heightBox,
                        Row(
                          children: [
                            Image.asset("assets/icon/help.png", height: 3.h),
                            3.w.widthBox,
                            "Help & Support".text.semiBold.size(15.sp).make()
                          ],
                        ).px(4.w).onTap(() {
                      Get.to(()=> HelpScreen());
                        }),
                          6.h.heightBox,
                        Row(
                          children: [
                           Image.asset("assets/icon/termsncondition.png", height: 3.h),
                            3.w.widthBox,
                            "Terms & Condition".text.semiBold.size(15.sp).make()
                          ],
                        ).onTap(() {
                        Get.to(()=> TermsScreen());
                        }).px(4.w),
                        6.h.heightBox,
                          
                        Row(
                          children: [
                           Image.asset("assets/icon/privacy.png", height: 3.h),
                            3.w.widthBox,
                            "Privacy Policiy".text.semiBold.size(15.sp).make()
                          ],
                        ).onTap(() {
                        Get.to(()=> PrivacyScreen());
                        }).px(4.w),
                         6.h.heightBox,
                          
                        Row(
                          children: [
                           Image.asset("assets/icon/address.png", height: 3.h),
                            3.w.widthBox,
                            "Address".text.semiBold.size(15.sp).make()
                          ],
                        ).onTap(() {
                        Get.to(()=> AdsressScreen());
                        }).px(4.w),
                        6.h.heightBox,
                        Row(
                          children: [
                            Image.asset("assets/icon/logout.png", height: 3.h),
                            3.w.widthBox,
                            "Logout".text.semiBold.size(15.sp).make()
                          ],
                        ).px(4.w).onTap(() {
                          GetStorage prefs = GetStorage();
                          prefs.remove('token');
                          prefs.remove('emailStored');
                       Get.offNamedUntil(OnboardingScreen.route, (route) => false);
                        }),
                       6.h.heightBox
                      
                      ],
                    ).p4(),
                
                ))
              ],
            ),
            ),
           app_Bar( Icon(
                    Icons.sort,
                    size: 30.sp,
                  ).onInkTap (() {
                   Get.back();
                  }), "MENU".text.semiBold.size(14.sp).makeCentered(), 
                  Spacer()
                  ),
          ],
        ),
      ),
    );
  }
}
