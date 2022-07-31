import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_nsk/core/auth/primary_entry_controller.dart';
import 'package:mobile_nsk/pages/widgets/loading_view.dart';
import 'package:mobile_nsk/pages/widgets/nsk_custom_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';


class PrimaryEntryScreen extends GetView<PrimaryEntryController> {
  PrimaryEntryScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(PrimaryEntryController());

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: LoadingView(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  controller: phoneController,
                  inputFormatters: [
                    MaskTextInputFormatter(mask: '+7 (###) ###-##-##')
                  ],
                  keyboardType: TextInputType.number,
                  label: 'Телефон',
                  validator: controller.notNullValidation,
                ),
                NskTextField(
                  controller: passwordController,
                  obscureText: !controller.isPasswordVisible.value,
                  label: 'Введите пароль',
                  suffix: IconButton(
                    onPressed: () => controller.setPasswordVisibility(),
                    icon: controller.isPasswordVisible.value
                        ? SvgPicture.asset(AppSvgImages.visibile)
                        : SvgPicture.asset(AppSvgImages.invisibile),
                  ),
                  validator: controller.notNullValidation,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(6),
                ),
                NskCustomButton(
                  'Войти',
                  isButtonEnabled: true,
                  onTap: () => controller.login(
                    phoneController.text,
                    passwordController.text,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
                Row(
                  children: [
                    const Spacer(),
                    const NskText(
                      'Нет аккаунта?',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed('/signup'),
                      child: const NskText(
                        'Зарегистрироваться',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                        textDecoration: TextDecoration.underline,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
