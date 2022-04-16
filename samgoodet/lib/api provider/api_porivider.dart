// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:food_app/const.dart';
import 'package:food_app/main_page.dart';
import 'package:food_app/model/best_seller_model.dart';
import 'package:food_app/model/get_banners_model.dart';
import 'package:food_app/screens/categories/categorieController/categories_controller.dart';
import 'package:food_app/screens/categories/catogery%20product/product%20description/review/review%20model/review_model.dart';
import 'package:food_app/screens/express/express%20Model/get_express_model.dart';
import 'package:food_app/screens/express/product%20details/express_product_details.dart';
import 'package:food_app/screens/home_page/search/search%20model/search_model.dart';
import 'package:food_app/screens/menu/Address/address%20controller/address_controller.dart';
import 'package:food_app/screens/menu/Address/address%20model/address_model.dart';
import 'package:food_app/screens/widget/cat_chip.dart';

import 'package:http/http.dart' as http;
import 'package:food_app/screens/otp_screen/otp_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dioo;

class ApiProvider {
  static AddressController _addressController = Get.find();
  static CategoriesController _categoriesController = Get.find();
  static GetStorage prefs = GetStorage();
  static var baseUrl = 'https://good-eatin.herokuapp.com/';

  static registerApi(var email, var password, var phoneNumber, var name) async {
    var url = baseUrl + 'user/signup';
    var data = {
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
      'name': name
    };
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    try {
      dioo.Dio dio = dioo.Dio();
      dioo.Response r = await dio.post(url,
          data: data, options: dioo.Options(headers: headers));
      if (r.statusCode == 201) {
        CallLoader.hideLoader();
        prefs.write("emailStored", r.data!['user']['email']);
        emailStore = prefs.read("emailStored");
        print(emailStore);
        print(email);
        Get.snackbar(
          "",
          "Register Sucessfully",
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      Get.put(() => MainPage());
      }
    } on dioo.DioError catch (e) {
      CallLoader.hideLoader();
      Get.snackbar("Error", "${e.response!.data['msg']}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);

      print(e);
    }
  }

  static addCart(var productid) async {
    var url = baseUrl + 'cart';
    var body = {"productId": "$productid"};
    var headers = {"Authorization": 'Bearer $token'};

    http.Response r =
        await http.post(Uri.parse(url), body: body, headers: headers);

    return r;
  }

  static Future addFav(var id) async {
    var url = baseUrl + 'favourites/toggle';
    token = prefs.read('token');
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var body = {"productId": id};
    CallLoader.loader();
    try {
      print("api started");
      dioo.Response r = await dioo.Dio()
          .post(url, data: body, options: dioo.Options(headers: headers));
      return r;
    } on Exception catch (err) {
      return Future.error(err.toString());
    }
  }

  static Future<GetProductReview> getProductReview(var id) async{
    var url = baseUrl +'review/product/$id';
   
    try {
      dioo.Response r = await dioo.Dio().get(url);
      print(r.data);
      print(r.statusCode);
      if (r.statusMessage =='OK') {
        
        CallLoader.hideLoader();
        return getProductReviewFromJson(jsonEncode(r.data));
      } else {
        return Future.error(r.statusMessage!);
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }

  }


  static Future<GetsearchProduct> getSearchApi(var search) async{
    var url = baseUrl+'search?product=$search';
    try {
      dioo.Response r = await dioo.Dio().get(url);
      if (r.statusMessage == 'OK') {
        CallLoader.hideLoader();
        return getsearchProductFromJson(jsonEncode(r.data));
      } else {
        return Future.error(r.statusMessage!);
      }
    } on Exception catch (err) {
      return Future.error(err.toString());
    }

  }

  static loginApi(var email, var password) async {
    var url = baseUrl + 'user/login';
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var body = {'email': email, 'password': password};

    try {
      dioo.Dio dio = dioo.Dio();
      dioo.Response r = await dio.post(url,
          data: body, options: dioo.Options(headers: headers));
      if (r.statusCode == 200) {
        prefs.write("token", r.data['loginToken']);
        token = prefs.read('token');
        print(email);
        print(password);
        print(token);
        CallLoader.hideLoader();
        Get.snackbar(
          "",
          "Login Sucessfully",
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.off(() => MainPage(
              i: 0,
            ));
      }
    } on dioo.DioError catch (e) {
      CallLoader.hideLoader();
      Get.snackbar("Error", "Incorrect email address or Password",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);

      print(e);
    }
  }

  static updateCart(String? id, int quantity) async {
    var url = baseUrl + 'cart/quantity';
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT', Uri.parse(url));
    request.body = json.encode({"productId": "$id", "quantity": quantity});
    request.headers.addAll(headers);

    http.StreamedResponse r = await request.send();

    return r;
  }

  static userProfile() async {
    var url = baseUrl + 'user';
    token = prefs.read('token');
    var header = {"Authorization": "Bearer $token"};
    http.Response r = await http.get(Uri.parse(url), headers: header);
    return r;
  }

  static Future<BestSellerMdel> bestSellerApi() async {
    var url = baseUrl + "product/popular";
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        return bestSellerMdelFromJson(r.body);
      } else {
        return Future.error(r.reasonPhrase!);
      }
    } on Exception catch (exep) {
      return Future.error(exep.toString());
    }
  }

  static Future<GetBannersmodel> getBannersApi() async {
    var url = baseUrl + 'banner';

    try {
      dioo.Response r = await dioo.Dio().get(url);
      print(r.statusCode);
      print(r.data);
      if (r.statusMessage == "OK") {
        return getBannersmodelFromJson(jsonEncode(r.data));
      } else {
        return Future.error(r.statusMessage!);
      }
    } on Exception catch (exep) {
      return Future.error(exep.toString());
    }
  }

  static Future addAddressApi(var name, var mobile, var city, var state,
      var area, var house, var landark, var pin, RxBool deafult) async {
    var url = baseUrl + 'address';
    token = prefs.read('token');
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var body = {
      "name": name,
      "city": city,
      "state": state,
      "pin_code": pin,
      "phone_number": mobile,
      "house_number": house,
      "area": area,
      "landmark": landark,
      "default": deafult.value
    };
    CallLoader.loader();
    try {
      dioo.Response r = await dioo.Dio()
          .post(url, data: body, options: dioo.Options(headers: headers));
      if (r.statusMessage == 'Created') {
        CallLoader.hideLoader();
        Get.back();
        _addressController.getAlladdressApi();
        return r;
      } else {
        CallLoader.hideLoader();
      }
    } on Exception catch (err) {
      return Future.error(err.toString());
    }
  }

  static Future setDefaultAddress(var addressId, RxBool deafult) async {
    var url = baseUrl + 'address';
    token = prefs.read('token');
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var body = {"addressId": addressId, "default": deafult.value};
    CallLoader.loader();
    try {
      dioo.Response r = await dioo.Dio()
          .put(url, data: body, options: dioo.Options(headers: headers));
      print(r.statusMessage);
      print(r.data);
      if (r.statusMessage == 'OK') {
        CallLoader.hideLoader();
        return r;
      } else {
        CallLoader.hideLoader();
        return Future.error(r.statusMessage!);
      }
    } on Exception catch (err) {
      return Future.error(err.toString());
    }
  }

  static Future<GetAddressModel> getUserAddressApi() async {
    var url = baseUrl + 'address/';

    token = prefs.read('token');
    var headers = {'Authorization': 'Bearer $token'};
    try {
  
      dioo.Response r =
          await dioo.Dio().get(url, options: dioo.Options(headers: headers));

      print("This is address ===> ${r.statusCode}");
      if (r.statusMessage == 'OK') {
      
        
        return getAddressModelFromJson(jsonEncode(r.data));
      } else {
        
        return Future.error(r.statusMessage!);
      }
    } on Exception catch (exep) {
      print(exep);
      return Future.error(exep.toString());
    }
  }

  static Future<GetExpressProduct> getExpressProductApi(var id) async {
    var url = baseUrl + 'product/express/$id';
    token = prefs.read('token');
    var headers = {'Authorization': 'Bearer $token'};
    CallLoader.loader();
    try {
      dioo.Response r =
          await dioo.Dio().get(url, options: dioo.Options(headers: headers));
      if (r.statusMessage == 'OK') {
          CallLoader.hideLoader();
          Get.to(() => ExpressProductDetailsScreen());
        return getExpressProductFromJson(jsonEncode(r.data));
      } else {
        CallLoader.message();
        return Future.error(r.statusMessage!);
      }
    } on Exception catch (err) {
      return Future.error(err);
    }
  }

  static otpLogin(var otp) async {
    emailStore = prefs.read("emailStored");
    var url = baseUrl + 'auth/verify-account';
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var body = {'otp': otp, 'email': emailStore};

    try {
      dioo.Dio dio = dioo.Dio();
      dioo.Response r = await dio.post(url,
          data: body, options: dioo.Options(headers: headers));
      if (r.statusCode == 200) {
        CallLoader.hideLoader();
        Get.snackbar(
          "",
          "Login Sucessfully",
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.off(() => MainPage(
              i: 0,
            ));
      }
    } on dioo.DioError catch (e) {
      CallLoader.hideLoader();
      Get.snackbar("Error", "${e.response!.data['msg']}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);

      print(e);
    }
  }

  static getCatgoriesApi() async {
    var url = baseUrl + 'category/';

    http.Response r = await http.get(Uri.parse(url));
    return r;
  }

  static getAllCollection() async {
    var url = baseUrl + 'collection';
    http.Response r = await http.get(Uri.parse(url));
    return r;
  }

  static getCollectionProd(var id) async {
    var url = baseUrl + 'collection/$id/products';
    http.Response r = await http.get(Uri.parse(url));
    return r;
  }

  static getCatProducts(var catid) async {
    var url = baseUrl + 'category/$catid/products';
    http.Response r = await http.get(Uri.parse(url));
    return r;
  }

  static collabrate(var name, var phone, var email, var desription) async {
    var url = baseUrl + "collaboration";
    var body = {
      "name": name,
      "phone_number": phone,
      "email": email,
      "description": desription
    };
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );

    return r;
  }

  static getCart() async {
    var url = baseUrl + "cart";

    token = prefs.read('token');
    var header = {"Authorization": "Bearer $token"};
    http.Response r = await http.get(Uri.parse(url), headers: header);

    return r;
  }

  static getFavouriteApi() async {
    token = prefs.read('token');
    var url = baseUrl + 'favourites/';
    var headers = {'Authorization': 'Bearer $token '};
    http.Response r = await http.get(Uri.parse(url), headers: headers);

    return r;
  }

  static newestProduct() async {
    var url = baseUrl + 'product/newest-arrivals';
    http.Response r = await http.get(Uri.parse(url));
    return r;
  }
}
