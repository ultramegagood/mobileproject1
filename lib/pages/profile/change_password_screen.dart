import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/core/profile/change_password_controller.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_custom_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.defaultBackground,
      appBar: const NskAppBar(
        label: 'Изменить пароль',
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: getProportionateScreenHeight(15)),
        child: Obx(
          () => NskCustomButton(
            'Сохранить',
            isButtonEnabled: controller.isButtonEnabled.value,
            onTap: () {
              controller.isButtonEnabled.value ? Get.back() : null;
            },
          ),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Obx(
          () => Column(
            children: [
              NskTextField(
                label: 'Текущий пароль',
                fillColor: AppColors.white,
                obscureText: !controller.isCurrentVisible.value,
                controller: controller.currentPasswordController,
                onChanged: (_) => controller.lastValidation(),
                suffix: IconButton(
                  icon: SvgPicture.asset(
                    controller.isCurrentVisible.value
                        ? AppSvgImages.visibile
                        : AppSvgImages.invisibile,
                  ),
                  onPressed: controller.setCurrentVisibility,
                ),
              ),
              NskTextField(
                label: 'Новый пароль',
                fillColor: AppColors.white,
                obscureText: !controller.isNewVisible.value,
                controller: controller.newPasswordControler,
                onChanged: (_) => controller.lastValidation(),
                suffix: IconButton(
                  icon: SvgPicture.asset(
                    controller.isNewVisible.value
                        ? AppSvgImages.visibile
                        : AppSvgImages.invisibile,
                  ),
                  onPressed: controller.setNewVisibility,
                ),
              ),
              NskTextField(
                label: 'Повторить новый пароль',
                fillColor: AppColors.white,
                obscureText: !controller.isNewVisible.value,
                controller: controller.newPasswordConfirmControler,
                onChanged: (_) => controller.lastValidation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
