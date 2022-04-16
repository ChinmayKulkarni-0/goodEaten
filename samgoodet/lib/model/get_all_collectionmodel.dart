// To parse this JSON data, do
//
//     final getAllCollection = getAllCollectionFromJson(jsonString);

import 'dart:convert';

GetAllCollection getAllCollectionFromJson(String str) => GetAllCollection.fromJson(json.decode(str));

String getAllCollectionToJson(GetAllCollection data) => json.encode(data.toJson());

class GetAllCollection {
    GetAllCollection({
        this.msg,
        this.collections,
    });

    String ?msg;
    List<Collection>? collections;

    factory GetAllCollection.fromJson(Map<String, dynamic> json) => GetAllCollection(
        msg: json["msg"],
        collections: List<Collection>.from(json["collections"].map((x) => Collection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "collections": List<dynamic>.from(collections!.map((x) => x.toJson())),
    };
}

class Collection {
    Collection({
        this.id,
        this.category,
        this.name,
        this.description,
        this.v,
        this.image,
    });

    String ?id;
    String ?category;
    String ?name;
    String ?description;
    int? v;
    String ?image;

    factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        id: json["_id"],
        category: json["category"],
        name: json["name"],
        description: json["description"],
        v: json["__v"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "name": name,
        "description": description,
        "__v": v,
        "image": image,
    };
}
