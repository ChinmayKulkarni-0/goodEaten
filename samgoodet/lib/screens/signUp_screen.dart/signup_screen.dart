// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/Facebook_provider.dart';
import 'package:food_app/api%20provider/Google_provider.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/const.dart';
import 'package:food_app/screens/login_screen/login_screen.dart';

import 'package:food_app/screens/signUp_screen.dart/widget/textfield_box.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:dio/dio.dart' as dio;

class SignupScreen extends StatelessWidget {
  static String route = '/signup-screen';
  SignupScreen({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
    Future<bool> onbackpress() async{
return false;
}
  bool _isHidden = true; 
  @override

      void _PasswordView() {
    setState(() {
        _isHidden = !_isHidden;
    });
}
  
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
              width: 100.h,
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
                  3.h.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 4.h,
                        width: 30.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.route);
                          },
                          child: Text('Login').text.black.make(),
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
                            // Navigator.pushNamed(context, SignupScreen.route);
                          },
                          child: Text('Signup').text.green500.make(),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: StadiumBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                  4.h.heightBox,
                  TextFieldBox('Full name', name),
                  2.h.heightBox,
                  TextFieldBox('Email Address', email),
                  2.h.heightBox,
            Container(
               height: 5.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: TextFormField(
                  obscureText: _isHidden,
                  controller: password,
                   style: TextStyle(fontSize: 14.sp),
                  decoration: InputDecoration(
                 filled: true,
                    fillColor: Vx.white,
                    enabledBorder: OutlineInputBorder(
              //borderRadius: BorderRadius.circular(5.sp),
              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Vx.gray400),
                    contentPadding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 10.sp),
                    labelText: 'Password',
                    labelStyle:TextStyle(color: Vx.gray400), 
                    suffix: IconButton(
                      onPressed: _PasswordView,
                            icon:Icon(
                        _isHidden ?         /// CHeck Show & Hide.
                         Icons.visibility :
                         Icons.visibility_off,
                      ),
                    ),
                    /*icon: Icon(
                      Icons.password_sharp,
                      color: Colors.black,
                    ),*/
                  ),
                ),
            ),
    
                  2.h.heightBox,
                  TextFieldBox('Mobile Number', phone),
                  3.h.heightBox,
                  SizedBox(
                    width: 35.w,
                    height: 5.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (email.text.isNotEmpty&& phone.text.isNotEmpty&& password.text.isNotEmpty && name.text.isNotEmpty) {
                         CallLoader.loader();
                            ApiProvider.registerApi(
                            email.text, password.text, phone.text, name.text);          
                            print(emailStore);
                        }
                        else{
                          Get.snackbar("", "please enter required fields",
                              colorText: Colors.black,
                              snackPosition: SnackPosition.BOTTOM,
                              );
                        }
                      },
                      child: Text('SignUp').text.size(16.sp).bold.make(),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.sp), // <-- Radius
                        ),
                      ),
                    ),
                  ),
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
                                onTap: (){
                                  signInWithFacebook();
                                },
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

  void setState( _PasswordView) {
     _isHidden = !_isHidden;
  }
}
