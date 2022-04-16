// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/model/get_cat_products.dart';
import 'package:food_app/screens/cart/cart_scree.dart';
import 'package:food_app/screens/categories/catogery%20product/product_description.dart';
import 'package:food_app/screens/favourite/favourite_controller/favourite_controller.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const.dart';

class FavouriteScreen extends StatelessWidget {
   FavouriteScreen({Key? key}) : super(key: key);

   final FavouriteController _favouriteController = Get.put(FavouriteController());


  @override
  Widget build(BuildContext context) {
    double statusBarHeighttop = MediaQuery.of(context).padding.top;
    double statusBarHeightBottom = MediaQuery.of(context).padding.bottom;
    return SafeArea(
      child: 
      Obx(()=> _favouriteController.isLoadingFavoutite == true ? Center(
        child: CircularProgressIndicator(),
      ):
      Stack(
        children: [
          Container(
            color: Color(0xFFFFFBEE),
            height: 100.h - statusBarHeightBottom - statusBarHeighttop,
            width: 100.w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  10.h.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      33.w.widthBox,
                      "Favourite Items".text.bold.size(13.sp).makeCentered(),
                      Spacer(),
                      Container(
                        height: 4.h,
                        width: 22.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 2,
                              )
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Row(
                          children: [
                            "Sort by".text.size(12.sp).semiBold.make(),
                            Spacer(),
                            Icon(Icons.arrow_downward_rounded, size: 2.5.h)
                          ],
                        ).px(1.w),
                      )
                    ],
                  ).px(5.w),
                  5.h.heightBox,
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.w,
                      mainAxisSpacing: 4.h,
                      mainAxisExtent: 32.h,
                    ),
                   itemCount: _favouriteController.getfavouriteModel.favourites!.products!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.blueGrey, blurRadius: 2)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            _favouriteController.getfavouriteModel.favourites!.products![index].images![index]
                                              )),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8))),
                                ),
                                Positioned(
                                  right: 22.w,
                                  top: 1.h,
                                  child: Image.asset(
                                    "assets/icon/heart.png",
                                    height: 3.h,
                                    width: 20.w,
                                  ).px(1.w),
                                ),
                                Positioned(
                                    right: 3.w,
                                    top: 1.h,
                                    child: Icon(
                                      Icons.share_outlined,
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                            Container(
                            
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFF2C9),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8))),
                              child: Column(
                                children: [
                                  1.h.heightBox,
                                  _favouriteController.getfavouriteModel.favourites!.products![index].name
                                     ! .text
                                      .overflow(TextOverflow.ellipsis)
                                      .bold
                                      .size(13.sp)
                                      .make()
                                      .px(1.w),
                                  1.h.heightBox,
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 3.h,
                                        width: 20.w,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[900],
                                                  size: 1.3.h,
                                                ),
                                                0.51.w.widthBox
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                      "10 Reviews"
                                          .text
                                          .semiBold
                                          .size(10.sp)
                                          .gray800
                                          .make()
                                    ],
                                  ).px(1.w),
                                  1.w.widthBox,
                                  Row(
                                    children: [
                                      _favouriteController.getfavouriteModel.favourites!.products![index].originalPrice!
                                          .text
                                          .bold
                                          .size(12.sp)
                                          .gray900
                                          .make(),
                                      Spacer(),
                                      Container(
                                      height: 3.7.h,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFE1B839),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: "Add To Cart"
                                            .text
                                            .size(12.sp)
                                            .semiBold
                                            .white
                                            .makeCentered()
                                            .px(1.w).onInkTap(() {
                                              CallLoader.loader();
                                              print("product id in favouratie Screen${_favouriteController.getfavouriteModel.favourites!.products![index].id}");
                                              _favouriteController.addproduct("${_favouriteController.getfavouriteModel.favourites!.products![index].id}");
                                            }),
                                      )
                                    ],
                                  ).px(1.w)
                                ],
                              ),
                            )
                          ],
                        ),
                      ).onInkTap(() {
                        Get.to(()=> ProductDescriptionScreen(
                          product: _favouriteController.getfavouriteModel.favourites!.products![index] ,
                        ));
                      }).px(5.w);
                    },
                  ),
                  200.h.heightBox,
                ],
              ),
            ),
          ),
          app_Bar(
              Icon(
                Icons.sort,
                size: 30.sp,
              ),
              "Favourite".text.semiBold.size(14.sp).makeCentered(),
              Icon(
                Icons.local_mall_outlined,
                size: 25.sp,
              ).onInkTap(() {
      Get.to(()=> CartScreen());
                }))
        ],
      ),),
    );
  }
}
