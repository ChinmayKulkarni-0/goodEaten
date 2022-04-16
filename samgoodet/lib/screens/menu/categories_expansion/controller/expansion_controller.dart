import 'package:get/get.dart';

class ExpansionController extends GetxController {
  RxBool isSelected = false.obs;

  onExpansionChanged(var value) {
    isSelected(value);
  }
}
