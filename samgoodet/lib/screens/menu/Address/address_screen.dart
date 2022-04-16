// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/screens/menu/Address/Add%20Address/add_address_screen.dart';
import 'package:food_app/screens/menu/Address/address%20controller/address_controller.dart';
import 'package:food_app/screens/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class AdsressScreen extends StatelessWidget {
  AdsressScreen({Key? key}) : super(key: key);

  AddressController _addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFBEE),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(children: [
                  12.h.heightBox,
            _addressController.obx(
              (data)=> ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: data!.addresses.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                PhysicalModel(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.all(Radius.circular(7)),
                                                  elevation: 10,
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 2.4.w, vertical: 1.h),
                                                    width: 100.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                     data.addresses[index].name.text.size(13.sp).semiBold.make(),
                                      Divider(
                                        thickness: 0.1.h,
                                        height: 0.1.h,
                                        color: Colors.black,
                                      ),
                                      data.addresses[index].houseNumber.text.size(12.sp).make(),
                                      data.addresses[index].city.text.size(12.sp).make(),
                                    data.addresses[index].area.text.size(12.sp).make(),
                                      data.addresses[index].pinCode.text.size(12.sp).make()
                                    ],
                                  ),
                                ),
                              ),
                               CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  title: Text(
                                    "Set as Default",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.sp),
                                  ),
                                
                                  value: _addressController.getAddressModel.addresses[index].addressDefault,
                                  onChanged: (val){
                                    _addressController.onChanged(_addressController.getAddressModel.addresses[index].id,val);
                                  }),
                              2.h.heightBox
                            ],
                          );
                        }),
            ),
                  6.h.heightBox,
                  PhysicalModel(
                    color: Colors.grey,
                    elevation: 6,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Container(
                      height: 5.4.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Color(0xFFE4CC80),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: "ADD NEW ADDRESS"
                          .text
                          .white
                          .size(14.sp)
                          .makeCentered(),
                    ),
                  ).onInkTap(() {
                    Get.to(()=> AddAddressScreen());
                  }),
                  5.h.heightBox
                ]),
              ),
            ),
            app_Bar(InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new)),
                "ADDRESS".text.size(13.sp).bold.makeCentered(), Spacer())
          ],
        ),
      ),
    );
  }
}
