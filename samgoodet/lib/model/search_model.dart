// To parse this JSON data, do
//
//     final getSearchResult = getSearchResultFromJson(jsonString);

import 'dart:convert';

import 'package:food_app/model/get_cat_products.dart';

GetSearchResult getSearchResultFromJson(String str) => GetSearchResult.fromJson(json.decode(str));

String getSearchResultToJson(GetSearchResult data) => json.encode(data.toJson());

class GetSearchResult {
    GetSearchResult({
        this.msg,
        this.products,
    });

    String ?msg;
    List<Product>? products;

    factory GetSearchResult.fromJson(Map<String, dynamic> json) => GetSearchResult(
        msg: json["msg"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

