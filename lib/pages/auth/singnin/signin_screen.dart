import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/core/auth/signin_controller.dart';
import 'package:mobile_nsk/pages/widgets/loading_view.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignInScreen extends GetView<SignInController> {
  SignInScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(SignInController());

  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    pinController.addListener(() => controller.checkPin(pinController));
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          onPressed: () => Get.offAllNamed('/primaryEntry'),
          icon: const Icon(
            Icons.clear,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(
          AppSvgImages.logo,
          height: getProportionateScreenHeight(20),
        ),
      ),
      bottomSheet: GridView.builder(
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
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(188),
              border: Border.all(
                color: AppColors.primary,
              ),
            ),
            child: index == 9
                ? Obx(
                    () => SvgPicture.asset(
                      AppSvgImages.fingerprint,
                      color: controller.isBiommericsEnabled.value
                          ? AppColors.primary
                          : Colors.grey,
                    ),
                  )
                : index == 11
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
      body: Obx(
        () => controller.loadRx.value
            ? LoadingView()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    padding: const EdgeInsets.all(2.57),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.black, width: 1),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.lightGrey,
                      ),
                      child: const Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  NskText(
                    '${controller.userName.value}, \nЗдравствуйте!',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
                  Obx(
                    () => NskText(
                      controller.isPinCorrect.value
                          ? 'Введите 4-х значный код для \nбыстрого доступа к приложению'
                          : 'Неверный код',
                      color: controller.isPinCorrect.value
                          ? AppColors.black
                          : Colors.red,
                    ),
                  ),
                ],
              ),
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
