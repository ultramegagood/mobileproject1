import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_nsk/core/tourism/tourism_step2_controller.dart';
import 'package:mobile_nsk/pages/widgets/checkbox.dart';
import 'package:mobile_nsk/pages/widgets/loading_view.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_custom_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';

class AddNewInsurerScreen extends GetView<TourismStepTwoController> {
  AddNewInsurerScreen({Key? key, this.index}) : super(key: key);
  static TourismStepTwoController c = Get.find<TourismStepTwoController>();
  final int? index;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: NskAppBar(
          label: 'Добавление застрахованного',
          onBack: () {
            Get.back(result: false);
            // controller.birthDate('');
            // controller.givenDate('');
          },
        ),
        body: LoadingOverlay(
          isLoading: controller.loaderRx.value,
          progressIndicator: LoadingView(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NskTitle(
                    title: 'Застрахованный',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  NskCheckBox(
                    text: 'Резидент РК',
                    value: true,
                    onChanged: (p0) => null,
                  ),
                  NskTitle(
                    title: 'Данные пользователя',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  NskTextField(
                    label: 'ИИН*',
                    controller: controller.tempInsurer.value.iin!,
                    fillColor: AppColors.white,
                    validator: _notNull,
                    inputFormatters: [
                      MaskTextInputFormatter(mask: '############')
                    ],
                    onChanged: controller.getFullClientInsurer,
                  ),
                  NskTextField(
                    label: 'Фамилия*',
                    controller: controller.tempInsurer.value.surname!,
                    fillColor: AppColors.white,
                    validator: _notNull,
                    isUppercase: true,
                    onChanged: (value) =>
                        controller.surnameToLatin(value, true),
                  ),
                  NskTextField(
                    label: 'Имя*',
                    controller: controller.tempInsurer.value.name!,
                    fillColor: AppColors.white,
                    validator: _notNull,
                    isUppercase: true,
                    onChanged: (value) => controller.nameToLatin(value, true),
                  ),
                  NskTextField(
                    label: 'Отчество',
                    controller: controller.tempInsurer.value.dadsName!,
                    fillColor: AppColors.white,
                  ),
                  NskTextField(
                    label: 'Фамилия на латинице*',
                    controller: controller.tempInsurer.value.surnameEng!,
                    validator: _notNull,
                    fillColor: AppColors.white,
                    isUppercase: true,
                  ),
                  NskTextField(
                    label: 'Имя на латинице*',
                    controller: controller.tempInsurer.value.nameEng!,
                    validator: _notNull,
                    fillColor: AppColors.white,
                    isUppercase: true,
                  ),
                  SizedBox(height: 24),
                  _buildDatePicker(
                    context,
                    label: 'Дата рождения*',
                    value: controller.tempInsurer.value.birthDate!.text,
                    boolValue: controller.isBirthDateSelected.value,
                    onConfirm: controller.setTempInsurerBirthDate,
                  ),
                  SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildGenderToggle('Мужчина', 0),
                      _buildGenderToggle('Женщина', 1),
                      Visibility(
                        visible: !controller.isGenderIdentified.value,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: NskText(
                            '*Укажите пол',
                            fontSize: 11.5,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                  NskTextField(
                    label: 'Адрес*',
                    controller: controller.tempInsurer.value.address!,
                    fillColor: AppColors.white,
                    validator: _notNull,
                  ),
                  NskTitle(
                    title: 'Данные документа',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  NskTextField(
                    label: 'Номер паспорта*',
                    controller: controller.tempInsurer.value.docnum!,
                    fillColor: AppColors.white,
                    validator: _notNull,
                  ),
                  SizedBox(height: 24),
                  _buildDatePicker(
                    context,
                    label: 'Дата выдачи паспорта*',
                    value: controller.tempInsurer.value.whenGiven!.text,
                    boolValue: controller.isGivenDateSelected.value,
                    onConfirm: controller.setTempInsurerGivenDate,
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButtonFormField(
                      borderRadius: BorderRadius.circular(15),
                      isExpanded: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        label: NskText('Кем выдан паспорт'),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          letterSpacing: 1,
                          color: Color.fromRGBO(83, 83, 83, 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(205, 218, 249, 1),
                              width: 2),
                        ),
                      ),
                      icon: const Icon(
                        CupertinoIcons.chevron_down,
                        color: Colors.black,
                      ),
                      value: controller.tempInsurer.value.whoGave,
                      items: <String>['МинЮст РК', 'МВД РК']
                          .map<DropdownMenuItem<String>>(
                            (String? value) => DropdownMenuItem(
                              value: value,
                              child: SizedBox(
                                width: getProportionateScreenWidth(200),
                                child: NskText(
                                  value!,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) {
                        controller.tempInsurer.value.whoGave = value;
                      },
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  NskCheckBox(
                    text:
                        'Подтверждаю, что все данные в анкете-заявления заполнены верно',
                    value: controller.isAgree.value,
                    onChanged: controller.setAgree,
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  NskCustomButton(
                    'Сохранить',
                    isButtonEnabled: true,
                    isEnabledButtonPrimaryColor: false,
                    onTap: () => _validate(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context,
      {String? label,
      String? value,
      bool? boolValue,
      Function(DateTime)? onConfirm}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => DatePicker.showDatePicker(
            context,
            showTitleActions: true,
            minTime: DateTime(1990),
            maxTime: DateTime(2103),
            onConfirm: onConfirm,
            // currentTime: DateTime.now(),
            currentTime: DateTime(2019, 9, 3),
            locale: LocaleType.ru,
          ),
          child: Container(
            width: double.maxFinite,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: boolValue! ? Color(0xffCDDAF9) : Colors.red, width: 2),
              color: AppColors.white,
            ),
            child: NskText(
              value == '' ? label! : value!,
              fontSize: 16,
            ),
          ),
        ),
        Visibility(
          visible: !boolValue,
          child: Padding(
            padding: EdgeInsets.only(left: 24, top: 5),
            child: NskText(
              '*Укажите дату',
              fontSize: 11.5,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  void _validate() {
    if (_formKey.currentState!.validate()) {
      if (controller.tempInsurer.value.birthDate!.text.isNotEmpty) {
        if (controller.isGenderSelected.contains(true)) {
          if (controller.tempInsurer.value.whenGiven!.text.isNotEmpty) {
            index == null
                ? controller.addInsurer(controller.tempInsurer.value)
                : controller.setInsurer(controller.tempInsurer.value, index!);
            controller.clear();
            Get.back(result: true);
          } else {
            controller.setIsGivenDateSelected(false);
          }
        } else {
          controller.setGenderIdentified(false);
        }
      } else {
        controller.setIsBirthDateSelected(false);
      }
    }
  }

  String? _notNull(String? value) {
    if (value!.isEmpty) {
      return '*Необходимо заполнить';
    }
    return null;
  }

  Widget _buildGenderToggle(String gender, int index) => GestureDetector(
        onTap: () => controller.setIsGenderSelected(index),
        child: Container(
          margin: EdgeInsets.only(left: 16),
          width: 100,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: controller.isGenderSelected[index]
                ? AppColors.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: controller.isGenderSelected[index]
                    ? AppColors.primary
                    : AppColors.black),
          ),
          child: NskText(
            gender,
            color: controller.isGenderSelected[index]
                ? AppColors.white
                : AppColors.black,
          ),
        ),
      );
}
