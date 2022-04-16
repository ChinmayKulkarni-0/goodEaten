// To parse this JSON data, do
//
//     final getsearchProduct = getsearchProductFromJson(jsonString);

import 'dart:convert';

import 'package:food_app/model/get_cat_products.dart';

GetsearchProduct getsearchProductFromJson(String str) => GetsearchProduct.fromJson(json.decode(str));

String getsearchProductToJson(GetsearchProduct data) => json.encode(data.toJson());

class GetsearchProduct {
    GetsearchProduct({
      required  this.msg,
      required  this.products,
    });

    String msg;
    List<Product> products;

    factory GetsearchProduct.fromJson(Map<String, dynamic> json) => GetsearchProduct(
        msg: json["msg"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

