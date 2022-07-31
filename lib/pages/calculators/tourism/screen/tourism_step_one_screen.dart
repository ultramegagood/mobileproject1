import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mobile_nsk/core/tourism/tourism_controller.dart';
import 'package:mobile_nsk/pages/widgets/loading_view.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_calendar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_dropdown.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:url_launcher/url_launcher.dart';

class TourismStepOneScreen extends GetView<TourismController> {
  TourismStepOneScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(TourismController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      appBar: const NskAppBar(
        label: "Оформление \"Туризм\"",
        underLabel: 'шаг 1 из 3',
        isUnderText: true,
      ),
      body: Obx(
        () => LoadingOverlay(
          progressIndicator: LoadingView(),
          isLoading: controller.loaderRx.value,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  const NskTitle(
                    title: 'Данные полиса',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  SizedBox(height: getProportionateScreenHeight(12)),
                  NskDropDown(
                    items: ['Однократная поездка', 'Многократная поездка'],
                    value: controller.selectedType.value,
                    onChanged: controller.setType,
                    label: 'Тип поездки',
                  ),
                  Visibility(
                    visible: !controller.isSingle.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const NskTitle(
                          title: 'Программа',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        SizedBox(height: getProportionateScreenHeight(12)),
                        GestureDetector(
                          onTap: () => controller.bottomSheet(context),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            height: getProportionateScreenHeight(50),
                            padding: EdgeInsets.symmetric(
                              // vertical: getProportionateScreenHeight(12),
                              horizontal: getProportionateScreenWidth(16),
                            ),
                            alignment: Alignment.centerLeft,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: const Color.fromRGBO(205, 218, 249, 1),
                                width: 2,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: NskText(
                                    controller.programId.value == null
                                        ? 'Выберите программу'
                                        : controller
                                            .programId.value!.values.first.first
                                            .toString(),
                                    fontSize: 16,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                const Icon(
                                  CupertinoIcons.chevron_down,
                                  color: AppColors.black,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const NskTitle(
                    title: 'Данные поездки',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  NskDatePicker(
                    start: controller.startDate.value == ''
                        ? 'Выезд'
                        : controller.startDate.value,
                    end: controller.endDate.value == ''
                        ? 'Приезд'
                        : controller.endDate.value,
                    onStartTap: () => DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime.now().add(Duration(days: 1)),
                      maxTime: DateTime(2103),
                      currentTime: DateTime.now().add(Duration(days: 1)),
                      onConfirm: (date) => controller.setStartDate(
                          Moment.parse(date.toString()).format("yyyy.MM.dd")),
                      locale: LocaleType.ru,
                    ),
                    interval: controller.interval.value,
                    onEndTap: () => controller.isSingle.value
                        ? DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.parse(controller.startDate.value
                                .replaceAll('.', '-')),
                            maxTime: DateTime(2103),
                            onConfirm: (date) => controller.setEndDate(
                                Moment.parse(date.toString())
                                    .format("yyyy.MM.dd")),
                            currentTime: DateTime.now().add(Duration(days: 1)),
                            locale: LocaleType.ru,
                          )
                        : null,
                  ),
                  ...List.generate(
                    controller.selectedCountries.length == 0
                        ? 1
                        : controller.selectedCountries.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        right: controller.isCountrySelected.value ? 16 : 0,
                        top: getProportionateScreenHeight(18),
                      ),
                      child: controller.countries.value.countries == null
                          ? SizedBox()
                          : Row(
                              children: [
                                Expanded(
                                  child: NskDropDown(
                                    items: controller.countries.value.countries!
                                        .map((e) => e.name)
                                        .toList(),
                                    value:
                                        controller.selectedCountries.length == 0
                                            ? null
                                            : controller
                                                .selectedCountries[index].name,
                                    onChanged: (value) =>
                                        controller.setCountry(value!, index),
                                    label: 'Куда отправляетесь',
                                    hint: 'Выберите страну или регион',
                                  ),
                                ),
                                Visibility(
                                  visible: controller.isCountrySelected.value,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(188),
                                    //////
                                    onTap: () => index == 0
                                        ? controller.addNewCountry()
                                        : controller.removeCountry(index),
                                    /////
                                    child: Container(
                                      width: getProportionateScreenWidth(50),
                                      height: getProportionateScreenWidth(50),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                205, 218, 249, 1),
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(188),
                                      ),
                                      child: Icon(
                                        index == 0
                                            ? Icons.add
                                            : CupertinoIcons.xmark,
                                        color: index == 0
                                            ? AppColors.primary
                                            : Colors.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  const NskTitle(
                    title: 'Даты рождения участников',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  ...List.generate(
                    controller.selectedBirthDates.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        right: controller.isBirthDateSelected.value ? 16 : 0,
                        top: getProportionateScreenHeight(18),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15),
                              onTap: () => DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                minTime: DateTime(1990),
                                maxTime: DateTime(2103),
                                onConfirm: (date) => controller.setBirthDate(
                                    Moment.parse(date.toString())
                                        .format("dd.MM.yyyy"),
                                    index),
                                currentTime: DateTime.now(),
                                locale: LocaleType.ru,
                              ),
                              child: Container(
                                height: getProportionateScreenWidth(50),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xffCDDAF9), width: 2),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    NskText(
                                      controller
                                              .selectedBirthDates[index].isEmpty
                                          ? 'Выберите дату'
                                          : controller
                                              .selectedBirthDates[index],
                                      fontSize: 16,
                                    ),
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: controller.isBirthDateSelected.value,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(188),
                              onTap: () => index == 0
                                  ? controller.addNewBirthDate()
                                  : controller.removeBirthDate(index),
                              child: Container(
                                width: getProportionateScreenWidth(50),
                                height: getProportionateScreenWidth(50),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          205, 218, 249, 1),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(188),
                                ),
                                child: Icon(
                                  index == 0 ? Icons.add : CupertinoIcons.xmark,
                                  color: index == 0
                                      ? AppColors.primary
                                      : Colors.red,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const NskTitle(
                    title: 'Цель поездки',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  SizedBox(height: getProportionateScreenHeight(12)),
                  controller.purposes.value.purposes == null
                      ? SizedBox()
                      : NskDropDown(
                          items: controller.purposes.value.purposes!
                              .map((e) => e.name)
                              .toList(),
                          value: controller.selectedGoal.value,
                          onChanged: controller.setGoal,
                          label: 'Цель поездки',
                          hint: 'Выберите цель поездки',
                        ),
                  Visibility(
                    visible: controller.isSport.value,
                    child: Column(
                      children: [
                        SizedBox(height: getProportionateScreenHeight(18)),
                        controller.sportCategories.value.purposes == null
                            ? SizedBox()
                            : NskDropDown(
                                items: controller
                                    .sportCategories.value.purposes!
                                    .map((e) => e.name)
                                    .toList(),
                                value: controller.selectedSportCategory.value ??
                                    '',
                                onChanged: controller.setSportCategory,
                                label: 'Категория',
                              ),
                        SizedBox(height: getProportionateScreenHeight(18)),
                        controller.sportTypes.value.purposes == null
                            ? SizedBox()
                            : NskDropDown(
                                items: controller.sportTypes.value.purposes!
                                    .map((e) => e.name)
                                    .toList(),
                                value: controller.selectedSportType.value ?? '',
                                onChanged: controller.setSportType,
                                label: 'Вид спорта',
                              ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.isSingle.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const NskTitle(
                          title: 'Дополнительный риск COVID',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        SizedBox(height: getProportionateScreenHeight(12)),
                        GestureDetector(
                          onTap: () => controller.setInsurance(),
                          child: Container(
                            color: Colors.transparent,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const NskText(
                                  'Включить страховку',
                                  fontSize: 16,
                                ),
                                CupertinoSwitch(
                                  value: controller.insuranceIncluded.value,
                                  onChanged: (_) => controller.setInsurance(),
                                  trackColor: const Color(0xff9E9E9E),
                                  activeColor: AppColors.primary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(12)),
                  Visibility(
                    visible: controller.insuranceIncluded.value,
                    child: NskDropDown(
                      items: _covids,
                      value: controller.selectedCovid.value,
                      onChanged: controller.setCovid,
                    ),
                  ),
                  const NskTitle(
                    title: 'Данные страхования',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: NskText('Курс EUR - 486,56', fontSize: 12),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(4)),
                      controller.insuranceAmounts.value == null
                          ? SizedBox()
                          : NskDropDown(
                              items: controller.insuranceAmounts.value!.amounts!
                                  .map((e) => "${e.euro}€ - ${e.tenge}₸")
                                  .toList(),
                              value:
                                  "${controller.selectedInsuranceSum.value!.euro}€ - ${controller.selectedInsuranceSum.value!.tenge}₸",
                              onChanged: controller.setCourse,
                              label: 'Сумма страхования',
                            ),
                      SizedBox(height: getProportionateScreenHeight(16)),
                      controller.franchises.value.purposes == null
                          ? SizedBox()
                          : NskDropDown(
                              items: controller.franchises.value.purposes!
                                  .map((e) => e.name)
                                  .toList(),
                              value: controller.selectedPhranchise.value,
                              onChanged: controller.setPhranchise,
                              label: 'Франшиза',
                            ),
                    ],
                  ),
                  const NskTitle(
                    title: 'Город',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  SizedBox(height: getProportionateScreenHeight(16)),
                  NskDropDown(
                    items: controller.getCities,
                    value: controller.selectedCity.value,
                    onChanged: controller.setSelectedCity,
                    label: 'Выберите город проживания страхователя',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(15),
                      horizontal: getProportionateScreenWidth(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        controller.selectedBirthDates.isEmpty
                            ? SizedBox()
                            : controller.selectedBirthDates.first.isEmpty ||
                                    controller.startDate.isEmpty ||
                                    controller.endDate.isEmpty
                                ? const SizedBox()
                                : Container(
                                    height: getProportionateScreenHeight(42),
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            getProportionateScreenWidth(16),
                                        vertical:
                                            getProportionateScreenHeight(12)),
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.primary,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        NskText(
                                          'Итоговая сумма:',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                        NskText(
                                          controller.selectedFranchiseAmount
                                                  .value +
                                              ' ₸',
                                          fontSize: 16,
                                          color: AppColors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        GestureDetector(
                          onTap: () =>
                              controller.setIsAgree(!controller.isAgree.value),
                          child: Row(
                            children: [
                              Checkbox(
                                value: controller.isAgree.value,
                                onChanged: controller.setIsAgree,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                    children: [
                                      _buildText('Соглашаюсь с '),
                                      _buildText(
                                          'Условиями пользовательского соглашения',
                                          onTap: () => log(
                                              'Tapped: Условиями пользовательского соглашения'),
                                          color: AppColors.primary),
                                      _buildText(
                                          ' и подтверждаю, что ознакомлены и согласны с правилами страхования "Страхование путешественников" старая редакция - '),
                                      _buildText('(KAZ) ',
                                          onTap: () => launchUrl(Uri.parse(
                                              "https://www.nsk.kz/media/rules/Правила добровольного страхования Выезжающих за рубеж KAZ_1625294345.pdf")),
                                          color: AppColors.primary),
                                      _buildText('(RUS) ',
                                          onTap: () => launchUrl(Uri.parse(
                                              "https://www.nsk.kz/media/rules/Правила добровольного страхования Выезжающих за рубеж RUS_1631850631.pdf")),
                                          color: AppColors.primary),
                                      _buildText('(ENG)',
                                          onTap: () => launchUrl(Uri.parse(
                                              "https://www.nsk.kz/media/rules/Правила добровольного страхования Выезжающих за рубеж ENG_1631850675.pdf")),
                                          color: AppColors.primary),
                                      _buildText(' '),
                                    ],
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(16),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () => controller.startDate.value.isEmpty ||
                                  controller.endDate.value.isEmpty ||
                                  controller.selectedBirthDates.first.isEmpty
                              ? null
                              : !controller.isSingle.value &&
                                      controller.programId.value == null
                                  ? null
                                  : controller.calculate(),
                          // : Get.toNamed('/tourism/step3'),
                          child: Container(
                            alignment: Alignment.center,
                            height: getProportionateScreenHeight(48),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: controller.selectedBirthDates.isEmpty
                                        ? Colors.transparent
                                        : controller.startDate.value.isEmpty ||
                                                controller
                                                    .endDate.value.isEmpty ||
                                                controller.selectedBirthDates
                                                    .first.isEmpty ||
                                                !controller.isAgree.value
                                            ? Colors.grey
                                            : !controller.isSingle.value &&
                                                    controller
                                                            .programId.value ==
                                                        null &&
                                                    !controller.isAgree.value
                                                ? Colors.grey
                                                : AppColors.primary),
                                color: AppColors.white),
                            child: NskText(
                              'Далее',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: controller.selectedBirthDates.isEmpty
                                  ? Colors.transparent
                                  : controller.startDate.value.isEmpty ||
                                          controller.endDate.value.isEmpty ||
                                          controller.selectedBirthDates.first
                                              .isEmpty ||
                                          !controller.isAgree.value
                                      ? Colors.grey
                                      : !controller.isSingle.value &&
                                              controller.programId.value ==
                                                  null &&
                                              !controller.isAgree.value
                                          ? Colors.grey
                                          : AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan _buildText(String text,
      {Function()? onTap, Color color = AppColors.black}) {
    return TextSpan(
      text: text,
      recognizer: TapGestureRecognizer()..onTap = onTap ?? null,
      style: TextStyle(
        color: color,
      ),
    );
  }

  final List<String> _covids = [
    '1 000 €',
    '3 000 €',
  ];
}
