import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mobile_nsk/core/profile/setting_controller.dart';
import 'package:mobile_nsk/pages/widgets/loading_view.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/theme.dart';

class SettingsScreen extends GetView<SettingsController> {
  SettingsScreen({Key? key}) : super(key: key);
  @override
  final controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.defaultBackground,
        appBar: const NskAppBar(
          label: 'Настройки',
        ),
        body: LoadingOverlay(
          isLoading: controller.loadRx.value,
          progressIndicator: LoadingView(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(2.57),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: AppColors.black, width: 1),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        child: Icon(
                          Icons.person,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(188),
                          color: AppColors.primary,
                        ),
                        child: const Icon(
                          Icons.add_a_photo_outlined,
                          color: AppColors.white,
                          size: 16.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                NskText(
                  controller.user.value == null
                      ? ''
                      : controller.user.value!.name!,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                NskText('+' +
                    (controller.user.value == null
                        ? ''
                        : controller.user.value!.phone!)),
                const SizedBox(height: 20),
                const Divider(color: Colors.grey),
                _buildSetting(
                  'Push уведомления',
                  value: controller.isPushNotificationOn.value,
                  onTap: controller.setNotificationSetting,
                ),
                // _buildSetting(
                //   'Изменить пароль',
                //   isSwitch: false,
                //   onTap: (_) => Get.toNamed('change_password'),
                // ),
                _buildSetting(
                  'Изменить код быстрого доступа',
                  isSwitch: false,
                  onTap: (_) => Get.toNamed('/change_pin'),
                ),
                _buildSetting(
                  'Вход c Face/Touch ID',
                  value: controller.isBiometricsOn.value,
                  onTap: controller.setBiometrics,
                ),
                // _buildSetting(
                //   'Изменить номер телефона',
                //   isSwitch: false,
                //   onTap: (_) => Get.toNamed('/change_phone'),
                // ),
                _buildSetting(
                  'Удалить аккаунт',
                  isSwitch: false,
                  // onTap: (_) => controller.deleteAccount(),
                  onTap: (_) => controller.showDeleteAlertDialog(),
                ),
                _buildSetting(
                  'Выход',
                  onTap: (_) => controller.logout(),
                  isSwitch: false,
                  isExit: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildSetting(
    String title, {
    bool? value,
    required Function(bool)? onTap,
    bool isSwitch = true,
    bool isExit = false,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: () => onTap!(value ?? true),
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: NskText(
            title,
            fontSize: 16,
            color: isExit ? Colors.red : AppColors.black,
          ),
          trailing: isSwitch
              ? CupertinoSwitch(
                  value: value!,
                  onChanged: onTap,
                  activeColor: AppColors.primary,
                )
              : isExit
                  ? const SizedBox()
                  : const Icon(
                      CupertinoIcons.forward,
                      color: Colors.grey,
                    ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
