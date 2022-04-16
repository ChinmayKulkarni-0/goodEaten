import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/model/get_all_collection_product.dart';
import 'package:food_app/model/get_all_collectionmodel.dart';
import 'package:food_app/model/get_cat_products.dart';
import 'package:food_app/screens/favourite/favourite_controller/favourite_controller.dart';

import 'package:food_app/screens/products/product_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import '../../../const.dart';
class ProductController extends GetxController {
RxBool isLoadingProduct = true.obs;
RxBool fav = false.obs;
GetAllCollection getAllCollection = GetAllCollection();
GetcollectionProduct getcollectionProduct = GetcollectionProduct();

FavouriteController _favouriteController = Get.put(FavouriteController());

@override
  void onInit() {
    getProducts();
    super.onInit();
  }

addtoFav(var id) async{
  print(id);
  dio.Response r = await ApiProvider.addFav(id);
   try {
     if (r.statusCode == 200) {
         fav.value = true;
          CallLoader.hideLoader();
          _favouriteController.getfavoutite();
             Get.snackbar("Successfully Added", "${r.statusCode}",
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM
          );
        } else {
          CallLoader.hideLoader();
           Get.snackbar("Something went Wrong", "${r.statusCode}",
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM
          );
        }
   } on Exception catch (e) {
     // TODO
   }
}

  getProducts() async{
  http.Response r = await ApiProvider.getAllCollection();
    if (r.statusCode == 200) {
      isLoadingProduct.value = false;
     getAllCollection = getAllCollectionFromJson(r.body);
      print(r.body);
      print(r.body);
    } else {

      return Get.snackbar("Something Went Wrong", r.statusCode.toString());
    }
  }
  getProductCollection(var id, String title) async{

    print("Api started");
    print("Getting response");
    http.Response r = await ApiProvider.getCollectionProd(id);
    print("Get response");
     print("Collection product's Body:   ${r.body}");
     print("collection product's Status Code :${r.statusCode}");
    
      if (r.statusCode == 200) {
        CallLoader.hideLoader();
       getcollectionProduct = getcollectionProductFromJson(r.body);
       Get.to(()=> ProductScreen(
         product: getcollectionProduct,
         title: title
       ));

        
      } else {
        CallLoader.hideLoader();
         Get.snackbar("Error", "Somthing Went Wrong in category products",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      }

  }
    addproduct(var productid) async{
  print("Api initated");
     
  http.Response r = await ApiProvider.addCart(productid);
   print(" getting Api Response");
  
  print(r.statusCode);
  print("Api Response");
  print(r.body);
  var data = jsonDecode(r.body);
  if (r.statusCode == 200) {
    CallLoader.hideLoader();
    Get.snackbar("success", "Added To cart",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
   
  } else {
    CallLoader.hideLoader();
    Get.snackbar("success", "${data['msg']}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
   
  }
}


}