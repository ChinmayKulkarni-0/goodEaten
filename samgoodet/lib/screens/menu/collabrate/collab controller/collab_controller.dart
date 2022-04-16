import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/const.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class Collabcontroller extends GetxController {
  GlobalKey<FormState> collabFormKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController description = TextEditingController();

  String? nameValidation( value){
   if( value =='' ){
      return 'Enter name';
    }
    return null;
  }
  String? emailValidation( value){
   if(!GetUtils.isEmail(value)){
      return 'Enter email';
    }
    return null;
  }
  String? phoneValidation( value){
   if( value =='' || value.length <10 ){
      return 'Enter Phone number';
    }
    return null;
  }
  String? descriptonValidation( value){
   if( value ==''|| value.length<10 ){
      return 'Enter description  or Description is too short';
    }
    return null;
  }

  callFunction() async{

  
     http.Response r = await ApiProvider.collabrate(name.text, phone.text, email.text, description.text);
 
  
      print(r.body);
      print(r.statusCode);
      if (r.statusCode == 200) {
        var data = jsonDecode(r.body);
        CallLoader.hideLoader();
        Get.snackbar("Success", "${data['msg']}",
        
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white
        
        );
        
      } else {
        CallLoader.hideLoader();
          var data = jsonDecode(r.body);
          Get.snackbar("Failed", "${data['msg']}",
        
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white
        
        );

      }
  }

  checkCollab() async{
    final isvalidator = collabFormKey.currentState!.validate();
    if (!isvalidator) {
      return;
      
    } else {
       CallLoader.loader();
    callFunction();
    }
    collabFormKey.currentState!.save();
  }

}
