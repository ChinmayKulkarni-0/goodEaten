import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../const.dart';
class ProductDescriptionController extends GetxController {
RxInt selectedImg = 0.obs;

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
}