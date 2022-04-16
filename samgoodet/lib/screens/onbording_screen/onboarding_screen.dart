// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/main_page.dart';
import 'package:food_app/screens/login_screen/login_screen.dart';
import 'package:food_app/screens/signUp_screen.dart/signup_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class OnboardingScreen extends StatelessWidget {
  static String route = '/onboarding-sreen';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
            //color: Vx.red300,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image/splash.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/logo.png',
                width: 80.w,
              ),
              10.h.heightBox,
              'Already Have an Account...!'.text.bold.size(14.sp).make(),
              4.h.heightBox,
              Container(
                height: 6.h,
                width: 80.w,
                color: Vx.yellow500,
                child: 'Login'.text.size(18.sp).white.bold.make().centered(),
              ).onTap(() {
                Navigator.pushNamed(context, LoginScreen.route);
              }),
              2.h.heightBox,
              'OR'.text.size(12.sp).bold.make(),
              2.h.heightBox,
              Container(
                height: 6.h,
                width: 80.w,
                color: Vx.green500,
                child: 'Create New Account'
                    .text
                    .size(18.sp)
                    .white
                    .bold
                    .make()
                    .centered(),
              ).onTap(() {
                Navigator.pushNamed(context, SignupScreen.route);
              }),
              2.h.heightBox,
              SizedBox(
                child: GestureDetector(
                  onTap: (){
                     Navigator.pushNamed(context, MainPage.route);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'Take a Tour'.text.size(12.sp).bold.make(),
                      2.w.widthBox,
                      Icon(
                        Icons.arrow_forward,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
