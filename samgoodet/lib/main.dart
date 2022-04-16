// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:food_app/main_page.dart';
import 'package:food_app/screens/home_page/home_page.dart';
import 'package:food_app/screens/login_screen/login_screen.dart';
import 'package:food_app/screens/onbording_screen/onboarding_screen.dart';
import 'package:food_app/screens/otp_screen/otp_screen.dart';
import 'package:food_app/screens/signUp_screen.dart/signup_screen.dart';
import 'package:food_app/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'api provider/Google_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) async {
    await GetStorage.init();
    runApp(const MyApp());
  });
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (context) => GoogleLogin(),
          child: GetMaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreen(),
              OnboardingScreen.route: (context) => OnboardingScreen(),
              LoginScreen.route: (context) => LoginScreen(),
              SignupScreen.route: (context) => SignupScreen(),
              OtpScreen.route: (context) => OtpScreen(),
              MainPage.route: (context) => MainPage(),
              HomePage.route: (context) => HomePage(),
            },
          ),
        );
      },
    );
  }
}
