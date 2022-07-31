import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/core/profile/phone_number_confirmation_controller.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneNumberConfirmationScreen
    extends GetView<PhoneNumberConfirmationController> {
  PhoneNumberConfirmationScreen({Key? key}) : super(key: key);
  @override
  final controller = Get.put(PhoneNumberConfirmationController());

  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.startTimer();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const NskAppBar(
          label: 'Подтверждение номера',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: NskText(
                'Телефон',
                fontSize: 12,
                color: Color.fromRGBO(99, 99, 99, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
              ),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                controller: codeController,
                keyboardType: TextInputType.number,
                cursorColor: AppColors.primary,
                onCompleted: (value) {
                  // Get.back();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                      content: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(45, 96, 226, 0.15),
                              blurRadius: 20,
                              spreadRadius: 5,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(188),
                                color: Colors.green,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: AppColors.white,
                              ),
                            ),
                            const Expanded(
                              child: NskText(
                                'Ваш номер телефона успешно изменен',
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  // 'Ваш номер телефона успешно изменен',
                  // '',
                  // backgroundColor: AppColors.white,
                  // margin: EdgeInsets.all(10),
                  // borderRadius: 20,
                  // snackPosition: SnackPosition.BOTTOM,
                  // boxShadows: [
                  //   const BoxShadow(
                  //     offset: Offset(0, 0),
                  //     blurRadius: 20,
                  //     spreadRadius: 5,
                  //     color: Color.fromRGBO(45, 96, 226, 0.15),
                  //   ),
                  // ],
                  // icon: Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 10),
                  //   width: 40,
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(188),
                  //     color: Colors.green,
                  //   ),
                  //   child: Icon(
                  //     Icons.check,
                  //     color: AppColors.white,
                  //   ),
                  // ),
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldWidth: 32,
                  disabledColor: AppColors.primary,
                  activeColor: AppColors.primary,
                  inactiveColor: AppColors.primary,
                  selectedColor: AppColors.primary,
                ),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            const NskText(
              'Вам отправлено сообщение с 4-х значным кодом, для подтверждения вашего номера телефона',
              fontSize: 12,
              color: Color.fromRGBO(99, 99, 99, 1),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Obx(
                () => controller.duration.value.inSeconds == 0
                    ? TextButton(
                        onPressed: () => controller.reset(),
                        child: const NskText(
                          'Отправить повторно',
                          textDecoration: TextDecoration.underline,
                        ),
                      )
                    : NskText(
                        'Новый код через ' +
                            controller.toDigits(controller
                                .duration.value.inMinutes
                                .remainder(60)) +
                            ':' +
                            controller.toDigits(controller
                                .duration.value.inSeconds
                                .remainder(60)),
                        fontSize: 12,
                        color: const Color.fromRGBO(58, 58, 58, 1),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
