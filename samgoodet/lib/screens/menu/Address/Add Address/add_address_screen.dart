import 'package:flutter/material.dart';
import 'package:food_app/screens/menu/Address/Add%20Address/add%20address%20controller/add_address_controller.dart';
import 'package:food_app/screens/menu/Address/Add%20Address/address%20widget/address_textFields.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key}) : super(key: key);

  final AddaddressController _contoller = Get.put(AddaddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFBEE),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Form(
                key: _contoller.addressKey,
                child: Column(
                  children: [
                    12.h.heightBox,
                    AddressTextFields(
                        controller: _contoller.name,
                        validator: _contoller.nameValidaton,
                        keyboardType: TextInputType.name,
                        hint: "Name"),
                    2.h.heightBox,
                    AddressTextFields(
                        controller: _contoller.mobile,
                        keyboardType: TextInputType.number,
                        validator: _contoller.mobleValidaton,
                        hint: "Mobile No."),
                    2.h.heightBox,
                    AddressTextFields(
                        keyboardType: TextInputType.name,
                        controller: _contoller.city,
                        validator: _contoller.cityValidaton,
                        hint: "City"),
                    2.h.heightBox,
                    AddressTextFields(
                        keyboardType: TextInputType.name,
                        controller: _contoller.state,
                        validator: _contoller.stateValidaton,
                        hint: "state"),
                    2.h.heightBox,
                    AddressTextFields(
                        keyboardType: TextInputType.name,
                        controller: _contoller.area,
                        validator: _contoller.areaValidaton,
                        hint: "Area"),
                    2.h.heightBox,
                    AddressTextFields(
                        keyboardType: TextInputType.name,
                        controller: _contoller.bulidig,
                        validator: _contoller.buildingValidaton,
                        hint: "House/Building Number"),
                    2.h.heightBox,
                    AddressTextFields(
                        keyboardType: TextInputType.name,
                        controller: _contoller.landmark,
                        validator: _contoller.landmarkValidaton,
                        hint: "Landmark"),
                    2.h.heightBox,
                    AddressTextFields(
                        keyboardType: TextInputType.number,
                        controller: _contoller.pincode,
                        validator: _contoller.pinValidaton,
                        hint: "PinCode"),
                    2.h.heightBox,
                    Obx(() => CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Text(
                          "Set as Default",
                          style:
                              TextStyle(color: Colors.black, fontSize: 12.sp),
                        ),
                        value: _contoller.defaultaddress.value,
                        onChanged: _contoller.onchanged)),
                    7.h.heightBox,
                    PhysicalModel(
                      color: Colors.grey,
                      elevation: 6,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Container(
                        height: 5.4.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: Color(0xFFE4CC80),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: "ADD NEW ADDRESS"
                            .text
                            .white
                            .size(14.sp)
                            .makeCentered(),
                      ),
                    ).onInkTap(() {
                      _contoller.checkValidation();
                    }),
                    6.h.heightBox,
                  ],
                ),
              ),
            ),
          ),
          app_Bar(
              Icon(Icons.arrow_back_ios_new).onInkTap(() {
                Get.back();
              }),
              " ADD ADDRESS".text.size(13.sp).bold.makeCentered(),
              Spacer())
        ],
      )),
    );
  }
}
