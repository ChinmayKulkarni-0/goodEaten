// To parse this JSON data, do
//
//     final getAddressModel = getAddressModelFromJson(jsonString);

import 'dart:convert';

GetAddressModel getAddressModelFromJson(String str) => GetAddressModel.fromJson(json.decode(str));

String getAddressModelToJson(GetAddressModel data) => json.encode(data.toJson());

class GetAddressModel {
    GetAddressModel({
      required  this.msg,
      required  this.addresses,
    });

    String msg;
    List<Address> addresses;

    factory GetAddressModel.fromJson(Map<String, dynamic> json) => GetAddressModel(
        msg: json["msg"],
        addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
    };
}

class Address {
    Address({
      required  this.id,
      required  this.user,
      required  this.name,
      required  this.city,
      required  this.state,
      required  this.area,
      required  this.houseNumber,
      required  this.landmark,
      required  this.pinCode,
      required  this.phoneNumber,
      required  this.countryCode,
      required  this.addressDefault,
      required  this.v,
    });

    String id;
    String user;
    String name;
    String city;
    String state;
    String area;
    String houseNumber;
    String landmark;
    String pinCode;
    String phoneNumber;
    String countryCode;
    bool addressDefault;
    int v;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["_id"],
        user: json["user"],
        name: json["name"],
        city: json["city"],
        state: json["state"],
        area: json["area"],
        houseNumber: json["house_number"],
        landmark: json["landmark"],
        pinCode: json["pin_code"],
        phoneNumber: json["phone_number"],
        countryCode: json["country_code"],
        addressDefault: json["default"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "name": name,
        "city": city,
        "state": state,
        "area": area,
        "house_number": houseNumber,
        "landmark": landmark,
        "pin_code": pinCode,
        "phone_number": phoneNumber,
        "country_code": countryCode,
        "default": addressDefault,
        "__v": v,
    };
}
