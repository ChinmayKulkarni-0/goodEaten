import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/const.dart';
import 'package:food_app/screens/express/express%20Model/get_express_model.dart';
import 'package:food_app/screens/favourite/favourite_controller/favourite_controller.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
class ExpressController extends GetxController with StateMixin<GetExpressProduct>{
late GetExpressProduct expressProduct;
  RxBool fav = false.obs;
  
  FavouriteController _favouriteController = Get.find();
   getExpressProduct(var id){

     change(null, status: RxStatus.loading());
     try {
       ApiProvider.getExpressProductApi(id).then((value) {
         expressProduct = value;
       if (expressProduct.products.isEmpty) {
         change(null, status: RxStatus.empty());
       } else {
         change(expressProduct, status: RxStatus.success());
       }
         
       }, onError: (err){
         change(null, status: RxStatus.error(err.toString(),),);
       }
       
       );
     } on Exception catch (e) {
       change(null, status: RxStatus.error(e.toString()));
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
      Get.snackbar("success", "${data['msg']}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    } else {
      CallLoader.hideLoader();
      Get.snackbar("success", "${data['msg']}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }
  }

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

}