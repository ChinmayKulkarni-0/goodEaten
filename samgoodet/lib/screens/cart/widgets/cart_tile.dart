// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/model/getCartModel.dart';
import 'package:food_app/screens/cart/cart%20controller/cart_controller.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';

import '../../../const.dart';

class CartTile extends StatelessWidget {
  CartTile({Key? key, required this.data}) : super(key: key);

  final ProductElement data;

  final CartController _cartController = Get.find();


  Rx<int?> get  quantity => data.quantity.obs;

  int get  price => data.product!.originalPrice! -
      data.product!.discount!;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 15.h,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 2, color: Colors.blueGrey)],
              color: Colors.white),
          child: Column(
            children: [
              1.h.heightBox,
              Row(
                children: [
                  data.product!.name!.text.semiBold.size(15.sp).make(),
                  Spacer(),
                  "₹ ${(data.quantity)! * price}"
                      .text
                      .semiBold
                      .size(15.sp)
                      .make()
                ],
              ).px(2.w),
              2.h.heightBox,
              Row(
                children: [
                  "${data.quantity} pkg"
                      .text
                      .semiBold
                      .gray900
                      .size(10.sp)
                      .make(),
                  Spacer(),
                  "MRP ₹${data.product!.originalPrice!}"
                      .text
                      .semiBold
                      .gray500
                      .size(10.sp)
                      .make()
                ],
              ).px(2.w),
              Spacer(),
              Obx(
                () => Row(
                  children: [
                    "Remove".text.gray700.size(13.sp).make(),
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        CallLoader.loader();
                        _cartController.deductQuanity(
                            data.product!.id.toString(), quantity);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          boxShadow: [
                            BoxShadow(color: Colors.blueGrey, blurRadius: 2)
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    1.w.widthBox,
                    quantity.value!.text.size(12.sp).bold.make(),
                    1.w.widthBox,
                    InkWell(
                      onTap: () async {
                        CallLoader.loader();
                        _cartController.addQuanity(
                            data.product!.id
                                .toString(),
                            quantity);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          boxShadow: [
                            BoxShadow(color: Colors.blueGrey, blurRadius: 2)
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ).px(3.w),
              ),
              1.h.heightBox,
            ],
          ),
        ).px(5.w),
        2.h.heightBox,
      ],
    );
  }
}
