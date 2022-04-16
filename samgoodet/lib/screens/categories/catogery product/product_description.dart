// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/const.dart';
import 'package:food_app/model/get_cat_products.dart';
import 'package:food_app/screens/categories/catogery%20product/product%20description/product_description_controller.dart';
import 'package:food_app/screens/categories/catogery%20product/product%20description/review/review%20controller/review_controller.dart';
import 'package:food_app/screens/home_page/best%20seller%20controller/best_seller_controller.dart';
import 'package:food_app/screens/home_page/product_controller/product_controller.dart';
import 'package:food_app/screens/widget/fbox_item.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDescriptionScreen extends StatelessWidget {
  ProductDescriptionScreen({Key? key, required this.product}) : super(key: key);

  Product product;
  final BestSellerController _bestSellerController = Get.find();
  final ProductController _productController = Get.find();
  ReviewController _reviewController = Get.find();
  ProductDescriptionController _controller =
      Get.put(ProductDescriptionController());

  @override
  Widget build(BuildContext context) {
    print(product.description.toString());
    return Scaffold(
        backgroundColor: Color(0xFFFFFBEE),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                2.h.heightBox,
                Container(
                  height: 30.h,
                  width: 100.w,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.arrow_back_ios).onInkTap(() {
                            Get.back();
                          }),
                          10.w.widthBox,
                          product.name!.text.semiBold.size(16.sp).make()
                        ],
                      ).p12(),
                      Row(
                        children: [
                          3.w.widthBox,
                          Obx(() => Container(
                                height: 20.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                      color: Colors.black, width: 0.4.w),
                                  image: DecorationImage(
                                      image: NetworkImage(product.images![
                                          _controller.selectedImg.value]),
                                      fit: BoxFit.fill),
                                ),
                              )),
                          Spacer(),
                          SizedBox(
                            height: 22.h,
                            width: 30.w,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: product.images!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Obx(
                                      () => Container(
                                        height: 14.h,
                                        width: 10.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          border: Border.all(
                                              color: _controller
                                                          .selectedImg.value ==
                                                      index
                                                  ? Colors.blue
                                                  : Colors.white),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  product.images![index]),
                                              fit: BoxFit.fill),
                                        ),
                                      ).onInkTap(() {
                                        _controller.selectedImg.value = index;
                                      }),
                                    ),
                                    1.h.heightBox,
                                  ],
                                );
                              },
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ).px(2.w),
                2.h.heightBox,
                Container(
                  width: 100.w,
                  color: Colors.white,
                  child: Column(
                    children: [
                      2.h.heightBox,
                      Row(
                        children: [
                          product.name!.text.semiBold.size(16.sp).make(),
                          Spacer(),
                          SizedBox(
                            child: RatingBar.builder(
                              itemSize: 18.sp,
                              initialRating: product.rating!.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              ignoreGestures: true,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.all(0),
                              itemBuilder: (context, _) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                child: Icon(
                                  Icons.star,
                                  size: 2.h,
                                  color: Colors.amber,
                                ),
                              ),
                              onRatingUpdate: (rating) {
                                // print(product.rating);
                                // print(rating);
                              },
                            ).objectCenterRight(),
                          ),
                        ],
                      ).px(2.w),
                      1.h.heightBox,
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Special Prices"
                                  .text
                                  .red700
                                  .semiBold
                                  .size(12.sp)
                                  .make(),
                              "₹ ${product.originalPrice}"
                                  .text
                                  .red700
                                  .semiBold
                                  .size(12.sp)
                                  .make(),
                              "Discount Avialable"
                                  .text
                                  .semiBold
                                  .size(12.sp)
                                  .make(),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 5.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                color: Color(0xFFE2BD4C),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: "BUY NOW"
                                .text
                                .white
                                .semiBold
                                .size(13.sp)
                                .makeCentered(),
                          )
                        ],
                      ).px(2.w),
                      2.h.heightBox,
                      "About the product "
                          .text
                          .semiBold
                          .size(16.sp)
                          .make()
                          .objectTopLeft()
                          .px(2.w),
                      3.h.heightBox,
                      "${product.description}"
                          .text
                          .size(10.sp)
                          .italic
                          .gray400
                          .make()
                          .px(2.w),
                      3.h.heightBox,
                      "Notes"
                          .text
                          .semiBold
                          .size(16.sp)
                          .make()
                          .objectTopLeft()
                          .px(2.w),
                      2.h.heightBox,
                      "> Maximum order value is 100"
                          .text
                          .size(12.sp)
                          .italic
                          .gray400
                          .make()
                          .objectTopLeft()
                          .px(2.w),
                      "> Maximum order value is 100"
                          .text
                          .size(12.sp)
                          .italic
                          .gray400
                          .make()
                          .objectTopLeft()
                          .px(2.w),
                      "> Maximum order value is 100"
                          .text
                          .size(12.sp)
                          .italic
                          .gray400
                          .make()
                          .objectTopLeft()
                          .px(2.w),
                      2.h.heightBox,
                      Container(
                        height: 05.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: Color(0xFFE2BD4C),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: "BUY NOW"
                            .text
                            .white
                            .semiBold
                            .size(13.sp)
                            .makeCentered(),
                      ).px(2.w),
                      1.h.heightBox,
                      Container(
                        height: 5.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: Color(0xFFE2BD4C),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: "Add TO CART"
                            .text
                            .white
                            .semiBold
                            .size(13.sp)
                            .makeCentered(),
                      ).onInkTap(() {
                        CallLoader.loader();

                        print("product's id in product screen ${product.id}");

                        _controller.addproduct(product.id);
                      }).px(2.w)
                    ],
                  ),
                ).px(2.w),
                2.h.heightBox,
                Column(
                  children: [
                    2.h.heightBox,
                    Container(
                      child: "Latest Reviews"
                          .text
                          .semiBold
                          .size(16.sp)
                          .make()
                          .px(2.w)
                          .objectTopLeft(),
                    ),
                    _reviewController.obx(
                      (data) => ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data!.review.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 7.h,
                                    width: 7.h,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                  ),
                                  3.w.widthBox,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            data.review[index].user.name,
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                           40.w.widthBox,
                                  RatingBar.builder(
                                    itemSize: 10.sp,
                                    initialRating: data.review[index].starRating.toDouble(),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    ignoreGestures: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.all(0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  )
                                        ],
                                      ),
                                      Text(
                                        data.review[index].review,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              2.h.heightBox,
                            ],
                          );
                        },
                      ),
                    ),
                  
                  ],

                ).px(2.w),
                2.h.heightBox,
                GestureDetector(
                     onTap:(){
                                    Text("dfkg");
                                  },
                  child: Container(
                    height: 26.h,
                    width: 100.w,
                    color: Color(0xFFFFFBEE),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Trending Product".text.size(14.sp).bold.make(),
                            Container(
                              decoration: BoxDecoration(
                                color: Vx.green500,
                                borderRadius: BorderRadius.circular(5.sp),
                              ),
                              padding: EdgeInsets.all(3.sp),
                              child: 'See All'.text.size(10.sp).bold.white.make(),
                            )
                          ],
                        ),
                        .5.h.heightBox,
                        _bestSellerController.obx(
                            (data) => SizedBox(
                                  height: 20.h,
                                  child: ListView.builder(
                                    itemCount: data!.products!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) {
                                      return BestSeller(data: data.products![i]);
                                    },
                                  ),
                                ),
                            onError: (err) => Text(err.toString())),
                      ],
                    ),
                  ),
                ),
              ],
            ).p8(),
          ),
        ));
  }
}
