
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/core/policy_controller.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/policy/agreement_info.dart';
import 'package:mobile_nsk/pages/widgets/nsk_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';
import "package:intl/intl.dart";
import 'package:mobile_nsk/shared/theme.dart';

class KaskoExpressInfo extends GetView<PolicyController> {
  KaskoExpressInfo({Key? key}) : super(key: key);
  final type = TextEditingController();
  final id = TextEditingController();
  final holder = TextEditingController();
  final date = TextEditingController();
  final totalInsurance = TextEditingController();
  final premium = TextEditingController();
  final idContract = Get.arguments;
   final agreement = AgreementInfo.fromJson(jsonDecode(box.read('agreement_info')));

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(locale: 'eu', symbol: 'тг.')
                  .format(agreement.insuranceAmount);
              id.text = agreement.id.toString();
              holder.text = agreement.holderName;
              date.text = "С " +
                  agreement.fromDate +
                  " по " +
                  agreement.tillDate!;
              totalInsurance.text = formatter.toString();
              premium.text = agreement.premium.toString();

              List<TextEditingController> drivers = List.generate(
                  agreement.insured.length,
                      (i) =>
                      TextEditingController(text: agreement.insured[i]));
              List<TextEditingController> vehicles = List.generate(
                  agreement.objects.length,
                      (i) =>
                      TextEditingController(text: agreement.objects[i]));
              
    return Scaffold(
        backgroundColor: AppColors.defaultBackground,

        body: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate.fixed([
                        const SizedBox(height: 30,),
                        const NskTitle(title: "Данные договора"),
                        NskTextField(
                          controller: id,
                          enabled: false,
                          label: "ID договора",
                        ),
                        NskTextField(
                          controller: holder,
                          enabled: false,
                          label: "Страхователь",
                        ),
                        NskTextField(
                          controller: date,
                          enabled: false,
                          label: "Срок действия",
                        ),
                        NskTextField(
                          controller: totalInsurance,
                          enabled: false,
                          label: "Сумма страхования",
                        ),
                        NskTextField(
                          controller: premium,
                          enabled: false,
                          label: "Премия",
                        ),
                      ])),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return NskTextField(
                          controller: drivers[index],
                          enabled: false,
                          label: "Застрахованные",
                        );
                      }, childCount: agreement.insured.length)),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return NskTextField(
                          controller: vehicles[index],
                          enabled: false,
                          label: "Объекты страхования",
                        );
                      }, childCount: agreement.objects.length )),
                  SliverToBoxAdapter(
                    child: NskButton(
                      text: "Оплатить",
                      onPressed: () {
                        Get.offAllNamed('/payment');
                      },
                    ),
                  )
                ],
              )
            
    );
  }
}
