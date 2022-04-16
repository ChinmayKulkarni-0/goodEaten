// To parse this JSON data, do
//
//     final getfavouriteModel = getfavouriteModelFromJson(jsonString);

import 'dart:convert';

import 'package:food_app/model/get_cat_products.dart';

GetfavouriteModel getfavouriteModelFromJson(String str) => GetfavouriteModel.fromJson(json.decode(str));

String getfavouriteModelToJson(GetfavouriteModel data) => json.encode(data.toJson());

class GetfavouriteModel {
    GetfavouriteModel({
        this.msg,
        this.favourites,
    });

    String ?msg;
    Favourites ?favourites;

    factory GetfavouriteModel.fromJson(Map<String, dynamic> json) => GetfavouriteModel(
        msg: json["msg"],
        favourites: Favourites.fromJson(json["favourites"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "favourites": favourites!.toJson(),
    };
}

class Favourites {
    Favourites({
        this.id,
        this.user,
        this.products,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String ?user;
    List<Product> ?products;
    DateTime? createdAt;
    DateTime ?updatedAt;
    int ?v;

    factory Favourites.fromJson(Map<String, dynamic> json) => Favourites(
        id: json["_id"],
        user: json["user"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

