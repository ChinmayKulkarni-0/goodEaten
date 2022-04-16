import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/screens/favourite/favourite_model/get_favourite_models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const.dart';
class FavouriteController extends GetxController {

GetfavouriteModel getfavouriteModel = GetfavouriteModel();
RxBool isLoadingFavoutite = true.obs;



getfavoutite() async{
  http.Response r = await ApiProvider.getFavouriteApi();
  if (r.statusCode == 200) {
    print(r.statusCode);
    print(r.body);
        isLoadingFavoutite.value = false;
        getfavouriteModel = getfavouriteModelFromJson(r.body);
  } else {
        isLoadingFavoutite.value = false;
    Get.snackbar("Something Went Wrong", r.statusCode.toString());
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
    Get.snackbar("success", "${data['msg']}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
   
  } else {
    CallLoader.hideLoader();
    Get.snackbar("success", "${data['msg']}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
   
  }
}


@override
  void onInit() {
    getfavoutite();
    super.onInit();
  }
}