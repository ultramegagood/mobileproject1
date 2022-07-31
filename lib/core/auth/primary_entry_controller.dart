import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/repository/calculator/main/home_repository.dart';

class PrimaryEntryController extends GetxController {
  var isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  var isButtonEnabled = false.obs;
  var isPasswordVisible = false.obs;
  
  final repository = HomeRepository();

  String? notNullValidation(String? value) {
    // ignore: unnecessary_null_comparison
    if (value!.isEmpty || value == null) {
      return '';
    }
    return null;
  }

  setPasswordVisibility() {
    isPasswordVisible(!isPasswordVisible.value);
  }

  void login(String email, String password) async {
    if (formKey.currentState!.validate()) {
      isLoading(true);
      await repository.getDefaultToken(email, password);
      isLoading(false);
    }
  }
}
