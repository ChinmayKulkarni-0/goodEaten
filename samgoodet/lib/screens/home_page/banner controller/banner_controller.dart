import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/model/get_banners_model.dart';
import 'package:get/get.dart';

class BannerController extends GetxController with StateMixin<GetBannersmodel> {

  
  late GetBannersmodel getBannersmodel;




  getBanners() {
    change(null, status: RxStatus.loading());
    try {
      ApiProvider.getBannersApi().then((value) {
        getBannersmodel = value;
      
        if (getBannersmodel.banners.topBanners.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(getBannersmodel, status: RxStatus.success());
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
    getBanners();
    super.onReady();
  }
}
