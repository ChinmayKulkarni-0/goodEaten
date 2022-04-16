// To parse this JSON data, do
//
//     final getCartModel = getCartModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

GetCartModel getCartModelFromJson(String str) => GetCartModel.fromJson(json.decode(str));

String getCartModelToJson(GetCartModel data) => json.encode(data.toJson());

class GetCartModel {
    GetCartModel({
        this.msg,
        this.cart,
    });

    String? msg;
    Cart ?cart;

    factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
        msg: json["msg"],
        cart: Cart.fromJson(json["cart"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "cart": cart!.toJson(),
    };
}

class Cart {
    Cart({
        this.id,
        this.user,
        this.products,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.total,
    });

    String ?id;
    User? user;
    List<ProductElement>? products;
    DateTime? createdAt;
    DateTime ?updatedAt;
    int? v;
    int ?total;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user!.toJson(),
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "total": total,
    };
}

class ProductElement {
    ProductElement({
        this.product,
        this.quantity,
        this.id,
    });

    ProductProduct? product;
    int ?quantity;
    String? id;

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductProduct.fromJson(json["product"]),
        quantity: json["quantity"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "product": product!.toJson(),
        "quantity": quantity,
        "_id": id,
    };
}

class ProductProduct {
    ProductProduct({
        this.discountPercentage,
        this.id,
        this.productCollection,
        this.name,
        this.images,
        this.originalPrice,
        this.v,
        this.discount,
        this.createdAt,
    });

    int ?discountPercentage;
    String ?id;
    String ?productCollection;
    String? name;
    List<String> ?images;
    int ?originalPrice;
    int ?v;
    int ?discount;
    DateTime ?createdAt;

    factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        discountPercentage: json["discount_percentage"],
        id: json["_id"],
        productCollection: json["product_collection"],
        name: json["name"],
        images: List<String>.from(json["images"].map((x) => x)),
        originalPrice: json["original_price"],
        v: json["__v"],
        discount: json["discount"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "discount_percentage": discountPercentage,
        "_id": id,
        "product_collection": productCollection,
        "name": name,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "original_price": originalPrice,
        "__v": v,
        "discount": discount,
        "createdAt": createdAt!.toIso8601String(),
    };
}

class User {
    User({
        this.id,
        this.email,
        this.phoneNumber,
        this.countryCode,
        this.name,
        this.provider,
        this.verified,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String ?id;
    String ?email;
    String ?phoneNumber;
    String ?countryCode;
    String ?name;
    String ?provider;
    bool ?verified;
    DateTime ?createdAt;
    DateTime? updatedAt;
    int ?v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        countryCode: json["country_code"],
        name: json["name"],
        provider: json["provider"],
        verified: json["verified"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "phone_number": phoneNumber,
        "country_code": countryCode,
        "name": name,
        "provider": provider,
        "verified": verified,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
