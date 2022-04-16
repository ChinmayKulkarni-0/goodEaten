// To parse this JSON data, do
//
//     final getAllCategory = getAllCategoryFromJson(jsonString);

import 'dart:convert';

GetAllCategory getAllCategoryFromJson(String str) => GetAllCategory.fromJson(json.decode(str));

String getAllCategoryToJson(GetAllCategory data) => json.encode(data.toJson());

class GetAllCategory {
    GetAllCategory({
        this.categories,
    });

    List<Category>? categories;

    factory GetAllCategory.fromJson(Map<String, dynamic> json) => GetAllCategory(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? name;
    String? description;
    String? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "image": image,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
