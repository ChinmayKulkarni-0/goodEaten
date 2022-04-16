// To parse this JSON data, do
//
//     final getCatProducts = getCatProductsFromJson(jsonString);

import 'dart:convert';

GetCatProducts getCatProductsFromJson(String str) => GetCatProducts.fromJson(json.decode(str));

String getCatProductsToJson(GetCatProducts data) => json.encode(data.toJson());

class GetCatProducts {
    GetCatProducts({
        this.msg,
        this.products,
    });

    String ?msg;
    List<Product>? products;

    factory GetCatProducts.fromJson(Map<String, dynamic> json) => GetCatProducts(
        msg: json["msg"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.id,
        this.productCollection,
        this.category,
        this.name,
        this.description,
        this.images,
        this.originalPrice,
        this.discount,
        this.discountPercentage,
        this.expressCity,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.numOfReviews,
        this.rating,
    });

    String? id;
    String? productCollection;
    String? category;
    String? name;
    String? description;
    List<String>? images;
    int? originalPrice;
    int? discount;
    int? discountPercentage;
    String? expressCity;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    int? numOfReviews;
    double? rating;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        productCollection: json["product_collection"],
        category: json["category"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        originalPrice: json["original_price"],
        discount: json["discount"],
        discountPercentage: json["discount_percentage"],
        expressCity: json["express_city"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        numOfReviews: json["num_of_reviews"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "product_collection": productCollection,
        "category": category,
        "name": name,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "original_price": originalPrice,
        "discount": discount,
        "discount_percentage": discountPercentage,
        "express_city": expressCity,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "num_of_reviews": numOfReviews,
        "rating": rating,
    };
}
