import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_nsk/core/profile/change_phone_number_controller.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_custom_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';

class ChangePhoneNumberScreen extends GetView<ChangePhoneNumberController> {
  ChangePhoneNumberScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(ChangePhoneNumberController());

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      appBar: const NskAppBar(
        label: 'Изменить номер телефона',
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: getProportionateScreenHeight(15),),
        child: Obx(
          () => NskCustomButton(
            'Продолжить',
            isButtonEnabled: controller.isButtonEnabled.value,
            onTap: () => controller.isButtonEnabled.value
                ? Get.toNamed('/change_phone/confirm')
                : null,
          ),
        ),
      ),
      body: NskTextField(
        label: 'Новый номер телефона',
        fillColor: AppColors.white,
        controller: phoneController,
        keyboardType: TextInputType.number,
        prefixText: '+7 ',
        inputFormatters: [
          MaskTextInputFormatter(
            mask: '(###) ###-##-##',
            filter: {'#': RegExp(r'[0-9]')},
          ),
        ],
        onChanged: controller.validator,
      ),
    );
  }
}
