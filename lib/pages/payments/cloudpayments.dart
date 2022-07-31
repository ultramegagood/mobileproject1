import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_nsk/core/payment/PaymentController.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/policy/agreement_info.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';
import 'package:mobile_nsk/shared/theme.dart';

class PaymentPage extends GetView<PaymentController> {
  PaymentPage({Key? key}) : super(key: key);
  final cardNumber = TextEditingController();
  final expireNumber = TextEditingController();
  final cardNumberMaskFormatter =
      MaskTextInputFormatter(mask: '#### #### #### ####');
  final expireDateFormatter = MaskTextInputFormatter(mask: '##/##');
  final cvcDateFormatter = MaskTextInputFormatter(mask: '###');
  final cvvNumber = TextEditingController();

  final agreement =
      AgreementInfo.fromJson(jsonDecode(box.read('agreement_info')));
  final holderName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      backgroundColor: AppColors.defaultBackground,
      appBar: const NskAppBar(
        label: "Оплата",
      ),
      body: controller.loaderRx.value == true? Center(child: CircularProgressIndicator(),): CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              const NskTitle(title: "Данные карты"),
              NskTextField(
                label: "Введите номер карты",
                controller: cardNumber,
                inputFormatters: [cardNumberMaskFormatter],
              ),
              NskTextField(
                label: "Имя и фамилия на латинице",
                controller: holderName,
              ),
              Row(
                children: [
                  Expanded(
                      child: NskTextField(
                        label: "Срок действия",
                        controller: expireNumber,
                        inputFormatters: [expireDateFormatter],
                      )),
                  Expanded(
                      child: NskTextField(
                        controller: cvvNumber,
                        label: "CVV",
                        inputFormatters: [cvcDateFormatter],
                      ))
                ],
              ),
              NskButton(
                  text: "Оплатить",
                  onPressed: () async {
                    controller.makePayments(
                      cardNumber.text,
                      expireNumber.text,
                      cvvNumber.text,
                      holderName.text,
                      agreement,
                    );
                  }),
            ],
          ),
        )
      ]),
    ));
  }
}
