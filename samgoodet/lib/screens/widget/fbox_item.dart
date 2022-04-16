import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/model/best_seller_model.dart';
import 'package:food_app/model/get_cat_products.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({ Key? key, required this.data }) : super(key: key);

  final Product data;
  @override
  Widget build(BuildContext context) {
    var price = data.originalPrice! - data.discount!;
    return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.sp),
    ),
    child: Container(
      height: 20.h,
      width: 28.w,
      margin: EdgeInsets.only(right: 5.sp),
      padding: EdgeInsets.all(3.sp),
      decoration: BoxDecoration(
        color: Vx.white,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
Container(
  height: 9.h,
  width: 20.w,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    image: DecorationImage(
      fit: BoxFit.fill,
      image:          NetworkImage(data.images![0],),)
  ),
),
          data.name!
              .text
              .size(10.sp)
              .maxLines(1)
              .overflow(TextOverflow.ellipsis)
              .bold
              .make(),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              '₹ $price'.text.size(10.sp).yellow500.make(),
              Container(
                decoration: BoxDecoration(
                  color: Vx.green500,
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                padding: EdgeInsets.all(2.sp),
                child: 'Buy Now'.text.size(8.sp).bold.white.make(),
              )
            ],
          ),
        ],
      ),
    ),
  );
  }
}
