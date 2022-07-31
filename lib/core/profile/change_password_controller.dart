// import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordControler = TextEditingController();
  TextEditingController newPasswordConfirmControler = TextEditingController();

  var isCurrentVisible = false.obs;
  var isNewVisible = false.obs;
  var isButtonEnabled = false.obs;

  final formKey = GlobalKey<FormState>();

  setCurrentVisibility() => isCurrentVisible(!isCurrentVisible.value);
  setNewVisibility() => isNewVisible(!isNewVisible.value);

  lastValidation() {
    if (currentPasswordController.text != '' &&
        newPasswordControler.text == newPasswordConfirmControler.text &&
        newPasswordControler.text != '' &&
        newPasswordConfirmControler.text != '') {
      isButtonEnabled(true);
    } else {
      isButtonEnabled(false);
    }
  }
}
