import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Image.asset(
            'assets/image/burrata.jpg',
            height: 8.h,
          ),
          'Burrata Cheese'
              .text
              .size(10.sp)
              .maxLines(1)
              .overflow(TextOverflow.ellipsis)
              .bold
              .make(),
          Row(
            children: [
              'Brnd: '.text.size(8.sp).black.make(),
              SizedBox(
                width: 18.w,
                child: 'Creamitelia'
                    .text
                    .size(8.sp)
                    .overflow(TextOverflow.ellipsis)
                    .color(Vx.yellow500)
                    .make(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              '₹ 330'.text.size(10.sp).yellow500.make(),
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