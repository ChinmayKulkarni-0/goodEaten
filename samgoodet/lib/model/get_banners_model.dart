// To parse this JSON data, do
//
//     final getBannersmodel = getBannersmodelFromJson(jsonString);

import 'dart:convert';

GetBannersmodel getBannersmodelFromJson(String str) => GetBannersmodel.fromJson(json.decode(str));

String getBannersmodelToJson(GetBannersmodel data) => json.encode(data.toJson());

class GetBannersmodel {
    GetBannersmodel({
      required  this.msg,
      required  this.banners,
    });

    String msg;
    Banners banners;

    factory GetBannersmodel.fromJson(Map<String, dynamic> json) => GetBannersmodel(
        msg: json["msg"],
        banners: Banners.fromJson(json["banners"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "banners": banners.toJson(),
    };
}

class Banners {
    Banners({
       required this.id,
      required  this.topBanners,
      required  this.v,
      required  this.middleUpperBanner,
      required  this.middleLowerBanner,
      required  this.bottomBanner,
    });

    String id;
    List<String> topBanners;
    int v;
    String middleUpperBanner;
    String middleLowerBanner;
    String bottomBanner;

    factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json["_id"],
        topBanners: List<String>.from(json["top_banners"].map((x) => x)),
        v: json["__v"],
        middleUpperBanner: json["middle_upper_banner"],
        middleLowerBanner: json["middle_lower_banner"],
        bottomBanner: json["bottom_banner"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "top_banners": List<dynamic>.from(topBanners.map((x) => x)),
        "__v": v,
        "middle_upper_banner": middleUpperBanner,
        "middle_lower_banner": middleLowerBanner,
        "bottom_banner": bottomBanner,
    };
}
