import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/model/get_all_categories_model.dart';
import 'package:food_app/model/get_cat_products.dart';

import 'package:food_app/screens/categories/category_screen.dart';
import 'package:food_app/screens/favourite/favourite_controller/favourite_controller.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import '../../../const.dart';

class CategoriesController extends GetxController {
  GetAllCategory getAllCategory = GetAllCategory();
  GetCatProducts getCatProducts = GetCatProducts();

  FavouriteController _favouriteController = Get.put(FavouriteController());
  RxBool isLoading = true.obs;
  RxBool fav = false.obs;

  addFavOuriteApi(var id) async {
    try {
     print(id);
      dio.Response r = await ApiProvider.addFav(id);
       print(r.statusCode);
       print(r.data);

      if (r.statusCode == 200) {
        fav.value = true;
        CallLoader.hideLoader();
        _favouriteController.getfavoutite();
        Get.snackbar("Successfully Added", "${r.statusCode}",
            backgroundColor: Colors.white, snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Something went Wrong", "${r.statusCode}",
            backgroundColor: Colors.white, snackPosition: SnackPosition.BOTTOM);
        CallLoader.hideLoader();
      }
    } on Exception catch (e) {}
  }

  getCategoires() async {
    http.Response r = await ApiProvider.getCatgoriesApi();
    print("category body:    ${r.body}");
    print("Category statusCode : ${r.statusCode}");
    if (r.statusCode == 200) {
      isLoading.value = false;
      getAllCategory = getAllCategoryFromJson(r.body);
    } else {
      isLoading.value = false;
      Get.snackbar("Error", "Somthing Went Wrong",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }
  }

  getCatProduct(var id, String? title) async {

    print("Api hitted");
    http.Response r = await ApiProvider.getCatProducts(id);
    print("Taking Response");
    if (r.statusCode == 200) {
      print(r.body);
      CallLoader.hideLoader();
      getCatProducts = getCatProductsFromJson(r.body);
      Get.to(() => CaterogyScreen(title: title, product: getCatProducts));
    } else {
      CallLoader.hideLoader();
      Get.snackbar("Error", "Somthing Went Wrong in category products",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }
  }

  addproduct(var productid) async {
    print("Api initated");

    http.Response r = await ApiProvider.addCart(productid);
    print(" getting Api Response");

    print(r.statusCode);
    print("Api Response");
    print(r.body);
    var data = jsonDecode(r.body);
    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      Get.snackbar("success", "Added to Cart",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    } else {
      CallLoader.hideLoader();
      Get.snackbar("success", "Added to Cart",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }
  }

  @override
  void onInit() {
    getCategoires();
    super.onInit();
  }
}
