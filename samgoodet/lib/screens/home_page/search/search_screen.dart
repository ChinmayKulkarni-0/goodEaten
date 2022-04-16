
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/screens/cart/cart_scree.dart';
import 'package:food_app/screens/categories/catogery%20product/product%20description/review/review%20controller/review_controller.dart';
import 'package:food_app/screens/categories/catogery%20product/product_description.dart';
import 'package:food_app/screens/home_page/search/search%20controller/search_controller.dart';
import 'package:food_app/screens/menu/menu_screen.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';

import '../../../const.dart';
class SearchScreen extends StatelessWidget {
   SearchScreen({ Key? key }) : super(key: key);

   final SearchController _searchController = Get.put(SearchController());
     ReviewController _reviewController = Get.put(ReviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    color: Color(0xFFFFFBEE),
                    height: 100.h,
                    width: 100.w,
                    child: Column(
                      children: [
                       10.h.heightBox,
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 4.h,
                                            width: 84.w,
                                            padding:
                                                EdgeInsets.symmetric(horizontal: 10.sp),
                                            decoration: BoxDecoration(
                                              color: Vx.white,
                                              borderRadius:
                                                  BorderRadius.circular(15.sp),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 5,
                                                  spreadRadius: 1.0,
                                                )
                                              ],
                                            ),
                                            child: TextFormField(
                                              controller: _searchController.search,
                                              decoration: InputDecoration(
                                                hintText: "  Search here",
                                                border: InputBorder.none,
                                                suffixIcon: Icon(Icons.search).onInkTap(() {
                                                  CallLoader.loader();
                                                  _searchController.getSearch();
                                                })
                                              ),
                                            
                                            )
                                          ),
                                          Icon(
                                            Icons.filter_list,
                                            size: 20.sp,
                                          )
                                        ],
                                      ),
                                      5.h.heightBox,
                                      _searchController.obx(
                                        (data)=>
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1.w,
                            mainAxisSpacing: 4.h,
                            mainAxisExtent: 32.h,
                          ),
                          itemCount: data!.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 70.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blueGrey, blurRadius: 2)
                                  ],
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 20.h,
                                        width: 55.w,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(data
                                                    .products[index].images![0])),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                topLeft: Radius.circular(8))),
                                      ).onInkTap(() {
                                        _reviewController.getReviewApi(data.products[index].id);
                                        Get.to(()=> ProductDescriptionScreen(product: data.products[index]));
                                      }),
                                     
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
                                    height: 12.h,
                                    width: 55.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFFF2C9),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8))),
                                    child: Column(
                                      children: [
                                        1.h.heightBox,
                                        data.products[index].name!.text
                                            .overflow(TextOverflow.ellipsis)
                                            .bold
                                            .size(13.sp)
                                            .make()
                                            .px(1.w),
                                        // 1.h.heightBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 0.4.h,
                                              child: RatingBar.builder(
                                                  itemSize: 13.sp,
                                                initialRating: data.products[index].rating!.toDouble() ,
                                                ignoreGestures: true,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding: EdgeInsets.all(0),
                                                itemBuilder: (context, _) =>
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: 1),
                                                      child: Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                    ),
                                                onRatingUpdate: (rating) {
                                                  // print(rating);
                                                },
                                              ),
                                            ),
                                            Spacer(),
                                          
                                            "${data.products[index].numOfReviews!} Reviews"
                                                .text
                                                .semiBold
                                                .size(10.sp)
                                                .gray800
                                                .make()
                                          ],
                                        ).px(1.w),
                                       1.6.h.heightBox,
                                        Row(
                                          children: [
                                            "₹ ${data.products[index].originalPrice}"
                                                .text
                                                .bold
                                                .size(12.sp)
                                                .gray900
                                                .make(),
                                            Spacer(),
                                            Container(
                                              height: 4.h,
                                              width: 22.w,
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
                                                  .px(1.w),
                                            ).onInkTap(() {
                                              CallLoader.loader();
                                              _searchController.addproduct(data.products[index].id);
                                            })
                                          ],
                                        ).px(1.w)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ).px(5.w);
                          },
                        ), ),
                                    ],
                                  ),
                                )
                        ],
                    ),
                  ),
                ),
                app_Bar(
                    Icon(
                      Icons.sort,
                      size: 30.sp,
                    ).onInkTap(() {
                      Get.to(() => MenuScreen());
                    }),
                    Image.asset(
                      'assets/icon/logo.png',
                      width: 48.w,
                    ),
                    Icon(
                      Icons.local_mall_outlined,
                      size: 25.sp,
                    ).onInkTap(() {
                      Get.to(() => CartScreen());
                    }))
              ],
            ),),
    );
  }
}