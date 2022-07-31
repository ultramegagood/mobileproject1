import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';

class PinCodeCreateController extends GetxController {
  // var pinController = TextEditingController().obs;
  var firstPin = ''.obs;
  var isRepeatPin = false.obs;
  var isPinsEqual = true.obs;

  void init(TextEditingController pinController) {
    pinController.addListener(() {
      if (pinController.value.text.length == 4) {
        if (isRepeatPin.value) {
          checkPins(pinController);
        } else {
          firstPin(pinController.value.text);
          log(firstPin.value);
          Future.delayed(const Duration(milliseconds: 200)).then((value) {
            pinController.clear();
            isRepeatPin(true);
          });
        }
      }
    });
  }

  void checkPins(TextEditingController controller) {
    if (firstPin.value == controller.text) {
      // box.write('pin', firstPin.value);
      UserData().setPin(firstPin.value);
      Future.delayed(const Duration(milliseconds: 200))
          .then((value) => Get.toNamed('/main'));
    } else {
      isPinsEqual(false);
      Future.delayed(const Duration(seconds: 1)).then(
        (value) {
          isPinsEqual(true);
          controller.clear();
        },
      );
    }
  }

  void setPin(String value, int index, TextEditingController pinController) {
    index == 11
        ? pinController.text.isNotEmpty
            ? pinController.text =
                pinController.text.substring(0, pinController.text.length - 1)
            : null
        : pinController.value.text.length < 4
            ? pinController.text = pinController.text + value
            : null;
  }
}
