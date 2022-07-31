import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_nsk/core/tourism/tourism_step2_controller.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/pages/calculators/tourism/screen/add_new_insurer_screen.dart';
import 'package:mobile_nsk/pages/widgets/checkbox.dart';
import 'package:mobile_nsk/pages/widgets/loading_view.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/pages/widgets/nsk_custom_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:simple_moment/simple_moment.dart';

class TourismStepTwoScreen extends GetView<TourismStepTwoController> {
  TourismStepTwoScreen({Key? key}) : super(key: key);

  final controller = Get.put(TourismStepTwoController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.defaultBackground,
          appBar: NskAppBar(
            label: 'Оформление “Туризм”',
            isUnderText: true,
            underLabel: 'шаг 2 из 3',
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: getProportionateScreenHeight(8),
                            ),
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                  text: 'Страхователь',
                                  style: TextStyle(
                                    color: Color(0xff373737),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '     (тот кто оплачивает полюс)',
                                  style: TextStyle(
                                    color: Color(0xff373737),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                )
                              ]),
                            )),
                        NskCheckBox(
                          text: 'Резидент РК',
                          value: controller.isRKResident.value,
                          onChanged: controller.setResident,
                          isTristate: true,
                        ),
                        NskCheckBox(
                          text: 'Страхователь тоже едет',
                          value: controller.isInsurerAlso.value,
                          onChanged: controller.setInsurerAlso,
                        ),
                        NskTitle(
                          title: 'Данные пользователя',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        NskTextField(
                          label: 'ИИН*',
                          controller: controller.insurers.first.iin!,
                          fillColor: AppColors.white,
                          validator: _notNull,
                          inputFormatters: [
                            MaskTextInputFormatter(mask: '############')
                          ],
                          onChanged: controller.getFullClient,
                        ),
                        NskTextField(
                          label: 'Фамилия*',
                          fillColor: AppColors.white,
                          controller: controller.insurers.first.surname!,
                          validator: _notNull,
                          onChanged: (value) =>
                              controller.surnameToLatin(value, false),
                          isUppercase: true,
                        ),
                        NskTextField(
                          label: 'Имя*',
                          fillColor: AppColors.white,
                          controller: controller.insurers.first.name!,
                          validator: _notNull,
                          isUppercase: true,
                          onChanged: (value) =>
                              controller.nameToLatin(value, false),
                        ),
                        NskTextField(
                          label: 'Отчество',
                          fillColor: AppColors.white,
                          controller: controller.insurers.first.dadsName!,
                        ),
                        NskTextField(
                          label: 'Фамилия на латинице*',
                          fillColor: AppColors.white,
                          controller: controller.insurers.first.surnameEng!,
                          validator: _notNull,
                          isUppercase: true,
                        ),
                        NskTextField(
                          label: 'Имя на латинице*',
                          fillColor: AppColors.white,
                          controller: controller.insurers.first.nameEng!,
                          validator: _notNull,
                          isUppercase: true,
                        ),
                        SizedBox(height: 24),
                        _buildDatePicker(
                          context,
                          label: 'Дата рождения*',
                          value: controller.insurers.first.birthDate!.text,
                          boolValue: controller.isBirthDateSelected.value,
                          onConfirm: (date) {
                            controller.insurers.first.birthDate!.text =
                                Moment.parse(date.toString())
                                    .format("dd.MM.yyyy");
                            controller.insurers.refresh();
                          },
                        ),
                        SizedBox(height: 24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildGenderToggle('Мужчина', 1, 0),
                            _buildGenderToggle('Женщина', 2, 0),
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
                          label: 'Телефон*',
                          fillColor: AppColors.white,
                          controller: controller.insurers.first.phone!,
                          validator: _notNull,
                          inputFormatters: [
                            MaskTextInputFormatter(mask: '+7(###)###-##-##')
                          ],
                        ),
                        NskTextField(
                          label: 'Адрес*',
                          fillColor: AppColors.white,
                          controller: controller.insurers.first.address!,
                          validator: _notNull,
                        ),
                        NskTitle(
                          title: 'Данные документа',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        NskTextField(
                          label: 'Номер паспорта*',
                          fillColor: AppColors.white,
                          controller: controller.insurers.first.docnum!,
                          validator: _notNull,
                        ),
                        SizedBox(height: 24),
                        _buildDatePicker(
                          context,
                          label: 'Дата выдачи паспорта*',
                          value: controller.insurers.first.whenGiven!.text,
                          boolValue: controller.isGivenDateSelected.value,
                          // onConfirm: (date) => controller.setGivenDate(
                          //   Moment.parse(date.toString()).format("dd.MM.yyyy"),
                          // ),
                          onConfirm: (date) {
                            controller.insurers.first.whenGiven!.text =
                                Moment.parse(date.toString())
                                    .format("dd.MM.yyyy");
                            controller.insurers.refresh();
                          },
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
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
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
                            value: controller.insurers.first.whoGave,
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
                              controller.insurers.first.whoGave = value;
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.insurers.length < 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NskTitle(
                                title: 'Застрахованные',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                              SizedBox(height: 24),
                              GestureDetector(
                                onTap: () {
                                  controller.clear();
                                  Get.to(() => AddNewInsurerScreen());
                                },
                                child: Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 16),
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border:
                                        Border.all(color: Color(0xffCDDAF9)),
                                    color: AppColors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      NskText(
                                        'Добавить застрахованного',
                                        fontSize: 16,
                                      ),
                                      Icon(
                                        Icons.add,
                                        color: AppColors.primary,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 16),
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.insurers.length - 1,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 16),
                                itemBuilder: (_, index) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.setTempInsurer(index + 1);
                                        Get.to(
                                          () => AddNewInsurerScreen(
                                            index: index + 1,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Color(0xffCDDAF9)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            NskText(
                                              'Застрахованный',
                                              fontSize: 16,
                                            ),
                                            Icon(
                                              CupertinoIcons.forward,
                                              color: AppColors.black,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          controller.removeInsurer(index + 1),
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(188),
                                          color: AppColors.white,
                                          border: Border.all(
                                              color: Color(0xffCDDAF9)),
                                        ),
                                        child: Icon(
                                          CupertinoIcons.xmark,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        NskCheckBox(
                          text:
                              'Подтверждаю, что все данные в анкете-заявления заполнены верно',
                          value: controller.isAgree.value,
                          onChanged: controller.setAgree,
                          textColor: controller.isAgreeSelected.value
                              ? AppColors.black
                              : Colors.red,
                        ),
                        Visibility(
                          visible: controller.isEmailEnabled.value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NskTitle(
                                title: 'Отправить уведомление',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              NskTextField(
                                label: 'E-mail*',
                                controller: controller.emailController,
                                fillColor: AppColors.white,
                              ),
                              Visibility(
                                visible: !controller.isEmailNotNull.value,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: NskText(
                                    'Заполните поле',
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.primary,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    NskText(
                                      'Итоговая сумма:',
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                    NskText(
                                      "${box.read('premium')}₸",
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        NskCustomButton(
                          controller.isEmailEnabled.value
                              ? 'Оплатить'
                              : 'Купить полис',
                          isButtonEnabled: true,
                          onTap: () => controller.isEmailEnabled.value
                              ? controller.writeHealth()
                              : controller.setFullClient(_formKey),
                        ),
                        SizedBox(height: getProportionateScreenHeight(20)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _notNull(String? value) {
    if (value!.isEmpty) {
      return '*Необходимо заполнить';
    }
    return null;
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

  Widget _buildGenderToggle(String gender, int index, int pindex) =>
      GestureDetector(
        onTap: () => controller.setGender(index, pindex),
        child: Container(
          margin: EdgeInsets.only(left: 16),
          width: 100,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: controller.insurers[pindex].sexId == index
                ? AppColors.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: controller.insurers[pindex].sexId == index
                    ? AppColors.primary
                    : AppColors.black),
          ),
          child: NskText(
            gender,
            color: controller.insurers[pindex].sexId == index
                ? AppColors.white
                : AppColors.black,
          ),
        ),
      );
}
