import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/core/tourism/tourism_step3_controller.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';

class TourismStepThreeScreen extends GetView<TourismStepThreeController> {
  TourismStepThreeScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(TourismStepThreeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Obx(() {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const NskAppBar(
            label: 'Оформление “Туризм”',
            isUnderText: true,
            underLabel: 'шаг 3 из 3',
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NskTitle(
                  title: 'Заключение договора по продукту:',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                _buildText('Тип продукта', 'Туризм'),
                _buildText('Страхователь', 'Михаил Аркадий Аркадионович'),
                _buildText('Срок действия', 'С 08.05.2020 по 08.05.2021'),
                _buildText('Цель', 'Незнаю'),
                _buildText('Сумма страхования', '15 000 тг.'),
                _buildText('Премия', '5 904 тг.'),
                _buildText('Застрахованные', 'Михаил Аркадий Аркадионович'),
                SizedBox(
                  height: getProportionateScreenHeight(14),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () => controller.setIsAgreedInsurance(
                        !controller.isAgreedInsurance.value),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: controller.isAgreedInsurance.value,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onChanged: controller.setIsAgreedInsurance,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        const Expanded(
                          child: NskText(
                            'Я согласен(-на) с Правилами страхования и условиями страхования. Я согласен(-на) на сбор, обработку, хранение и предоставление, в том числе при необходимости, третьим лицам, моих персональных данных. Заявляю (в том чисде для руководителя юр. лица), что не отношусь к категории ИПДЛ (иностранное публичное должностное лицо)',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () => controller
                        .setIsAgreedInfo(!controller.isAgreedInfo.value),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: controller.isAgreedInfo.value,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onChanged: controller.setIsAgreedInfo,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        const Expanded(
                          child: NskText(
                            'Я согласен(-на) на сбор, обработку персональных данных и получение по ним сведений из государственных баз данных, в том числе, сведений, состовляющих врачебную тайну.',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(24),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: getProportionateScreenHeight(30),
                    top: getProportionateScreenHeight(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(15),
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: controller.isAgreedInfo.value &&
                              controller.isAgreedInsurance.value
                          ? AppColors.primary
                          : Colors.grey,
                    ),
                  ),
                  child: NskText(
                    'Оплатить',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: controller.isAgreedInfo.value &&
                            controller.isAgreedInsurance.value
                        ? AppColors.primary
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Container _buildText(String label, String text) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffD1D1D1)),
          color: Color(0xffEEEEEE)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NskText(
            label,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xff676767),
          ),
          SizedBox(height: 3),
          NskText(
            text,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xff0F0F0F),
          )
        ],
      ),
    );
  }
}
