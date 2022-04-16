import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/screens/menu/Address/address%20model/address_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
class AddressController extends GetxController
    with StateMixin<GetAddressModel> {
  late GetAddressModel getAddressModel;
  RxBool deafualt = false.obs;
  onChanged(var id,value) async {
    deafualt.value = value;
     try {
       dio.Response r = await  ApiProvider.setDefaultAddress(id, deafualt);
       if (r.statusMessage == 'OK') {
          getAlladdressApi();
       } else {
       }
     } on Exception catch (e) {
      
     }

 
  }

  

  getAlladdressApi() {
    change(null, status: RxStatus.loading());
    try {
      ApiProvider.getUserAddressApi().then((value) {
        getAddressModel = value;

        if (getAddressModel.addresses.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(getAddressModel, status: RxStatus.success());
        }
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onReady() {
    getAlladdressApi();
    super.onReady();
  }
}
