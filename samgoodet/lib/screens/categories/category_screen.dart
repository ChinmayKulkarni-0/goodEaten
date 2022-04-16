// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_app/const.dart';
import 'package:food_app/model/get_cat_products.dart';
import 'package:food_app/screens/cart/cart_scree.dart';
import 'package:food_app/screens/categories/categorieController/categories_controller.dart';
import 'package:food_app/screens/categories/catogery%20product/product%20description/review/review%20controller/review_controller.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catogery product/product_description.dart';

class CaterogyScreen extends StatelessWidget {
  CaterogyScreen({
    Key? key,
    required this.title,
    required this.product,
  }) : super(key: key);

  final title;
  GetCatProducts product;
  final CategoriesController _categoriesController = Get.find();
  final ReviewController _reviewController = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => _categoriesController.isLoading.value == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Stack(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                              ).onInkTap(() {
                                Get.back();
                              }),
                              Spacer(),
                              "$title".text.bold.size(13.sp).makeCentered(),
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
                                    Icon(Icons.arrow_downward_rounded,
                                        size: 2.5.h)
                                  ],
                                ).px(1.w),
                              )
                            ],
                          ).px(5.w),
                          5.h.heightBox,
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 1.w,
                              mainAxisSpacing: 4.h,
                              mainAxisExtent: 27.5.h,
                            ),
                            itemCount: product.products!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var price =
                                  product.products![index].originalPrice! -
                                      product.products![index].discount!;
                              return Container(
                                height: 55.h,
                                width: 55.w,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.blueGrey, blurRadius: 2)
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 15.h,
                                          width: 55.w,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(product
                                                      .products![index]
                                                      .images![0])),
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  topLeft: Radius.circular(8))),
                                        ),
                                        Obx(() => Positioned(
                                              right: 22.w,
                                              top: 1.h,
                                              child: InkWell(
                                                onTap: () {
                                                  _categoriesController
                                                      .addFavOuriteApi(product
                                                          .products![index].id);
                                                },
                                                child: Icon(
                                                  _categoriesController
                                                          .fav.value
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: _categoriesController
                                                          .fav.value
                                                      ? Colors.red
                                                      : Colors.black,
                                                ).px(1.w),
                                              ),
                                            )),
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
                                          // 1.h.heightBox,
                                          product.products![index].name!.text
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
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: 5,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors
                                                              .yellow[900],
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
                                              "₹ $price"
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: "Add To Cart"
                                                    .text
                                                    .size(12.sp)
                                                    .semiBold
                                                    .white
                                                    .makeCentered()
                                                    .px(1.w),
                                              ).onInkTap(() async {
                                                CallLoader.loader();
                                                print(
                                                    'Product id in Category screen ${_categoriesController.getCatProducts.products![index].id}');
                                                _categoriesController
                                                    .addproduct(
                                                        _categoriesController
                                                            .getCatProducts
                                                            .products![index]
                                                            .id);
                                              })
                                            ],
                                          ).px(1.w)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ).px(5.w).onInkTap(() {
                                Get.to(() => ProductDescriptionScreen(
                                    product: product.products![index]));
                              });
                            },
                          ),
                          5.h.heightBox,
                          Image.asset("assets/image/banner.png").px(3.w),
                          5.h.heightBox,
                          2.h.heightBox
                        ],
                      ),
                    ),
                  ),
                  app_Bar(
                      Icon(
                        Icons.sort,
                        size: 30.sp,
                      ).onInkTap(() {}),
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
              ),
            ),
    ));
  }
}
