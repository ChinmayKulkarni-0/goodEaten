// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/const.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  static String route = '/otp-screen';
  OtpScreen({Key? key, email}) : super(key: key);

  final TextEditingController _otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double statusBarHeighttop = MediaQuery.of(context).padding.top;
    double statusBarHeightBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
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
                8.h.heightBox,
                Container(
                  height: 40.h,
                  width: 80.w,
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    color: Vx.white,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Column(
                    children: [
                      2.h.heightBox,
                      RichText(
                        text: TextSpan(
                          text:
                              'Enter the One Time Password that we have sent you on your mobile number - ',
                          style:
                              TextStyle(color: Colors.black, fontSize: 10.sp),
                          children: <TextSpan>[
                            TextSpan(
                              text: '+91234567890',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      6.h.heightBox,
                      PinCodeTextField(
                        controller: _otp,
                        appContext: context,
                        length: 6,
                        keyboardType: TextInputType.number,
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                        ),
                        pinTheme: PinTheme(
                          selectedColor: Colors.blue,
                          inactiveColor: Colors.black,
                          shape: PinCodeFieldShape.underline,
                        ),
                        backgroundColor: Colors.white,
                        onCompleted: (v) {},
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          'Resend '.text.green500.size(12.sp).make(),
                          // '(1:30)'.text.size(12.sp).make(),
                        ],
                      ),
                      5.h.heightBox,
                      SizedBox(
                        width: 35.w,
                        height: 5.h,
                        child: ElevatedButton(
                          onPressed: () {
                            CallLoader.loader();
                            if (_otp.text.isNotEmpty) {
                              ApiProvider.otpLogin(_otp.text);
                            } else {
                              Get.snackbar(
                                "",
                                "please enter required fields",
                                colorText: Colors.black,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },
                          child: Text('Verify').text.size(16.sp).bold.make(),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(1.sp), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
