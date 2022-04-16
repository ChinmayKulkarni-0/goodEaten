// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/const.dart';
import 'package:food_app/screens/categories/catogery%20product/product%20description/review/review%20controller/review_controller.dart';
import 'package:food_app/screens/categories/catogery%20product/product_description.dart';
import 'package:food_app/screens/express/express%20controller/express_controller.dart';
import 'package:food_app/screens/favourite/favourite_controller/favourite_controller.dart';

import 'package:food_app/screens/widget/app_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class ExpressProductDetailsScreen extends StatelessWidget {
  ExpressProductDetailsScreen({Key? key}) : super(key: key);
FavouriteController _favouriteController = Get.find();
  ExpressController _controller = Get.find();
  ReviewController _reviewController = Get.put(ReviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _controller.obx(
          (data) => Stack(
            children: [
              Container(
                color: Color(0xFFFFFBEE),
                height: 100.h,
                width: 100.w,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      10.h.heightBox,
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 3.h,
                          ).onInkTap(() {
                            Get.back();
                          }),
                          Spacer(),
                          //  data!.products.first.productCollection!.text.semiBold.size(14.sp).makeCentered(),
                          10.w.widthBox,
                          Container(
                            height: 4.h,
                            width: 19.w,
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
                                "Sort by".text.size(10.sp).semiBold.make(),
                                1.w.widthBox,
                                Icon(Icons.arrow_downward_rounded, size: 2.h)
                              ],
                            ).px(1.w),
                          )
                        ],
                      ).px(3.w),
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
                                    Obx(
                                      ()=> Icon(
                                                                     _controller.fav.value ?       Icons.favorite : Icons.favorite_border,
                                        color: _controller.fav.value ? Colors.red: Colors.black,
                                      ).onInkTap(() {
                                        print("tapped");
                                      _controller.addFavOuriteApi(data.products[index].id);
                                      }).px(1.w),
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
                                            _controller.addproduct(data.products[index].id);
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
                      ),
                      20.h.heightBox,
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
                  ).onInkTap(() {}))
            ],
          ),
        ),
      ),
    );
  }
}
