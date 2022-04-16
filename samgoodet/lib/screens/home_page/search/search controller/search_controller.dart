import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/screens/home_page/search/search%20model/search_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../const.dart';

class SearchController extends GetxController
    with StateMixin<GetsearchProduct> {

      
  TextEditingController search = TextEditingController();
  late GetsearchProduct getsearchProduct;

  getSearch() {
    change(null, status: RxStatus.loading());
    try {
      ApiProvider.getSearchApi(search.text).then((value) {
        getsearchProduct = value;
        if (getsearchProduct.products.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(getsearchProduct, status: RxStatus.success());
        }
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
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
  @override
  void onInit() {
     getSearch();
    super.onInit();
  }
}
