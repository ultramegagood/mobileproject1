import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/core/policy_controller.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';

import 'package:mobile_nsk/pages/widgets/vehicle_list.dart';
import 'package:mobile_nsk/shared/theme.dart';

class PolicyVehicle extends GetView<PolicyController> {
  PolicyVehicle({Key? key}) : super(key: key);

  final licensePlate = TextEditingController();

  final textEditingController =
      TextEditingController(text: "Добавить транспорт");
  @override
  final controller = Get.find<PolicyController>();

  @override
  Widget build(BuildContext context) {
    return Obx((() => Scaffold(
        backgroundColor: AppColors.defaultBackground,

        appBar: const NskAppBar(
          isUnderText: true,
          disableLeading: false,
          label: "Оформление \"ОГПО ВТС\"",
          underLabel: "шаг 2 из 3",
        ),
        body: controller.loaderRx.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : StreamBuilder<Policy>(
                stream: database.watchCart(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.data?.vehicles.isEmpty == true) {
                      return Center(
                        child: Form(
                          child: CustomScrollView(
                            slivers: [
                              SliverList(
                                delegate: SliverChildListDelegate.fixed(
                                  [
                                    NskTextField(
                                      label: "Введите номер ТС",
                                      autoFocus: true,
                                      suffix: GestureDetector(
                                        onTap: () async {
                                          await controller.getVehicle(
                                              licensePlate.text,
                                              snapshot.data!);
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Color.fromRGBO(45, 96, 226, 1),
                                        ),
                                      ),
                                      controller: licensePlate,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                          child: Form(
                              child: CustomScrollView(slivers: [
                        const SliverToBoxAdapter(
                            child: NskTitle(title: "Транспортное средство")),
                        VehicleList(snapshot: snapshot),
                        SliverFillRemaining(
                          hasScrollBody: false,
                          fillOverscroll: true,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: NskButton(
                                text: "Продолжить",
                                onPressed: () {
                                  if (snapshot.data?.vehicles.length != null) {
                                    Get.toNamed(
                                        "/policy/step2/calculate_policy");
                                  } else {
                                    (Get.snackbar(
                                      "Ошибка",
                                      "Добавьте транспортное средство",
                                      snackPosition: SnackPosition.BOTTOM,
                                      forwardAnimationCurve:
                                          Curves.elasticInOut,
                                      reverseAnimationCurve: Curves.easeOut,
                                    ));
                                  }
                                }),
                          ),
                        ),
                      ])));
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }))));
  }
}
