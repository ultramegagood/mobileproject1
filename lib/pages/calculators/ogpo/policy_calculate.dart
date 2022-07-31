import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_nsk/core/policy_controller.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_calendar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';
import 'package:mobile_nsk/pages/widgets/nsk_total_premium.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:simple_moment/simple_moment.dart';

class PolicyCalculate extends GetView<PolicyController> {
  PolicyCalculate({Key? key}) : super(key: key);
  final holderText = TextEditingController();
  final productType = TextEditingController(text: "ОС ГПО ВТС");
  final validDate = TextEditingController();
  final discounted = TextEditingController();
  final now = DateTime.now().add(const Duration(days: 1));
  final year = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return Obx((() => Scaffold(

      backgroundColor: AppColors.defaultBackground,
        appBar: const NskAppBar(
          isUnderText: true,
          label: "Оформление \"ОГПО ВТС\"",
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
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: now,
                              maxTime: DateTime(2103),
                              onConfirm: (date) {
                                Moment start = Moment.parse(date.toString());
                                var st = start.format("dd.MM.yyyy");
                                var end = start.add(years: 1, days: -1);
                                var en = end.format("dd.MM.yyyy");
                                log('Start & End: ' + st + ' - ' +  en);
                                database.insertDate(st, en, snapshot.data!.id);
                                controller.policyCalculate(
                                    snapshot.data!, st, en);
                              },
                              currentTime: DateTime.now(),
                              locale: LocaleType.ru,
                            );
                          },
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
                                NskTotalPremium(snapshot: snapshot),
                                NskButton(
                                    text: "Оплатить",
                                    onPressed:
                                        snapshot.data?.discountedPremium != 0
                                            ? () {
                                                controller.policyWrite(
                                                    snapshot.data!);
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
