// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/const.dart';
import 'package:food_app/model/get_cat_products.dart';
import 'package:food_app/screens/cart/cart_scree.dart';
import 'package:food_app/screens/categories/categorieController/categories_controller.dart';
import 'package:food_app/screens/categories/catogery%20product/product_description.dart';
import 'package:food_app/screens/express/express%20controller/express_controller.dart';
import 'package:food_app/screens/home_page/banner%20controller/banner_controller.dart';

import 'package:food_app/screens/home_page/best%20seller%20controller/best_seller_controller.dart';
import 'package:food_app/screens/home_page/featured%20product/featured_product.dart';
import 'package:food_app/screens/home_page/goverment%20store/goverment_store.dart';

import 'package:food_app/screens/home_page/newest%20product/newsest_product_controller.dart';
import 'package:food_app/screens/home_page/product_controller/product_controller.dart';
import 'package:food_app/screens/home_page/search/search_screen.dart';
import 'package:food_app/screens/menu/menu_screen.dart';
import 'package:food_app/screens/menu/the%20Alfs/alfs_screen.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:food_app/screens/widget/cat_chip.dart';
import 'package:food_app/screens/widget/express_box.dart';
import 'package:food_app/screens/widget/fbox_item.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';

class HomePage extends GetView {
  static String route = '/home-page';
  HomePage({Key? key}) : super(key: key);
  Future<bool> onbackpress() async{
return false;
}
  final BannerController _bannerController = Get.put(BannerController());
  final CategoriesController _categoriesController =
      Get.put(CategoriesController());
  final ProductController _productController = Get.put(ProductController());
  final NewestProductcontroller _newestProductcontroller =
      Get.put(NewestProductcontroller());
  final BestSellerController _bestSellerController =
      Get.put(BestSellerController());
  ExpressController _expressController = Get.put(ExpressController());

  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      Color(0xFFE1A46A),
      Color(0xFFFEEDB8),
      Color(0xFFE5C89B),
      Color(0xFFFFB4B4),
      Color(0xFFF7FF87),
      Color(0xFFD3F894),
      Color(0xFFC4EDFF),
      Color(0xFFFFD85E),
      Color(0xFFD89CFF)
    ];
    double statusBarHeighttop = MediaQuery.of(context).padding.top;
    double statusBarHeightBottom = MediaQuery.of(context).padding.bottom;
    return WillPopScope(
      onWillPop: onbackpress,
      child: SafeArea(
          child: Obx(
        () => _categoriesController.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Container(
                    color: Color(0xFFFFFBEE),
                    height: 100.h - statusBarHeightBottom - statusBarHeighttop,
                    width: 100.w,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                10.h.heightBox,
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                    )
                                  ],
                                ).onInkTap(() {
                                  Get.to(() => SearchScreen());
                                }),
                                1.h.heightBox,
                                _bannerController.obx(
                                    (data) => Container(
                                          height: 18.h,
                                          width: 100.w,
                                          color: Color(0xFFFFFBEE),
                                          child: CarouselSlider.builder(
                                            itemCount:
                                                data!.banners.topBanners.length,
                                            itemBuilder:
                                                (context, index, realIndex) {
                                              return Container(
                                                height: 14.h,
                                                width: 100.h,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(data
                                                            .banners
                                                            .topBanners[index]))),
                                              );
                                            },
                                            options: CarouselOptions(
                                              height: 14.h,
                                              enlargeCenterPage: false,
                                              autoPlay: true,
                                              autoPlayCurve: Curves.fastOutSlowIn,
                                              enableInfiniteScroll: true,
                                              autoPlayAnimationDuration:
                                                  Duration(milliseconds: 800),
                                              viewportFraction: 1,
                                            ),
                                          ),
                                        ).px(2.w),
                                    onError: (err) => Text(err.toString())),
                                1.h.heightBox,
                                Container(
                                  // height: 21.h,
                                  width: 100.w,
                                  color: Color(0xFFFFFBEE),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 2.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      'Categories'.text.size(14.sp).bold.make(),
                                      SizedBox(
                                        // height: 17.h,
                                        child: Wrap(
                                            spacing: 2.w,
                                            runSpacing: 1.0,
                                            alignment: WrapAlignment.center,
                                            clipBehavior: Clip.hardEdge,
                                            children: [
                                              for (int i = 0;
                                                  _categoriesController
                                                              .getAllCategory
                                                              .categories!
                                                              .length <
                                                          9
                                                      ? i <
                                                          _categoriesController
                                                              .getAllCategory
                                                              .categories!
                                                              .length
                                                      : i < 9;
                                                  i++)
                                                catChip(_categoriesController
                                                        .getAllCategory
                                                        .categories![i]
                                                        .name!)
                                                    .onInkTap(() async {
                                                  CallLoader.loader();
                                                  _categoriesController
                                                      .getCatProduct(
                                                          _categoriesController
                                                              .getAllCategory
                                                              .categories![i]
                                                              .id!,
                                                          _categoriesController
                                                              .getAllCategory
                                                              .categories![i]
                                                              .name!);
                                                }),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                                1.h.heightBox,
                                Container(
                                  color: Color(0xFFFFFBEE),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          "Products".text.size(14.sp).bold.make(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Vx.green500,
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                            ),
                                            padding: EdgeInsets.all(3.sp),
                                            child: 'See All'
                                                .text
                                                .size(10.sp)
                                                .bold
                                                .white
                                                .make(),
                                          )
                                        ],
                                      ),
                                      1.h.heightBox,
                                      _productController.isLoadingProduct == true
                                          ? Center(
                                              child: CircularProgressIndicator(),
                                            )
                                          : Container(
                                              width: 100.w,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.sp),
                                              child: GridView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 18.sp,
                                                  mainAxisSpacing: 10.sp,
                                                  childAspectRatio: 10.h / 20.w,
                                                ),
                                                itemCount: _productController
                                                    .getAllCollection
                                                    .collections!
                                                    .length,
                                                itemBuilder: (context, i) {
                                                  return Container(
                                                    padding: EdgeInsets.all(5.sp),
                                                    decoration: BoxDecoration(
                                                        color: color[i],
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10.sp)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Image.network(
                                                          _productController
                                                              .getAllCollection
                                                              .collections![i]
                                                              .image!,
                                                          height: 6.h,
                                                        ),
                                                        _productController
                                                            .getAllCollection
                                                            .collections![i]
                                                            .name!
                                                            .text
                                                            .size(10.sp)
                                                            .bold
                                                            .make(),
                                                      ],
                                                    ),
                                                  ).onInkTap(() async {
                                                    CallLoader.loader();
                                                    _productController
                                                        .getProductCollection(
                                                            _productController
                                                                .getAllCollection
                                                                .collections![i]
                                                                .id,
                                                            _productController
                                                                .getAllCollection
                                                                .collections![i]
                                                                .name!);
                                                  });
                                                },
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                                1.h.heightBox,
                                Container(
                                  color: Color(0xFFFFFBEE),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          "Featured Product"
                                              .text
                                              .size(14.sp)
                                              .bold
                                              .make(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Vx.green500,
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                            ),
                                            padding: EdgeInsets.all(3.sp),
                                            child: 'See All'
                                                .text
                                                .size(10.sp)
                                                .bold
                                                .white
                                                .make(),
                                          )
                                        ],
                                      ),
                                      .5.h.heightBox,
                                      SizedBox(
                                        height: 20.h,
                                        child: ListView.builder(
                                          itemCount: 5,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, i) {
                                            return FeaturedProduct();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 18.h,
                                  width: 100.w,
                                  child: Stack(
                                    children: [
                                      _bannerController.obx((data) => Container(
                                            height: 18.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(data!
                                                        .banners
                                                        .middleUpperBanner))),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100.w,
                                  color: Color(0xFFFFFBEE),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          "Express".text.size(14.sp).bold.make(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Vx.green500,
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                            ),
                                            padding: EdgeInsets.all(3.sp),
                                            child: 'See All'
                                                .text
                                                .size(10.sp)
                                                .bold
                                                .white
                                                .make(),
                                          )
                                        ],
                                      ),
                                      1.h.heightBox,
                                      Obx(() =>
                                      _productController.isLoadingProduct.value ? Center(child: CircularProgressIndicator(),)
                                      :
                                       GridView.builder(
                                            shrinkWrap: true,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 1.w,
                                              mainAxisSpacing: 2.h,
                                            ),
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: _productController
                                                        .getAllCollection
                                                        .collections!
                                                        .length >
                                                    5
                                                ? 5
                                                : _productController
                                                    .getAllCollection
                                                    .collections!
                                                    .length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Stack(
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 30.h,
                                                      width: 100.w,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  _productController
                                                                      .getAllCollection
                                                                      .collections![
                                                                          index]
                                                                      .image!),
                                                              fit: BoxFit.fill),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      8))),
                                                    ).px(2.w),
                                                  ),
                                                  _productController
                                                      .getAllCollection
                                                      .collections![index]
                                                      .name!
                                                      .text
                                                      .white
                                                      .semiBold
                                                      .size(15.sp)
                                                      .makeCentered()
                                                ],
                                              ).onInkTap(() {
                                                _expressController
                                                    .getExpressProduct(
                                                        _productController
                                                            .getAllCollection
                                                            .collections![index]
                                                            .id);
                                              });
                                            },
                                          )),
                                      2.h.heightBox,
                                    ],
                                  ),
                                ),
                                1.h.heightBox,
                                Container(
                                  color: Color(0xFFFFF4CF),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2.h),
                                    child: Column(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/icon/alfbutton.png",
                                                height: 25.h,
                                              ),
                                              Container(
                                                height: 5.h,
                                                width: 17.h,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFE3C76E),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8))),
                                                child: "JOIN NOW"
                                                    .text
                                                    .semiBold
                                                    .size(13.sp)
                                                    .makeCentered()
                                                    .onInkTap(() {
                                                  Get.to(() => AlfsScreen());
                                                }),
                                              ),
                                              2.h.heightBox
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                2.h.heightBox,
                                Container(
                                  color: Color(0xFFFFFBEE),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          "Newest Arrivals"
                                              .text
                                              .size(14.sp)
                                              .bold
                                              .make(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Vx.green500,
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                            ),
                                            padding: EdgeInsets.all(3.sp),
                                            child: 'See All'
                                                .text
                                                .size(10.sp)
                                                .bold
                                                .white
                                                .make(),
                                          )
                                        ],
                                      ),
                                      .5.h.heightBox,
                                      Obx(
                                        () => _newestProductcontroller
                                                    .newLoading ==
                                                true
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : SizedBox(
                                                height: 20.h,
                                                child: ListView.builder(
                                                  itemCount:
                                                      _newestProductcontroller
                                                          .getNewestProduct
                                                          .products!
                                                          .length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder: (context, i) {
                                                    return Card(
                                                      elevation: 3,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8.sp),
                                                      ),
                                                      child: Container(
                                                        height: 20.h,
                                                        width: 28.w,
                                                        margin: EdgeInsets.only(
                                                            right: 5.sp),
                                                        padding:
                                                            EdgeInsets.all(3.sp),
                                                        decoration: BoxDecoration(
                                                          color: Vx.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8.sp),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Image.network(
                                                              _newestProductcontroller
                                                                  .getNewestProduct
                                                                  .products![i]
                                                                  .images![0],
                                                              height: 8.h,
                                                            ),
                                                            _newestProductcontroller
                                                                .getNewestProduct
                                                                .products![i]
                                                                .name!
                                                                .text
                                                                .size(10.sp)
                                                                .maxLines(1)
                                                                .overflow(
                                                                    TextOverflow
                                                                        .ellipsis)
                                                                .bold
                                                                .make(),
                                                            Row(
                                                              children: [
                                                                'Brnd: '
                                                                    .text
                                                                    .size(8.sp)
                                                                    .black
                                                                    .make(),
                                                                SizedBox(
                                                                  width: 18.w,
                                                                  child: 'Creamitelia'
                                                                      .text
                                                                      .size(8.sp)
                                                                      .overflow(
                                                                          TextOverflow
                                                                              .ellipsis)
                                                                      .color(Vx
                                                                          .yellow500)
                                                                      .make(),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                "₹${_newestProductcontroller.getNewestProduct.products![i].originalPrice!}"
                                                                    .text
                                                                    .size(10.sp)
                                                                    .yellow500
                                                                    .make(),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Vx
                                                                        .green500,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5.sp),
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(2
                                                                              .sp),
                                                                  child: 'Buy Now'
                                                                      .text
                                                                      .size(8.sp)
                                                                      .bold
                                                                      .white
                                                                      .make(),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ).onInkTap(() {
                                                      Get.to(() =>
                                                          ProductDescriptionScreen(
                                                            product:
                                                                _newestProductcontroller
                                                                    .getNewestProduct
                                                                    .products![i],
                                                          ));
                                                    });
                                                  },
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                                1.h.heightBox,
                                Container(
                                  color: Color(0xFFFFFBEE),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          "Best Seller"
                                              .text
                                              .size(14.sp)
                                              .bold
                                              .make(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Vx.green500,
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                            ),
                                            padding: EdgeInsets.all(3.sp),
                                            child: 'See All'
                                                .text
                                                .size(10.sp)
                                                .bold
                                                .white
                                                .make(),
                                          )
                                        ],
                                      ),
                                      .5.h.heightBox,
                                      _bestSellerController.obx(
                                          (data) => SizedBox(
                                                height: 20.h,
                                                child: ListView.builder(
                                                  itemCount:
                                                      data!.products!.length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder: (context, i) {
                                                    return BestSeller(
                                                        data: data.products![i]);
                                                  },
                                                ),
                                              ),
                                          onError: (err) => Text(err.toString())),
                                    ],
                                  ),
                                ),
                                1.h.heightBox,
                                _bannerController.obx((data) => Container(
                                      height: 18.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  data!.banners.bottomBanner))),
                                    )),
                                Container(
                                  color: Color(0xFFFFFBEE),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          "Gourment Store"
                                              .text
                                              .size(14.sp)
                                              .bold
                                              .make(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Vx.green500,
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                            ),
                                            padding: EdgeInsets.all(3.sp),
                                            child: 'See All'
                                                .text
                                                .size(10.sp)
                                                .bold
                                                .white
                                                .make(),
                                          )
                                        ],
                                      ),
                                      .5.h.heightBox,
                                      SizedBox(
                                        height: 20.h,
                                        child: ListView.builder(
                                          itemCount: 5,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, i) {
                                            return GovermentStore();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
              ),
      )),
    );
  }
}
