import 'package:flutter/material.dart';
import 'package:food_app/model/get_all_categories_model.dart';
import 'package:food_app/screens/menu/categories_expansion/controller/expansion_controller.dart';
// import 'package:food_app/screens/categories_expansion/controller/expansion_controller.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';


class CategoryExpansionWidget extends StatelessWidget {
  CategoryExpansionWidget({
    Key? key,
    required this.heading,
    required this.products,
  }) : super(key: key);

  final Category heading;
  final products;
  ExpansionController _expansionController = Get.put(ExpansionController());

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.black,
      textColor: Colors.black,
      title: Text(
        heading.name!,
        style: TextStyle(fontSize: 14.sp),
      ),
     
      children: [
        for (var item in products)
          ListTile(
            onTap: () {
              // Get.to(() => ProductScreen());
            },
            dense: true,
            title: Text(
              item,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              textAlign: TextAlign.start,
            ),
          )
      ],
    );
  }
}
