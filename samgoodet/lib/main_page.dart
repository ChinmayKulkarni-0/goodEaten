// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/screens/favourite/favourite_screen.dart';
import 'package:food_app/screens/home_page/home_page.dart';

import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'screens/account/account_page.dart';
import 'screens/express/express_screen.dart';

class MainPage extends StatefulWidget {
  static String route = '/main-page';
 
  MainPage({Key? key, this.i}) : super(key: key);
  int? i;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   
  List<Widget> page = [
    HomePage(),
    ExpressScreen(),
   FavouriteScreen(),
    AccountSrceen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.amber[100],
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.sp),
            topRight: Radius.circular(30.sp),
          ),
          child: BottomNavigationBar(
            backgroundColor: Color(0xFFE4CC80),
            currentIndex: widget.i ?? 0,
            iconSize: 20.sp,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: (widget.i ?? 0) == 0
                      ? Container(
                          padding: EdgeInsets.all(4.sp),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 1.0,
                              )
                            ],
                            shape: BoxShape.circle,
                            color: Vx.yellow600,
                          ),
                          child: Icon(
                            Icons.home_outlined,
                            size: 20.sp,
                            color: Vx.black,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(4.sp),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 1.0,
                              )
                            ],
                            shape: BoxShape.circle,
                            color: Vx.white,
                          ),
                          child: Icon(
                            Icons.home_outlined,
                            size: 20.sp,
                            color: Vx.gray500,
                          ),
                        ),
                  label: 'home'),
              BottomNavigationBarItem(
                icon: widget.i == 1
                    ? Container(
                        padding: EdgeInsets.all(4.sp),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Vx.yellow600,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Image.asset(
                          'assets/icon/express.png',
                          height: 3.8.h,
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(4.sp),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Vx.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Image.asset(
                          'assets/icon/express.png',
                          height: 3.8.h,
                        ),
                      ),
                label: 'Finds',
              ),
              BottomNavigationBarItem(
                  icon: widget.i == 2
                      ? Container(
                          padding: EdgeInsets.all(4.sp),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Vx.yellow600,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 1.0,
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.favorite_outline,
                            size: 20.sp,
                            color: Vx.black,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(4.sp),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Vx.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 1.0,
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.favorite_outline,
                            size: 20.sp,
                            color: Vx.gray500,
                          ),
                        ),
                  label: 'Groups'),
              BottomNavigationBarItem(
                  icon: widget.i == 3
                      ? Container(
                          padding: EdgeInsets.all(4.sp),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Vx.yellow600,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 1.0,
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.person_outline,
                            size: 20.sp,
                            color: Vx.black,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(4.sp),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Vx.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 1.0,
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.person_outline,
                            size: 20.sp,
                            color: Vx.gray500,
                          ),
                        ),
                  label: 'Notification'),
            ],
            onTap: (index) {
            widget.i = index;
              setState(() {});
            },
          ),
        ),
      ),
      body: page.elementAt(widget.i ?? 0),
    );
  }
}
