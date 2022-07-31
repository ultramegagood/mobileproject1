
import 'package:get/get.dart';

class TourismStepThreeController extends GetxController {
  var isAgreedInsurance = false.obs;
  var isAgreedInfo = false.obs;

  setIsAgreedInsurance(bool? value) {
    isAgreedInsurance(value);
  }

  setIsAgreedInfo(bool? value) {
    isAgreedInfo(value);
  }

}