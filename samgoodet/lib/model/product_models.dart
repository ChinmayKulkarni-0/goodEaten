// To parse this JSON data, do
//
//     final getProductModel = getProductModelFromJson(jsonString);

import 'dart:convert';

import 'get_cat_products.dart';

GetProductModel getProductModelFromJson(String str) => GetProductModel.fromJson(json.decode(str));

String getProductModelToJson(GetProductModel data) => json.encode(data.toJson());

class GetProductModel {
    GetProductModel({
        this.msg,
        this.products,
    });

    String? msg;
    List<Product> ?products;

    factory GetProductModel.fromJson(Map<String, dynamic> json) => GetProductModel(
        msg: json["msg"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

