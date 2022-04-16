import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:food_app/screens/categories/catogery%20product/product%20description/review/review%20model/review_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class ReviewController extends GetxController with StateMixin<GetProductReview> {

late GetProductReview getProductReview;


  getReviewApi(id){
    change(null, status: RxStatus.loading());
    try {
   
      ApiProvider.getProductReview(id).then((value){
        getProductReview = value;
        if (getProductReview.review.isEmpty) {
          change(null, status: RxStatus.empty());

        } else  {
           change(value,status: RxStatus.success());
        }
      }, onError: (err){
     change(null,status: RxStatus.error(err.toString()));
      });
    } on Exception catch (e) {
    change(null,status: RxStatus.error(e.toString()));
    }
  }


}