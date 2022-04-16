// To parse this JSON data, do
//
//     final getProductReview = getProductReviewFromJson(jsonString);

import 'dart:convert';

GetProductReview getProductReviewFromJson(String str) => GetProductReview.fromJson(json.decode(str));

String getProductReviewToJson(GetProductReview data) => json.encode(data.toJson());

class GetProductReview {
    GetProductReview({
        required  this.msg,
        required  this.review,
    });

    String msg;
    List<Review> review;

    factory GetProductReview.fromJson(Map<String, dynamic> json) => GetProductReview(
        msg: json["msg"],
        review: List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "review": List<dynamic>.from(review.map((x) => x.toJson())),
    };
}

class Review {
    Review({
        required  this.id,
        required  this.user,
        required  this.review,
        required  this.starRating,
        required  this.product,
        required  this.createdAt,
        required  this.updatedAt,
        required  this.v,
    });

    String id;
    User user;
    String review;
    double starRating;
    String product;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        review: json["review"],
        starRating: json["star_rating"].toDouble(),
        product: json["product"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user.toJson(),
        "review": review,
        "star_rating": starRating,
        "product": product,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class User {
    User({
        required  this.id,
        required  this.email,
        required  this.phoneNumber,
        required  this.countryCode,
        required  this.name,
        required  this.provider,
        required  this.verified,
        required  this.createdAt,
        required  this.updatedAt,
        required  this.v,
    });

    String id;
    String email;
    String phoneNumber;
    String countryCode;
    String name;
    String provider;
    bool verified;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

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
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
