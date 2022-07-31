import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_nsk/core/policy_controller.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/models/policy/clients.dart';
import 'package:mobile_nsk/pages/widgets/drivers_list.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_button.dart';

import 'package:mobile_nsk/pages/widgets/nsk_checkbox.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/shared/theme.dart';

class PolicyHolder extends GetView<PolicyController> {
  PolicyHolder({Key? key}) : super(key: key);
  @override
  final controller = Get.find<PolicyController>();

  final phoneMask = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final dateMask = MaskTextInputFormatter(
      mask: '##.##.####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final iin = TextEditingController();
  final documentData = TextEditingController();
  final documenIssue = TextEditingController();
  final documentNumber = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final client = TextEditingController();
  final legalName = TextEditingController();
  final benifName = TextEditingController();
  final address = TextEditingController();
  final driverFocus = FocusNode();
  final enabled = false;
  final driveriin = TextEditingController();
  final textEditingController =
      TextEditingController(text: "Добавить застрахованного");
  final docLength = 12;
  final isDriver = ValueNotifier(false);

  final validFrom = String;
  final validTill = String;
  final isLoading = bool;
  void isDriverInsurer(bool? value, Client holder) async {
    isDriver.value = value!;
    await database.clientIsDriver(holder, isDriver.value);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: AppColors.defaultBackground,

        appBar: const NskAppBar(
          isUnderText: true,
          label: "Оформление \"ОГПО ВТС\"",
          underLabel: "шаг 1 из 3",
        ),
        
        body: controller.loaderRx.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : StreamBuilder<Policy>(
                stream: database.watchCart(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.data?.drivers
                            .where((element) => element.isInsurer == true)
                            .isEmpty == true) {
                      return Center(
                        child: Form(
                          child: CustomScrollView(
                            slivers: [
                              SliverList(
                                delegate: SliverChildListDelegate.fixed(
                                  [
                                    NskTextField(
                                      keyboardType: TextInputType.number,
                                      label: "Введите ИИН/БИН",
                                      autoFocus: true,
                                      onChanged: (val) {
                                        if (val.length == 12){
                                          controller.getHolder(iin.text, false,
                                              true, snapshot.data!);
                                        }
                                      },
                                      maxLength: 12,
                                      controller: iin,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      final driverSnap = snapshot.data?.drivers
                          .where((element) => element.isDriver == true);
                      final holder = snapshot.data!.drivers
                          .where((element) => element.isInsurer == true)
                          .single;
                      client.text = holder.lastName! +
                          " " +
                          holder.firstName! +
                          " " +
                          holder.middleName!;
                      iin.text = holder.iin!;
                      if (holder.legalName != null) {
                        legalName.text = holder.legalName!;
                      }
                      return Center(
                          child: Form(
                              child: CustomScrollView(slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate.fixed(
                            [
                              const NskTitle(title: "Водитель"),
                              NskCheckbox(
                                value: isDriver.value,
                                onChanged: (bool? value) {
                                  if (holder.isInsurer == true &&
                                      int.parse(holder.classType!) >= 3) {
                                    isDriverInsurer(value, holder);
                                  } else {
                                    Get.snackbar(
                                      "Ошибка",
                                      "Клиент не является водителем",
                                      snackPosition: SnackPosition.BOTTOM,
                                      forwardAnimationCurve:
                                          Curves.elasticInOut,
                                      reverseAnimationCurve: Curves.easeOut,
                                    );
                                  }
                                },
                                title: "Страхователь является водителем",
                                isConfirm: false,
                              ),
                              const NskTitle(title: "Данные пользователя"),
                              NskTextField(
                                enabled: false,
                                controller: iin,
                                label: holder.isIndividual == 1
                                    ? "Номер ИИН"
                                    : "Номер БИН",
                              ),
                              NskTextField(
                                enabled: false,
                                controller: holder.isIndividual == 1
                                    ? client
                                    : legalName,
                                label: holder.isIndividual == 1
                                    ? "ФИО"
                                    : "Наименования организаций",
                              ),
                              if (holder.isIndividual == 0)
                                NskTextField(
                                  controller: address,
                                  label: "Адрес",
                                ),
                              NskTextField(
                                inputFormatters: [phoneMask],
                                controller: phone,
                                keyboardType: TextInputType.phone,
                                label: "Телефон",
                              ),
                              NskTextField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                label: "Почта",
                              ),
                              NskTextField(
                                keyboardType: TextInputType.number,
                                controller: documentNumber,
                                label: "Номер документа",
                              ),
                              NskTextField(
                                inputFormatters: [dateMask],
                                controller: documentData,
                                keyboardType: TextInputType.number,
                                label: "Дата выдачи",
                              ),
                              const NskTitle(title: "Застрахованные"),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  color: Colors.transparent,
                                  child: IgnorePointer(
                                    child: NskTextField(
                                      suffix: const Icon(
                                        Icons.add,
                                        color: Color.fromRGBO(45, 96, 226, 1),
                                      ),
                                      controller: textEditingController,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Водители
                        if (driverSnap!.isNotEmpty == true)
                          DriverList(
                            snapshot: snapshot,
                          ),
                        SliverToBoxAdapter(
                          child: NskButton(
                              text: "Продолжить",
                              onPressed: () async {
                                if (int.parse(holder.classType!) <= 3 &&
                                        isDriver.value == false ||
                                    int.parse(holder.classType!) >= 3 &&
                                        isDriver.value == false) {
                                  if (snapshot.data?.drivers
                                          .where((element) =>
                                              element.isDriver == true)
                                          .isNotEmpty ==
                                      true) {
                                    controller.updateClient(
                                      holder,
                                      phone.text,
                                      address.text,
                                      email.text,
                                      documentData.text,
                                      documentNumber.text,
                                      holder.isInsurer,
                                      snapshot.data!,
                                    );

                                    controller.setFullCLient(
                                        holder,
                                        true,
                                        phone.text,
                                        address.text,
                                        email.text,
                                        documentNumber.text,
                                        documentData.text,
                                        '/policy/step2');
                                  } else {
                                    Get.snackbar(
                                      "Ошибка",
                                      "нет водителя",
                                      snackPosition: SnackPosition.BOTTOM,
                                      forwardAnimationCurve:
                                          Curves.elasticInOut,
                                      reverseAnimationCurve: Curves.easeOut,
                                    );
                                  }
                                } else if (int.parse(holder.classType!) >= 3 &&
                                    isDriver.value == true) {
                                  controller.updateClient(
                                    holder,
                                    phone.text,
                                    address.text,
                                    email.text,
                                    documentData.text,
                                    documentNumber.text,
                                    holder.isInsurer,
                                    snapshot.data!,
                                  );
                                  controller.setFullCLient(
                                      holder,
                                      true,
                                      phone.text,
                                      address.text,
                                      email.text,
                                      documentNumber.text,
                                      documentData.text,
                                      '/policy/step2');
                                } else {
                                  Get.snackbar(
                                    "Ошибка",
                                    "Клиент не является водителем",
                                    snackPosition: SnackPosition.BOTTOM,
                                    forwardAnimationCurve: Curves.elasticInOut,
                                    reverseAnimationCurve: Curves.easeOut,
                                  );
                                }
                              }),
                        )
                      ])));
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
