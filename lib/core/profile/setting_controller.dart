import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/models/profile/user.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';
import 'package:mobile_nsk/repository/profile/profile_repository.dart';
import 'package:mobile_nsk/shared/theme.dart';

class SettingsController extends GetxController {
  ProfileRepository _repository = ProfileRepository();

  @override
  void onInit() async {
    loadRx(true);
    user(await _repository.getProfile());
    _userData.setIin(user.value!.iin!);
    _userData.setId(user.value!.id.toString());
    log(user.value!.id.toString());

    isBiometricsOn(await _userData.isBiometricsEnabled());
    isPushNotificationOn(await _userData.isNotificationEnabled());
    loadRx(false);
    super.onInit();
  }

  var user = Rxn<User>();

  var loadRx = false.obs;
  var isPushNotificationOn = false.obs;
  var isBiometricsOn = false.obs;

  final UserData _userData = UserData();

  setNotificationSetting(bool value) {
    isPushNotificationOn(value);
    _userData.setIsNotificationEnabled(value);
  }

  setBiometrics(bool value) {
    isBiometricsOn(value);
    _userData.setIsBiometricsEnabled(value);
  }

  showDeleteAlertDialog() {
    Get.dialog(
      AlertDialog(
        title: NskText(
          'Внимание',
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        content: NskText(
          'Вы точно хотите \nудалить аккаунт?',
          fontSize: 16,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: NskText(
              'Отмена',
              // fontSize: 12,
              color: Colors.grey,
            ),
          ),
          TextButton(
            onPressed: () => deleteAccount(),
            child: NskText(
              'Да',
              // fontSize: 12,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  deleteAccount() async {
    final id = await _userData.getId();
    final response = await _repository.deleteAccount(int.parse(id!));
    response.fold(
      (l) => Get.snackbar('Ошибка', l.message!),
      (r) {
        Get.snackbar('', 'Аккаунт успешно удален');
        logout();
      },
    );
  }

  logout() {
    _userData.clearAllData();
    Get.offAllNamed('/primaryEntry');
  }
}
