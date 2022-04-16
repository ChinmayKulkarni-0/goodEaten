// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/main_page.dart';
import 'package:food_app/screens/onbording_screen/onboarding_screen.dart';
import 'package:food_app/screens/signUp_screen.dart/signup_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var prefs = GetStorage();
  String ? checkToken = prefs.read('email');
  if(checkToken != null)
  {
    token = checkToken;
  }
    super.initState();
    Timer(Duration(seconds: 3),

    token!=''? ()=> Navigator.pushNamed(context, MainPage.route)

     :   () => Navigator.pushNamed(context, OnboardingScreen.route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            5.h.heightBox,
            Container(
              width: 90.w,
              child:
                  '"There is still by default a white background. I tried to wrap my ClipRRect in a container."'
                      .text
                      .center
                      .size(16.sp)
                      .italic
                      .make(),
            ),
          ],
        ),
      ),
    );
  }
}
class LoginDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream:FirebaseAuth.instance.authStateChanges() ,
       builder: ( context,snapshot) { 
         if(snapshot.connectionState == ConnectionState.waiting) {
           return Center(child: CircularProgressIndicator());
         }else if(snapshot.hasData){
              return MainPage();
        }else if(snapshot.hasError){
          return Center(child: Text("Something Went Wrong"));
        }else{
          return SignupScreen();
        }
       })
    );
  }
}