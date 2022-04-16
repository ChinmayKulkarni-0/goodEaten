// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({ Key? key }) : super(key: key);

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
               12.h.heightBox,
              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

'''.text.italic.size(12.sp).make()  
                ],
              ).px(3.w),
               app_Bar(Icon(Icons.arrow_back_ios).onInkTap(() {
            Get.back();
          }), "Terms & Condition".text.semiBold.size(15.sp).make(), Spacer())
            ],
          ),
        ),
      ),
    );
  }
}