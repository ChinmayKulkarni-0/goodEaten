// To parse this JSON data, do
//
//     final bestSellerMdel = bestSellerMdelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'get_cat_products.dart';

BestSellerMdel bestSellerMdelFromJson(String str) => BestSellerMdel.fromJson(json.decode(str));

String bestSellerMdelToJson(BestSellerMdel data) => json.encode(data.toJson());

class BestSellerMdel {
    BestSellerMdel({
        this.msg,
        this.products,
    });

    String? msg;
    List<Product>? products;

    factory BestSellerMdel.fromJson(Map<String, dynamic> json) => BestSellerMdel(
        msg: json["msg"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

