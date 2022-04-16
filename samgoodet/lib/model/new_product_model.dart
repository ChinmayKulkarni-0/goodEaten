// To parse this JSON data, do
//
//     final getNewestProduct = getNewestProductFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'get_cat_products.dart';

GetNewestProduct getNewestProductFromJson(String str) => GetNewestProduct.fromJson(json.decode(str));

String getNewestProductToJson(GetNewestProduct data) => json.encode(data.toJson());

class GetNewestProduct {
    GetNewestProduct({
        this.msg,
        this.products,
    });

    String ?msg;
    List<Product>? products;

    factory GetNewestProduct.fromJson(Map<String, dynamic> json) => GetNewestProduct(
        msg: json["msg"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

