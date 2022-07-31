import 'package:get/get.dart';
import 'package:mobile_nsk/core/payment/PaymentController.dart';

class PaymentBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PaymentController());
  }

}