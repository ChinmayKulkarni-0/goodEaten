

import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/model/best_seller_model.dart';
import 'package:get/get.dart';



class BestSellerController extends GetxController with StateMixin<BestSellerMdel>{

  callBestSellerApi(){
    change(null,status: RxStatus.loading());
    try {
      ApiProvider.bestSellerApi().then((value) {
        if(value.products!.isEmpty){
          change(null,status: RxStatus.empty());
        }else{
          change(value,status: RxStatus.success());
        }      
      },onError: (err){
        change(null,status: RxStatus.error(err.toString()));
      });
    } on Exception catch (err) {
     change(null,status: RxStatus.error(err.toString()));
    }
  }

  @override
  void onReady() {
    callBestSellerApi();
    super.onReady();
  }
}