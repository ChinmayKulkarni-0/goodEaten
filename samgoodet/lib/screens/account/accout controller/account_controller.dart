

import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/model/profile_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AccountController extends GetxController {
   RxBool isLoading = true.obs;
   UserProfileModel userProfileModel = UserProfileModel();
  @override
  void onInit() {
   accountApi();
    super.onInit();
  }

  accountApi() async{
    http.Response r = await ApiProvider.userProfile();

    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
     
      isLoading.value = false;
      userProfileModel = userProfileModelFromJson(r.body);
      Get.snackbar("Success","User Profile",
      snackPosition: SnackPosition.BOTTOM,

      backgroundColor: Colors.white
      );
      
    } else {
       isLoading.value = false;
       Get.snackbar("Failed","Something went wrong",
      snackPosition: SnackPosition.BOTTOM,

      backgroundColor: Colors.white
      );
    }
  }
}