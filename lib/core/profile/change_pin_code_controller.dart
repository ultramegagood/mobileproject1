import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';

class ChangePinCodeController extends GetxController {
  final UserData _userData = UserData();
  String? currentPin;

  var firstPin = ''.obs;
  var isRepeatPin = false.obs;
  var isPinsEqual = true.obs;

  var isCurrentPinCorrect = true.obs;
  var isCurrentPinEntered = false.obs;
  // var isEnteringCurrentPin = true.obs;

  void init(TextEditingController pinController) async {
    // _userData.setPin('1111');
    currentPin = await _userData.getPin();
    log(currentPin!.toString());
    pinController.addListener(() async {
      if (pinController.text.length == 4 && isCurrentPinEntered.value) {
        if (isRepeatPin.value) {
          checkPins(pinController);
        } else {
          firstPin(pinController.value.text);
          log('First Pin: ' + firstPin.value);
          Future.delayed(const Duration(milliseconds: 200)).then((value) {
            pinController.clear();
            isRepeatPin(true);
          });
        }
      }
      if (pinController.value.text.length == 4) {
        if (pinController.value.text != currentPin) {
          isCurrentPinCorrect(false);
          Future.delayed(const Duration(seconds: 1)).then((value) {
            isCurrentPinCorrect(true);
            pinController.clear();
          });
        } else {
          await Future.delayed(const Duration(milliseconds: 200)).then((value) {
            pinController.clear();
            isCurrentPinEntered(true);
          });
        }
      }
    });
  }

  void checkPins(TextEditingController controller) async {
    if (firstPin.value == controller.text) {
      // box.write('pin', firstPin.value);
      UserData().setPin(firstPin.value);
      log((await _userData.getPin()).toString());
      Future.delayed(const Duration(milliseconds: 200)).then(
        (value) => Get.back(),
      );
    } else {
      isPinsEqual(false);
      Future.delayed(const Duration(milliseconds: 200)).then(
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
