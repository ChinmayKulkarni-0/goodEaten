import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/model/new_product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class NewestProductcontroller extends GetxController {

  GetNewestProduct getNewestProduct = GetNewestProduct();
@override
  void onInit() {
   getnewProduct();
    super.onInit();
  }
  RxBool newLoading = true.obs;

  getnewProduct() async{
http.Response r = await ApiProvider.newestProduct();
if (r.statusCode == 200) {
  print(r.body);
  getNewestProduct = getNewestProductFromJson(r.body);
  newLoading.value = false;
} else {
  newLoading.value = false;
  print(r.body);
      Get.snackbar("Something Went Wrong", r.statusCode.toString());
}
  }
}