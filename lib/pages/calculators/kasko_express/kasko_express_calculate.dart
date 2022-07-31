import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/core/policy_controller.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/policy/insurance_amount.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/pages/widgets/dropdown.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_calendar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:simple_moment/simple_moment.dart';

class KaskoExpressCalculate extends GetView<PolicyController> {
  KaskoExpressCalculate({Key? key}) : super(key: key);
  final holderText = TextEditingController();
  final productType = TextEditingController(text: "ОС ГПО ВТС");
  final validDate = TextEditingController();
  final discounted = TextEditingController();
  final now = DateTime.now().add(const Duration(days: 1));
  final year = DateTime.now().year;
  InsuranceAmount? selectedValue;
  final dataAmount = box.read('insuranceAmount');
  List<InsuranceAmount> amountsFromJson(String str) =>
      List<InsuranceAmount>.from(
          json.decode(str).map((x) => InsuranceAmount.fromJson(x)));
  @override
  Widget build(BuildContext context) {
    List<InsuranceAmount> amountsList = amountsFromJson(dataAmount);
    return Obx((() => Scaffold(
      backgroundColor: AppColors.defaultBackground,
        appBar: const NskAppBar(
          isUnderText: true,
          label: "Оформление \"КАСКО Экспресс\"",
          underLabel: "шаг 3 из 3",
        ),
        body: controller.loaderRx.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : StreamBuilder<Policy>(
                stream: database.watchCart(),
                builder: (context, snapshot) {
                  final discount = snapshot.data?.discount;
                  discounted.text = discount.toString() + "тг.";
                  return CustomScrollView(
                    slivers: [
                      SliverList(
                          delegate: SliverChildListDelegate.fixed([
                        const NskTitle(title: "Срок действия договора"),
                        NskDatePicker(
                          start: snapshot.data?.validFrom ??
                              "Дата начало договора",
                          end: snapshot.data?.validTill ??
                              "Дата окончание договора",
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: now,
                                maxTime: DateTime(2103), onConfirm: (date) {
                              Moment start = Moment.parse(date.toString());
                              var st = start.format("dd.MM.yyyy");
                              var end = start.add(years: 1, days: -1);
                              var en = end.format("dd.MM.yyyy");
                              database.insertDate(st, en, snapshot.data!.id);
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.ru);
                          },
                        ),
                        DropdownMenu(
                          hintText: "Выберите сумму страхования",
                          onChanged: (value) {
                            selectedValue = value;

                            controller.insertInsuranceSum(
                                value.id, snapshot.data!);
                          },
                          value: selectedValue,
                          items: amountsList
                              .map<DropdownMenuItem<InsuranceAmount>>(
                                  (InsuranceAmount value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text("премия " +
                                  value.discountedPremium.toString() +
                                  ' - ' +
                                  "сумма " +
                                  value.insuranceSum.toString()),
                            );
                          }).toList(),
                        ),
                      ])),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        fillOverscroll: true,
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                NskButton(
                                    text: "Оплатить",
                                    onPressed: snapshot.data?.validFrom !=
                                                null &&
                                            snapshot.data?.insuranceCoverSum !=
                                                0
                                        ? () {
                                            controller.kaskoCalculate(
                                                snapshot.data!,
                                                selectedValue!.id);
                                          }
                                        : null),
                              ],
                            )),
                      ),
                    ],
                  );
                },
              ))));
  }
}
