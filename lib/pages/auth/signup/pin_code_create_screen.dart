import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/core/auth/pin_code_create_controller.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeCreateScreen extends GetView<PinCodeCreateController> {
  PinCodeCreateScreen({Key? key}) : super(key: key);
  @override
  final controller = Get.put(PinCodeCreateController());

  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    controller.init(pinController);
    return Scaffold(
      bottomSheet: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(67),
          vertical: 20,
        ),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: getProportionateScreenWidth(90),
          childAspectRatio: 1,
          crossAxisSpacing: getProportionateScreenWidth(24),
          mainAxisSpacing: getProportionateScreenHeight(16),
        ),
        itemCount: 12,
        itemBuilder: (context, index) => index == 9
            ? const SizedBox()
            : InkWell(
                borderRadius: BorderRadius.circular(188),
                splashColor: AppColors.primary.withOpacity(0.3),
                highlightColor: AppColors.white,
                onTap: () =>
                    controller.setPin(numbers[index], index, pinController),
                child: Container(
                  // width: getProportionateScreenWidth(64),
                  // height: getProportionateScreenHeight(64),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Obx(
            () => NskText(
              controller.isPinsEqual.value
                  ? controller.isRepeatPin.value
                      ? 'Повторите код доступа'
                      : 'Придумайте код доступа'
                  : 'Не совподает',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color:
                  controller.isPinsEqual.value ? AppColors.black : Colors.red,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(24),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(106),
              ),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                enabled: false,
                controller: pinController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldWidth: getProportionateScreenWidth(32),
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
