// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/screens/cart/cart_scree.dart';
import 'package:food_app/screens/express/express%20controller/express_controller.dart';
import 'package:food_app/screens/express/product%20details/express_product_details.dart';
import 'package:food_app/screens/home_page/product_controller/product_controller.dart';
import 'package:food_app/screens/home_page/search/search_screen.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class ExpressScreen extends StatelessWidget {
   ExpressScreen({Key? key}) : super(key: key);
     ProductController _productController = Get.find();
     ExpressController _expressController = Get.put(ExpressController());
  @override
  Widget build(BuildContext context) {
    double statusBarHeighttop = MediaQuery.of(context).padding.top;
    double statusBarHeightBottom = MediaQuery.of(context).padding.bottom;
    return SafeArea(
      child: Stack(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 4.h,
                        width: 84.w,
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        decoration: BoxDecoration(
                          color: Vx.white,
                          borderRadius: BorderRadius.circular(15.sp),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'Search Here'.text.size(12.sp).make(),
                            Icon(
                              Icons.search,
                              size: 18.sp,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.filter_list,
                        size: 20.sp,
                      ),
                    ],
                  ).onInkTap(() {
                    Get.to(()=> SearchScreen());
                  }).px(3.w),
                  4.h.heightBox,
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.w,
                      mainAxisSpacing: 2.h,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:_productController.getAllCollection.collections!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          InkWell(
                            onTap: (){
                              //  _expressController.expressProduct.products.length;
                               print("object");
                            },
                            child: Container(
                              height: 30.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                               image: DecorationImage(image: NetworkImage(_productController.getAllCollection.collections![index].image!),
                               fit: BoxFit.fill
                               ),
                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                            ).px(2.w),
                          ),
                          _productController.getAllCollection.collections![index].name!.text.white.semiBold.size(15.sp).makeCentered()
                        ],
                      ).onInkTap(() {
                        _expressController.getExpressProduct(_productController.getAllCollection.collections![index].id).toString();
                      });
                    },
                  ),
                  2.h.heightBox,
                ],
              ),
            ),
          ),
          app_Bar(
              Icon(
                Icons.sort,
                size: 30.sp,
              ),
              "Express".text.semiBold.size(14.sp).makeCentered(),
              Icon(
                Icons.local_mall_outlined,
                size: 25.sp,
              ).onInkTap(() {
             Get.to(()=> CartScreen());
              }))
        ],
      ),
    );
  }
}
