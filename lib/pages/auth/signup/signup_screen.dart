import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_nsk/core/auth/signup_controller.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:mobile_nsk/pages/widgets/nsk_custom_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';

class SignUpScreen extends GetView<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController iinController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController documentNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  @override
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            SvgPicture.asset(AppSvgImages.logo),
            SizedBox(
              height: getProportionateScreenHeight(26),
            ),
            const NskText(
              'Добро пожаловать!',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: getProportionateScreenHeight(24),
            ),
            NskTextField(
              controller: iinController,
              label: 'ИИН',
              onChanged: (value) => controller.notNullValidation(
                value,
                controller.isIinNotNull,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [MaskTextInputFormatter(mask: '############')],
            ),
            NskTextField(
              controller: phoneController,
              label: 'Контактный номер',
              onChanged: (value) => controller.notNullValidation(
                phoneController.text,
                controller.isPhoneNotNull,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                MaskTextInputFormatter(mask: '+7 (###) ### ## ##')
              ],
            ),
            NskTextField(
              controller: documentNumberController,
              label: 'Номер удостоверения личности/паспорта',
              onChanged: (value) => controller.notNullValidation(
                documentNumberController.text,
                controller.isPhoneNotNull,
              ),
              inputFormatters: [MaskTextInputFormatter(mask: '#########')],
            ),
            Obx(
              () => NskTextField(
                controller: passwordController,
                obscureText: !controller.isPasswordVisible.value,
                label: 'Пароль',
                onChanged: (value) => controller.passValidation(value, false),
                suffix: IconButton(
                  onPressed: () => controller.setPasswordVisibility(),
                  icon: SvgPicture.asset(
                    controller.isPasswordVisible.value
                        ? AppSvgImages.visibile
                        : AppSvgImages.invisibile,
                  ),
                ),
              ),
            ),
            Obx(
              () => NskTextField(
                controller: passwordConfirmController,
                obscureText: !controller.isPasswordVisible.value,
                label: 'Повторите пароль',
                onChanged: (value) => controller.passValidation(value, true),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(6),
            ),
            Row(
              children: [
                const Spacer(),
                Obx(() => _buildValid(controller.isSixSymbols.value)),
                SizedBox(width: getProportionateScreenWidth(6)),
                const NskText(
                  'от 6 символов',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
                SizedBox(width: getProportionateScreenWidth(15)),
                Obx(() => _buildValid(controller.isOneNumber.value)),
                SizedBox(width: getProportionateScreenWidth(6)),
                const NskText(
                  'Одна цифра',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
                SizedBox(width: getProportionateScreenWidth(15)),
                Obx(() => _buildValid(controller.isFirstUppercase.value)),
                SizedBox(width: getProportionateScreenWidth(6)),
                const NskText(
                  'Заглавная буква',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
                const Spacer(),
              ],
            ),
            Obx(
              () => NskCustomButton(
                'Зарегистрироваться',
                isButtonEnabled: controller.isButtonEnabled.value,
                onTap: () => controller.register(
                    iinController.text,
                    phoneController.text,
                    documentNumberController.text,
                    passwordController.text,
                    passwordConfirmController.text),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(24)),
            Row(
              children: [
                const Spacer(),
                const NskText(
                  'Есть аккаунт?',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                TextButton(
                  onPressed: () => Get.offAllNamed('/primaryEntry'),
                  child: const NskText(
                    'Войти',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildValid(ValidationStates isValid) {
    return isValid == ValidationStates.neutral
        ? Container(
            width: 9,
            height: 1,
            decoration: const BoxDecoration(
              color: AppColors.grey,
            ),
          )
        : isValid == ValidationStates.correct
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.green,
              )
            : const Icon(
                Icons.clear,
                size: 16,
                color: Colors.red,
              );
  }
}
