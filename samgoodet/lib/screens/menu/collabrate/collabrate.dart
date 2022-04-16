// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:food_app/screens/menu/collabrate/collab%20controller/collab_controller.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';



class CollabrationScreen extends StatelessWidget {
  CollabrationScreen({Key? key}) : super(key: key);

  final Collabcontroller _collabcontroller = Get.put(Collabcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6EBCA),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              7.h.heightBox,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(color: Colors.blueGrey, blurRadius: 2)
                      ]),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _collabcontroller.collabFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          12.h.heightBox,
                          Image.asset(
                            "assets/image/collab.png",
                            height: 16.h,
                          ),
                          2.h.heightBox,
                          Container(
                            height: 4.5.h,
                            width: 100.w,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(blurRadius: 2, color: Colors.blueGrey)
                            ]),
                            child: TextFormField(
                              controller: _collabcontroller.name,
                              validator: _collabcontroller.nameValidation,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 12.sp,
                                      fontStyle: FontStyle.italic)),
                            ).px(2.w),
                          ).px(3.w),
                          2.h.heightBox,
                          Container(
                            height: 4.5.h,
                            width: 100.w,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(blurRadius: 2, color: Colors.blueGrey)
                            ]),
                            child: TextFormField(
                              controller: _collabcontroller.email,
                              validator: _collabcontroller.emailValidation,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "email address",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 12.sp,
                                      fontStyle: FontStyle.italic)),
                            ).px(2.w),
                          ).px(3.w),
                          2.h.heightBox,
                          Container(
                            height: 4.5.h,
                            width: 100.w,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(blurRadius: 2, color: Colors.blueGrey)
                            ]),
                            child: TextFormField(
                              controller: _collabcontroller.phone,
                              validator: _collabcontroller.phoneValidation,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile Number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 12.sp,
                                      fontStyle: FontStyle.italic)),
                            ).px(2.w),
                          ).px(3.w),
                          2.h.heightBox,
                          Container(
                            height: 10.5.h,
                            width: 100.w,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(blurRadius: 2, color: Colors.blueGrey)
                            ]),
                            child: TextFormField(
                              controller: _collabcontroller.description,
                              validator: _collabcontroller.descriptonValidation,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Description",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 12.sp,
                                      fontStyle: FontStyle.italic)),
                            ).px(2.w),
                          ).px(3.w),
                          6.h.heightBox,
                          Container(
                            height: 5.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Color(0xFFE2BD4C),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: "SUBMIT"
                                .text
                                .black
                                .semiBold
                                .size(13.sp)
                                .makeCentered(),
                          ).px(3.w).onInkTap(() async {
                            
                            _collabcontroller.checkCollab();
                          })
                        ],
                      ),
                    ),
                  ),
                ).p8(),
              )
            ],
          ).p12(),
          app_Bar(
              Icon(Icons.arrow_back_ios).onInkTap(() {
                Get.back();
              }),
              "Collabrate with us".text.semiBold.size(14.sp).makeCentered(),
              Spacer())
        ],
      )),
    );
  }
}
