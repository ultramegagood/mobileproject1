import 'package:get/get.dart';

class ChangePhoneNumberController extends GetxController {
  var isButtonEnabled = false.obs;

  void validator(String? value) {
    if (value!.length == 15) {
      isButtonEnabled(true);
    } else {
      isButtonEnabled(false);
    }
  }
}
