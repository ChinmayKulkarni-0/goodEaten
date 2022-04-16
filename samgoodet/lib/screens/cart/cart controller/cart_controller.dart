import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/const.dart';
import 'package:food_app/model/getCartModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
 late  StreamController<GetCartModel> controller ; 

  RxBool isLoading = true.obs;
  GetCartModel getCartModel = GetCartModel();


  @override
  void onInit() {
    getCartApi();
    super.onInit();
  }

  addQuanity(var id, Rx<int?> quantity) async {
     http.StreamedResponse r = await ApiProvider.updateCart(id, quantity.value =  (quantity.value !+ 1));
      var data = await r.stream.bytesToString();
      
      print(data);
      print(r.statusCode);
      if (r.statusCode == 200) {
         
      var msg = jsonDecode(data);
     CallLoader.hideLoader();
        Get.snackbar("Success", msg['msg'],
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
       
      } 
     
      
      else {
     var msg = jsonDecode(data);
        Get.snackbar("Success", msg['msg'],
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      }
  }

  deductQuanity(var id, Rx<int?> quantity) async {
    if (quantity.value! > 0) {
      http.StreamedResponse r = await ApiProvider.updateCart(id, quantity.value = (quantity.value !- 1));
      var data = await r.stream.bytesToString();
      
      print(data);
      print(r.statusCode);
      if (r.statusCode == 200) {
        
          CallLoader.hideLoader();
      var msg = jsonDecode(data);
        Get.snackbar("Success", msg['msg'],
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      } else {
     var msg = jsonDecode(data);
        Get.snackbar("Success", msg['msg'],
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      }
    }
  }

  getCartApi() async {
    http.Response r = await ApiProvider.getCart();
    print(r.statusCode);
    print(r.body);
    if (r.statusCode == 200) {
      isLoading.value = false;
      var data = json.decode(r.body);
      getCartModel = getCartModelFromJson(r.body);
      Get.snackbar("Success", "${data['msg']}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    } 
     else if(r.statusCode == 400){
 CallLoader.hideLoader();
 CallLoader.message();
      }
    else {
      isLoading.value = false;
      var data = json.decode(r.body);
      Get.snackbar("Failed", "${data['msg']}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }
  }

  Stream<GetCartModel> getCartStream()async* {
    yield* Stream.periodic(Duration(seconds: 1),(_){
      return callCartApi();
    }).asyncMap((event) async => await event);
  }

  callCartApi() async {
    http.Response r = await ApiProvider.getCart();
    print(r.statusCode);
    print(r.body);
    if (r.statusCode == 200) {
      isLoading.value = false;
     
      return getCartModelFromJson(r.body);
     
    } 
     else if(r.statusCode == 400){
 CallLoader.hideLoader();
 CallLoader.message();
      }
    else {
      isLoading.value = false;
      var data = json.decode(r.body);
      Get.snackbar("Failed", "${data['msg']}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }

  }

}
