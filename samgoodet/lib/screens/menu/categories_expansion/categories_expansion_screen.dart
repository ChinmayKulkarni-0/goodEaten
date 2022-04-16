import 'package:flutter/material.dart';
import 'package:food_app/screens/cart/cart_scree.dart';
import 'package:food_app/screens/categories/categorieController/categories_controller.dart';
import 'package:food_app/screens/categories/category_screen.dart';
import 'package:food_app/screens/menu/categories_expansion/widget/category_expansion_widget.dart';
// import 'package:food_app/screens/categories/catogery%20product/catogery_product.dart';
// import 'package:food_app/screens/categories_expansion/controller/expansion_controller.dart';
// import 'package:food_app/screens/categories_expansion/custom_expansion_widget.dart';
// import 'package:food_app/screens/categories_expansion/widget/category_expansion_widget.dart';
import 'package:food_app/screens/products/product_screen.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:food_app/screens/widget/express_box.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoriesExpansionScreen extends StatelessWidget {
  CategoriesExpansionScreen({Key? key}) : super(key: key);
  final CategoriesController _categoriesController = Get.find();
  
  List<String> products = [
    'sauces ',
    'sauces ',
     'sauces ',
    'sauces ',
    'sauces ',
     'sauces ',
  ];
  @override
  Widget build(BuildContext context) {
    double statusBarHeighttop = MediaQuery.of(context).padding.top;
    double statusBarHeightBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: SafeArea(
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _categoriesController
                          .getAllCategory.categories!.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => CategoryExpansionWidget(
                          heading: _categoriesController.getAllCategory.categories![index], products: products),
                    ),
                  ],
                ),
              ),
            ),
            app_Bar(
                Icon(Icons.arrow_back_ios, size: 4.h, color: Colors.black)
                    .onTap(() {
                  Get.back();
                }),
                "Categories".text.semiBold.black.size(14.sp).makeCentered(),
                Icon(Icons.local_mall_outlined,
                        size: 25.sp, color: Colors.black)
                    .onInkTap(() {
                  Get.to(() => CartScreen());
                }))
          ],
        ),
      ),
    );
  }
}
