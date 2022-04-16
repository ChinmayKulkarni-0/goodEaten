// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/Facebook_provider.dart';
import 'package:food_app/api%20provider/Google_provider.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/const.dart';
import 'package:food_app/screens/otp_screen/otp_screen.dart';

import 'package:food_app/screens/signUp_screen.dart/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
  static String route = '/login-screen';
  LoginScreen({Key? key}) : super(key: key);

      TextEditingController email = TextEditingController();
      TextEditingController password = TextEditingController();
    Future<bool> onbackpress() async{
return false;
}
  @override
  Widget build(BuildContext context) {
    double statusBarHeighttop = MediaQuery.of(context).padding.top;
    double statusBarHeightBottom = MediaQuery.of(context).padding.bottom;

    return WillPopScope(
      onWillPop: onbackpress,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: 100.h - statusBarHeightBottom - statusBarHeighttop,
              width: 100.w,
              decoration: const BoxDecoration(
                //color: Vx.red300,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/splash.png'),
                ),
              ),
              child: Column(
                children: [
                  2.h.heightBox,
                  Image.asset(
                    'assets/icon/logo.png',
                    width: 80.w,
                  ),
                  4.h.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 4.h,
                        width: 30.w,
                        child: ElevatedButton(
                          onPressed: () {
    
                          },
                          child: Text('Login').text.green500.make(),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: StadiumBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                        width: 30.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignupScreen.route);
                          },
                          child: Text('Signup').text.black.make(),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: StadiumBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                  4.h.heightBox,
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.sp),
                    child: TextField(
                      controller: email,
                      style: TextStyle(fontSize: 14.sp),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Vx.white,
                        enabledBorder: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(5.sp),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Vx.gray400),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 4.sp, horizontal: 10.sp),
                      ),
                    ),
                  ),
                  1.h.heightBox,
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.sp),
                    child: TextField(
                      controller: password,
                      obscureText: true,
                      style: TextStyle(fontSize: 14.sp),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Vx.white,
                        enabledBorder: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(5.sp),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Vx.gray400),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 4.sp, horizontal: 10.sp),
                      ),
                    ),
                  ),
                  2.h.heightBox,
                  SizedBox(
                    width: 35.w,
                    height: 5.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (email.text.isNotEmpty&& password.text.isNotEmpty) {
                          CallLoader.loader();
                             ApiProvider.loginApi(email.text, password.text);
                        }
                        else{
                                Get.snackbar("", "please enter required fields",
      colorText: Colors.black,
       snackPosition: SnackPosition.BOTTOM,
       
      );
                        }
                  
                      },
                      child: Text('Login').text.size(16.sp).bold.make(),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.sp), // <-- Radius
                        ),
                      ),
                    ),
                  ),
                  2.h.heightBox,
                  GestureDetector(
                    onTap:(){
                       Navigator.pushNamed(context, OtpScreen.route);
                    },
                    child: 'Forget Password ?'.text.size(10.sp).bold.make()),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        'OR'.text.size(10.sp).bold.make(),
                        1.h.heightBox,
                        'Login with'.text.size(10.sp).bold.make(),
                        3.h.heightBox,
                        SizedBox(
                          width: 70.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                 onTap: (){
                                  final provider =Provider.of<GoogleLogin>(context, listen:false);
                                  provider.googleLogin();
                                },
                                child: Image.asset(
                                  'assets/icon/google.png',
                                  height: 7.h,
                                ),
                              ),
                              GestureDetector(
                                onTap:(() => signInWithFacebook()),
                                child: Image.asset(
                                  'assets/icon/meta.png',
                                  height: 7.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                        5.h.heightBox,
                        'Privacy Policy'.text.size(10.sp).bold.make(),
                        2.h.heightBox,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
