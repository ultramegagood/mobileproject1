import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/core/profile/change_pin_code_controller.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ChangePinCodeScreen extends GetView<ChangePinCodeController> {
  ChangePinCodeScreen({Key? key}) : super(key: key);
  @override
  final controller = Get.put(ChangePinCodeController());

  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    controller.init(pinController);
    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      appBar: AppBar(
        backgroundColor: AppColors.defaultBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            CupertinoIcons.xmark,
            color: AppColors.black,
          ),
        ),
      ),
      bottomSheet: Container(
        color: AppColors.defaultBackground,
        child: GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(67),
            vertical: getProportionateScreenHeight(30),
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: getProportionateScreenWidth(90),
            childAspectRatio: 1,
            crossAxisSpacing: getProportionateScreenWidth(24),
            mainAxisSpacing: getProportionateScreenHeight(16),
          ),
          itemCount: 12,
          itemBuilder: (context, index) => InkWell(
            borderRadius: BorderRadius.circular(188),
            splashColor: AppColors.primary.withOpacity(0.3),
            highlightColor: AppColors.white,
            onTap: () => controller.setPin(numbers[index], index, pinController),
            child: index == 9
                ? const SizedBox()
                : Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(188),
                      border: Border.all(
                        color: AppColors.primary,
                      ),
                    ),
                    child: index == 11
                        ? const Icon(
                            Icons.backspace,
                            color: AppColors.primary,
                          )
                        : NskText(
                            numbers[index],
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                  ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Obx(
            () => NskText(
              !controller.isPinsEqual.value
                  ? 'Не совпадает'
                  : controller.isRepeatPin.value
                      ? 'Повторите код доступа'
                      : controller.isCurrentPinEntered.value
                          ? 'Придумайте код доступа'
                          : controller.isCurrentPinCorrect.value
                              ? 'Укажите старый PIN-код'
                              : 'Не совпадает',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: !controller.isPinsEqual.value
                  ? Colors.red
                  : controller.isRepeatPin.value
                      ? AppColors.black
                      : controller.isCurrentPinEntered.value
                          ? AppColors.black
                          : controller.isCurrentPinCorrect.value
                              ? AppColors.black
                              : Colors.red,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 100,
            ),
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              enabled: false,
              controller: pinController,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                fieldWidth: 32,
                disabledColor: AppColors.primary,
              ),
              onChanged: (value) {},
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }

  List<String> numbers = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'empty',
    '0',
    'backspace',
  ];
}
