// To parse this JSON data, do
//
//     final getcollectionProduct = getcollectionProductFromJson(jsonString);

import 'dart:convert';

import 'package:food_app/model/get_cat_products.dart';

GetcollectionProduct getcollectionProductFromJson(String str) => GetcollectionProduct.fromJson(json.decode(str));

String getcollectionProductToJson(GetcollectionProduct data) => json.encode(data.toJson());

class GetcollectionProduct {
    GetcollectionProduct({
        this.msg,
        this.products,
    });

    String? msg;
    List<Product>? products;

    factory GetcollectionProduct.fromJson(Map<String, dynamic> json) => GetcollectionProduct(
        msg: json["msg"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

