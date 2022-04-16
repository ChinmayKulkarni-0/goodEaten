// To parse this JSON data, do
//
//     final getExpressProduct = getExpressProductFromJson(jsonString);

import 'dart:convert';

import 'package:food_app/model/get_cat_products.dart';

GetExpressProduct getExpressProductFromJson(String str) => GetExpressProduct.fromJson(json.decode(str));

String getExpressProductToJson(GetExpressProduct data) => json.encode(data.toJson());

class GetExpressProduct {
    GetExpressProduct({
      required this.msg,
      required  this.products,
    });

    String msg;
    List<Product> products;

    factory GetExpressProduct.fromJson(Map<String, dynamic> json) => GetExpressProduct(
        msg: json["msg"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

