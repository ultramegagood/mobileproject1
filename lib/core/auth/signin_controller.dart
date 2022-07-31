import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile_nsk/repository/calculator/main/home_provider.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';

class SignInController extends GetxController {
  var isPinCorrect = true.obs;
  var isBiommericsEnabled = false.obs;
  var loadRx = false.obs;
  var userName = ''.obs;

  @override
  void onInit() async {
    await isBiommericsEnabled(await _userData.isBiometricsEnabled());
    userName(await _userData.getUserName());
    log(isBiommericsEnabled.value.toString());
    super.onInit();
  }

  final LocalAuthentication _auth = LocalAuthentication();
  final UserData _userData = UserData();

  checkPin(TextEditingController controller) async {
    if (controller.text.length == 4) {
      // final pin = box.read('pin');
      final pin = await UserData().getPin();
      if (pin == controller.text) {
        // loadRx(true);
        // await Future.delayed(const Duration(milliseconds: 300)).then((value) {
        //   // loadRx(false);
        //   HomeProvider().getDefaultToken(null, null);
        // });
        await HomeProvider().getDefaultToken(null, null);
      } else {
        isPinCorrect(false);
        await Future.delayed(const Duration(seconds: 1)).then((value) {
          controller.clear();
          isPinCorrect(true);
        });
      }
    }
  }

  void setPin(
      String value, int index, TextEditingController pinController) async {
    index == 9
        ? isBiommericsEnabled.value
            ? authenticate()
            : null
        : index == 11
            ? pinController.text.isNotEmpty
                ? pinController.text = pinController.text
                    .substring(0, pinController.text.length - 1)
                : null
            : pinController.text.length < 4
                ? pinController.text = pinController.value.text + value
                : null;
  }

  void authenticate() async {
    final isAuthenticated = await _auth.authenticate(
      localizedReason: 'Приложите палец',
      options: const AuthenticationOptions(
        biometricOnly: true,
      ),
    );
    isAuthenticated ? HomeProvider().getDefaultToken(null, null) : null;
  }
}
