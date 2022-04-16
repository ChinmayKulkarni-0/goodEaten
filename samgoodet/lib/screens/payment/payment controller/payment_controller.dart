import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {

  late Razorpay razorPay ;

  @override
  void onInit() {
     razorPay = Razorpay();
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.onInit();
  }
  
  @override
  void dispose() {
   razorPay.clear();
    super.dispose();
  }

   void openCheckout() async {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': 1*100,
      'name': 'Satyam',
      'description': 'Red Chilli paper',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9319935974', 'email': 'satyam@gmail.com'},
      'external': {
        'wallets': ['paytm','Mobikwik',]
      }
    };

    try {
      razorPay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  

  void handlePaymentSuccess(PaymentSuccessResponse response) {
   

    Get.snackbar("success", response.paymentId!, backgroundColor: Colors.white, snackPosition: SnackPosition.BOTTOM);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    
    Get.snackbar("Failed", response.message!, backgroundColor: Colors.white, snackPosition: SnackPosition.BOTTOM);
  }


  void handleExternalWallet(ExternalWalletResponse response) {
    

     Get.snackbar("External wallet", response.walletName!, backgroundColor: Colors.white, snackPosition: SnackPosition.BOTTOM);

  }

}