// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallLoader{
     static loader(){
        Get.defaultDialog(
                          title: "",
                          content: Column(
                            children: [
                              CircularProgressIndicator(),
                              Text("Loading......")
                            ],
                          ));
     }
     static hideLoader(){
    if (Get.isDialogOpen!) Get.back();
      
    
     }
     static message(){
        Get.defaultDialog(
                          title: "Cart is Empty",
                          content: Column(
                            children: [
                              CircularProgressIndicator(),
                              Text(" doesn't have a active cart")
                            ],
                          ));
     }
}
String ? emailStore = '';
String ? token = '';