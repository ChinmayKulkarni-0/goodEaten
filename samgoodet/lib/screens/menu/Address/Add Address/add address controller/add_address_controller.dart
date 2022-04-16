import 'package:flutter/cupertino.dart';
import 'package:food_app/api%20provider/api_porivider.dart';
import 'package:get/get.dart';


class AddaddressController extends GetxController {
  RxBool defaultaddress = true.obs;


  onchanged(value){
defaultaddress.value = value;
  }
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController bulidig = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController pincode = TextEditingController();
  GlobalKey<FormState> addressKey = GlobalKey<FormState>();


      String ? pinValidaton(value){
    if (value =='') {
      return 'please enter your area pin code';
    } else {
      return null;
    }
  }





  String ? landmarkValidaton(value){
    if (value =='') {
      return 'please enter Land mark near you';
    } else {
      return null;
    }
  }

  String ? nameValidaton(value){
    if (value =='') {
      return 'please enter your name';
    } else {
      return null;
    }
  }

  String ? mobleValidaton(value){
    if (value.length !=10) {
      return 'please enter your mobile number';
    } else {
      return null;
    }
  }
  String ? cityValidaton(value){
    if (value =='') {
      return 'please enter your city';
    } else {
      return null;
    }
  }

    String ? stateValidaton(value){
    if (value =='') {
      return 'please enter your state';
    } else {
      return null;
    }
  }

  String ?  areaValidaton(value){
    if (value =='') {
      return 'please enter your area';
    } else {
      return null;
    }
  }
  String ? buildingValidaton(value){
    if (value =='') {
      return 'please enter your building';
    } else {
      return null;
    }
  }



callAddAddresApi() async{
 ApiProvider.addAddressApi(name.text, mobile.text, city.text, state.text, area.text, bulidig.text, landmark.text, pincode.text, defaultaddress);
}

checkValidation(){
  final isValidator = addressKey.currentState!.validate();

  if (!isValidator) {
    return;
  } else {
    
callAddAddresApi();
  }
}

}
