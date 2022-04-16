// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:food_app/main_page.dart';
import 'package:food_app/model/getCartModel.dart';
import 'package:food_app/screens/cart/cart%20controller/cart_controller.dart';
import 'package:food_app/screens/cart/widgets/cart_tile.dart';
import 'package:food_app/screens/home_page/best%20seller%20controller/best_seller_controller.dart';
import 'package:food_app/screens/payment/payment%20controller/payment_controller.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:food_app/screens/widget/fbox_item.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final CartController _cartController = Get.put(CartController());
final BestSellerController _bestSellerController = Get.find();
final PaymentController _paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFBEE),
        body: SafeArea(
          child: Obx(() => _cartController.isLoading.value == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              :  Stack(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          12.h.heightBox,
                          Row(
                            children: [
                              "Items you have saved in your cart "
                                  .text
                                  .semiBold
                                  .size(13.sp)
                                  .make(),
                              Spacer(),
                              Container(
                                height: 4.h,
                                width: 6.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blueGrey, blurRadius: 2)
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                // child:
                                //     "${_cartController.getCartModel.cart!.products!}"
                                //         .text
                                //         .green800
                                //         .size(14.sp)
                                //         .makeCentered(),
                               )
                            ],
                          ).px(3.w),
                          3.h.heightBox,
                          StreamBuilder<GetCartModel>(
                              stream: _cartController.getCartStream(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    children: [
                                      ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              snapshot.data!.cart!.products!.length,
                                          itemBuilder: (context, index) {
                                            return CartTile(
                                                data: snapshot
                                                    .data!.cart!.products![index]);
                                          }),
                                           6.h.heightBox,
                          Container(
                              height: 6.h,
                              width: double.infinity,
                              color: Color(0xFFEFDB9B),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icon/order.png",
                                    height: 2.h,
                                  ),
                                  5.w.widthBox,
                                  "View Past Orders"
                                      .text
                                      .semiBold
                                      .size(13.sp)
                                      .make(),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blueGrey,
                                            blurRadius: 2)
                                      ],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ).px(4.w)),
                          2.h.heightBox,
                          Container(
                            height: 6.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Color(0xFFE2C055),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    "To be Paid"
                                        .text
                                        .size(12.sp)
                                        .semiBold
                                        .make(),
                                    "₹ ${snapshot.data!.cart!.total}"
                                        .text
                                        .bold
                                        .size(12.sp)
                                        .make()
                                  ],
                                ),
                                3.w.widthBox,
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 0.6.h),
                                  height: 7.h,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                    thickness: 0.3.w,
                                  ),
                                ),
                                Spacer(),
                                "Pay".text.bold.size(14.sp).makeCentered(),
                                // 1.w.widthBox,
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 2.6.h,
                                )
                              ],
                            ).px(5.w),
                          ).px(10.w).onInkTap(() {
                           _paymentController.openCheckout();
                          })
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Something Went Wrong'));
                                } else if(snapshot.connectionState == false){
                                  return Center(child: Text("Not Connected yet"),);
                                }
                                else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                         }),
                          3.h.heightBox,
                          "Customers also purchased these items"
                              .text
                              .bold
                              .size(13.sp)
                              .make()
                              .objectTopLeft()
                              .px(2.w),
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
                                    "Best Seller".text.size(14.sp).bold.make(),
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
                                  child: _bestSellerController.obx(
                                      (data)=>SizedBox(
                                        height: 20.h,
                                        child: ListView.builder(
                                          itemCount:data!.products!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, i) {
                                            return BestSeller(
                                              data: data.products![i]
                                            );
                                          },
                                        ),
                                      ),
                                      onError: (err)=>Text(err.toString())
                                    ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    app_Bar(
                        Icon(Icons.arrow_back_ios).onInkTap(() {
                          Get.off(() => MainPage());
                        }),
                        "          Cart"
                            .text
                            .semiBold
                            .size(16.sp)
                            .makeCentered(),
                        Spacer())
                  ],
                )),
        ));
  }
}
