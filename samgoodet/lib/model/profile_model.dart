// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    UserProfileModel({
        this.msg,
        this.user,
    });

    String ?msg;
    User ?user;

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        msg: json["msg"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "user": user!.toJson(),
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
        this.address,
    });

    String? id;
    String? email;
    String? phoneNumber;
    String? countryCode;
    String? name;
    String? provider;
    bool? verified;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    Address? address;

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
        address: Address.fromJson(json["address"]),
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
        "address": address!.toJson(),
    };
}

class Address {
    Address({
        this.id,
        this.user,
        this.firstName,
        this.line1,
        this.city,
        this.country,
        this.province,
        this.zipCode,
        this.phoneNumber,
        this.countryCode,
        this.addressDefault,
        this.v,
    });

    String? id;
    String? user;
    String? firstName;
    String? line1;
    String? city;
    String? country;
    String? province;
    String? zipCode;
    String? phoneNumber;
    String? countryCode;
    bool? addressDefault;
    int? v;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["_id"],
        user: json["user"],
        firstName: json["first_name"],
        line1: json["line1"],
        city: json["city"],
        country: json["country"],
        province: json["province"],
        zipCode: json["zip_code"],
        phoneNumber: json["phone_number"],
        countryCode: json["country_code"],
        addressDefault: json["default"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "first_name": firstName,
        "line1": line1,
        "city": city,
        "country": country,
        "province": province,
        "zip_code": zipCode,
        "phone_number": phoneNumber,
        "country_code": countryCode,
        "default": addressDefault,
        "__v": v,
    };
}
