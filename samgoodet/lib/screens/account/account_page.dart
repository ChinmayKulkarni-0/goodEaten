// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app/const.dart';
import 'package:food_app/screens/account/accout%20controller/account_controller.dart';
import 'package:food_app/screens/cart/cart_scree.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class AccountSrceen extends StatelessWidget {
   AccountSrceen({ Key? key }) : super(key: key);
   final AccountController _accountController = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    print(_accountController..accountApi());
     double statusBarHeighttop = MediaQuery.of(context).padding.top;
    double statusBarHeightBottom = MediaQuery.of(context).padding.bottom;
    return SafeArea(
      child: Obx(
        // ignore: unrelated_type_equality_checks
        ()=> _accountController.isLoading == true ? Center(child: CircularProgressIndicator(),)
        
        
       :  Stack(
          children: [
            Container(
              color: Color(0xFFFFFBEE),
              height: 100.h - statusBarHeightBottom - statusBarHeighttop,
              width: 100.w,
              child: Column(
                children: [
                  Stack(
              children: [
                Column(
                  children: [
                    15.h.heightBox,
                    Container(
                      height: 70.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        border: Border.all(
                          color: Color(0xFFEAD79A),
                          width: 0.3.w
                        )
                      ),
                      child: Column(
                        children: [
                        9.h.heightBox,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit, size: 3.h,),
                              2.w.widthBox,
                              "Edit".text.size(14.sp).makeCentered()
                            ],
                          ),
                          6.h.heightBox,
                                                    Container(
                              height: 5.h,
                              width: 50.0.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.blueGrey,
                                    )
                                  ]),
                            //  child: "${_accountController.userProfileModel.user!.name}".text.italic.gray400.semiBold.size(13.sp).make().objectCenterLeft().px(2.w)
                            ).px(2.w),
                         1.5.h.heightBox,
                            Container(
                              height: 5.h,
                              width: 50.0.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.blueGrey,
                                    )
                                  ]),
                            //  child: "${_accountController.userProfileModel.user!.email}".text.italic.gray400.semiBold.size(13.sp).make().objectCenterLeft().px(2.w)
                            ).px(2.w),
                         1.5.h.heightBox,
                                                                           Container(
                              height: 5.h,
                              width: 50.0.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.blueGrey,
                                    )
                                  ]),
                            //  child: "${_accountController.userProfileModel.user!.phoneNumber}".text.italic.gray400.semiBold.size(13.sp).make().objectCenterLeft().px(2.w)
                            ).px(2.w),
                             1.5.h.heightBox,
                                                                           Container(
                              height: 5.h,
                              width: 50.0.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.blueGrey,
                                    )
                                  ]),
                             // child: "${_accountController.userProfileModel.user!.address!.city}".text.italic.gray400.semiBold.size(13.sp).make().objectCenterLeft().px(2.w)
                            ).px(2.w),
                             1.5.h.heightBox,
                                                                           Container(
                              height: 5.h,
                              width: 50.0.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.blueGrey,
                                    )
                                  ]),
                             // child: "".text.italic.gray400.semiBold.size(13.sp).make().objectCenterLeft().px(2.w)
                            ).px(2.w)
                         
                        ],
                      ).p12(),
                    ).centered()
                  ],
                ),
                  Positioned(
                    top: 10.h
                    ,
                      left: 35.w,
                      child: Image.asset("assets/icon/profile.png",
                      height: 15.h,
                      ),)
              ],
            )
                  
                ],
              ),
            ),
            app_Bar(Icon(
                      Icons.sort,
                      size: 30.sp,
                    ), "Your Account".text.semiBold.size(14.sp).makeCentered(),Icon(
                      Icons.local_mall_outlined,
                      size: 25.sp,
                    ).onInkTap(() {
                 Get.to(()=> CartScreen());
                  }))
          ],
        ),
      ),
    );
  }
}