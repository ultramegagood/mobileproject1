import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/tourism/get_full_client_response.dart';
import 'package:mobile_nsk/models/tourism/insured_list_model.dart';
import 'package:mobile_nsk/models/tourism/insurer_model.dart';
import 'package:mobile_nsk/models/tourism/set_full_client_request.dart';
import 'package:mobile_nsk/models/tourism/tourism_model.dart';
import 'package:mobile_nsk/pages/calculators/tourism/screen/add_new_insurer_screen.dart';
import 'package:mobile_nsk/repository/calculator/policy/policy_repository/policy_provider.dart';
import 'package:mobile_nsk/repository/calculator/tourism/tourism_provider.dart';
import 'package:mobile_nsk/repository/calculator/tourism/tourism_repository.dart';
import 'package:simple_moment/simple_moment.dart';

class TourismStepTwoController extends GetxController {
  final TourismRepository _repository = TourismRepository();
  final TextEditingController emailController = TextEditingController();

  var loaderRx = false.obs;
  var isRKResident = false.obs;
  var isInsurerAlso = true.obs;
  var isAgree = false.obs;
  var isGenderSelected = [false, false].obs;
  var isGenderIdentified = true.obs;
  var isBirthDateSelected = true.obs;
  var isGivenDateSelected = true.obs;
  var isEmailEnabled = false.obs;
  var isEmailNotNull = true.obs;
  var isAgreeSelected = true.obs;

  var whoGaveDoc = 'МинЮст РК'.obs;
  var selectedSexId = 0.obs;
  var tempInsurer = Insurer.empty().obs;

  var insurers = RxList<Insurer>([Insurer.empty()]);

  var clientData = Rxn<GetFullClientResponse>();

  void setTempInsurer(int index) => tempInsurer(insurers[index]);
  void setTempInsurerBirthDate(DateTime date) {
    tempInsurer.value.birthDate!.text =
        Moment.parse(date.toString()).format("dd.MM.yyyy");
    tempInsurer.refresh();
  }

  void setTempInsurerGivenDate(DateTime date) {
    tempInsurer.value.whenGiven!.text =
        Moment.parse(date.toString()).format("dd.MM.yyyy");
    tempInsurer.refresh();
  }

  void addInsurer(Insurer insurer) {
    insurer.isBeneficiary = false;
    insurers.length < 6 ? insurers.add(insurer) : null;
    log('Insurer\'s count: ' + insurers.length.toString());
  }

  void setInsurer(Insurer insurer, int index) {
    insurers[index] = insurer;
    insurers.refresh();
  }

  void removeInsurer(int index) {
    insurers.removeAt(index);
    insurers.refresh();
  }

  void clear() {
    setGenderIdentified(true);
    setIsBirthDateSelected(true);
    setIsGivenDateSelected(true);
    for (var i in isGenderSelected) i = false;
    tempInsurer(Insurer.empty());
  }

  void setResident(bool? value) => isRKResident(value);
  void setInsurerAlso(bool? value) async {
    isInsurerAlso(value);
    if (!value! && insurers.length == 1) {
      bool result = await Get.to(() => AddNewInsurerScreen());
      if (!result) {
        isInsurerAlso(true);
      }
    }
  }

  void setAgree(bool? value) {
    if (value!) {
      isAgree(true);
      isAgreeSelected(true);
    } else {
      isAgree(false);
    }
  }

  void setWhoGaveDoc(String? value) => whoGaveDoc(value);
  void setGenderIdentified(bool value) => isGenderIdentified(value);
  void setIsBirthDateSelected(bool value) => isBirthDateSelected(value);
  void setIsGivenDateSelected(bool value) => isGivenDateSelected(value);

  void setIsGenderSelected(int index) {
    for (int buttonIndex = 0;
        buttonIndex < isGenderSelected.length;
        buttonIndex++) {
      if (buttonIndex == index) {
        isGenderSelected[buttonIndex] = true;
        selectedSexId(buttonIndex);
      } else {
        isGenderSelected[buttonIndex] = false;
      }
    }
  }

  void setGender(int index, int pindex) {
    insurers[pindex].sexId = index;
    insurers.refresh();
  }

  void getFullClient(String value) async {
    if (value.length == 12) {
      loaderRx(true);
      final response = await _repository.getFullClient(value);
      response.fold(
        (failure) => Get.snackbar(
            'Ошибка', 'Клиент не найден! Пожалуйста заполните анкету вручную.'),
        (success) {
          clientData(success);
          insurers.first = Insurer.to(success);
          setGender(clientData.value!.sexId!, 0);
          insurers.refresh();
        },
      );
      loaderRx(false);
    }
  }

  void getFullClientInsurer(String value) async {
    if (value.length == 12) {
      loaderRx(true);
      final response = await _repository.getFullClient(value);
      response.fold(
          (failure) => Get.snackbar('Ошибка',
              'Клиент не найден! Пожалуйста заполните анкету вручную.'),
          (success) {
        tempInsurer(Insurer.to(success));
        setIsGenderSelected(success.sexId! - 1);
        tempInsurer.refresh();
      });
      loaderRx(false);
    }
  }

  void setFullClient(var _formKey) async {
    loaderRx(true);
    if (_formKey.currentState!.validate()) {
      if (insurers.first.birthDate!.text.isNotEmpty) {
        setIsBirthDateSelected(true);
        if (insurers.first.sexId != null) {
          if (insurers.first.whenGiven!.text.isNotEmpty) {
            if (isAgree.value) {
              clear();
              insurers.first.isBeneficiary = true;
              for (var i = 0; i < insurers.length; i++) {
                final response = await TourismRepository().setFullClient(
                  SetFullClientRequest.to(insurers[i]),
                );
                response.fold(
                  (l) => Get.snackbar('Ошибка', 'Что-то пошло не так'),
                  (r) {
                    insurers[i].id = r;
                    insurers.refresh();
                  },
                );
              }
              await calculateHealth();
            } else {
              isAgreeSelected(false);
            }
          } else {
            setIsGivenDateSelected(false);
          }
        } else {
          setGenderIdentified(false);
        }
      } else {
        setIsBirthDateSelected(false);
      }
    }
    loaderRx(false);
  }

  Future calculateHealth() async {
    final premium = box.read<int>('premium');
    final model = await box.read<TourismModel>('tourismModel');
    model!.isDataCorrect = true;
    model.premium = premium;
    model.currentStepIndex = 2;
    model.premium = premium;
    model.insuredList = InsuredListModel.toList(insurers);
    model.insuredCount = insurers.length;
    model.insurantTravels = isInsurerAlso.value;
    log('CurrentStepIndex: ' + model.currentStepIndex.toString());
    final result = await TourismProvider().calculateHealth(model);
    if (result == 200) {
      box.write('calculatedTourism', model);
      isEmailEnabled(true);
    } else {
      Get.snackbar('Ошибка', 'Что-то пошло не так');
      isEmailEnabled(false);
    }
  }

  Future writeHealth() async {
    if (emailController.text.isNotEmpty) {
      isEmailNotNull(true);
      loaderRx(true);
      final result = await _repository.writeHealth(emailController.text);
      result.fold(
        (l) => Get.snackbar('Ошибка', l.message!),
        (r) async {
          log('Result ID: ' + r.toString());
          await PolicyProvider().getAgreementInfo(r.toString(), '/payment');
        },
      );
      loaderRx(false);
    } else {
      isEmailNotNull(false);
    }
  }

  final Map<String, String> _alph = {
    'а': 'a',
    'ә': 'a',
    'б': 'b',
    'д': 'd',
    'е': 'e',
    'ф': 'f',
    'г': 'g',
    'ғ': 'g',
    'х': 'h',
    'һ': 'h',
    'і': 'i',
    'и': 'i',
    'й': 'y',
    'ж': 'zh',
    'к': 'k',
    'л': 'l',
    'м': 'm',
    'н': 'n',
    'ң': 'n',
    'о': 'o',
    'ө': 'o',
    'п': 'p',
    'қ': 'k',
    'р': 'r',
    'с': 's',
    'т': 't',
    'ұ': 'u',
    'ү': 'u',
    'в': 'v',
    'ы': 'y',
    'у': 'u',
    'з': 'z',
    'ш': 'sh',
    'ч': 'ch',
    'ц': 'ts',
  };

  nameToLatin(String value, bool isAnotherInsurer) {
    String temp = '';
    for (var i = 0; i < value.length; i++) {
      for (var j = 0; j < _alph.length; j++) {
        if (value[i].toLowerCase() == _alph.keys.toList()[j]) {
          temp = temp + _alph.values.toList()[j];
          if (isAnotherInsurer) {
            tempInsurer.value.nameEng!.text = temp.toUpperCase();
          } else {
            insurers.first.nameEng!.text = temp.toUpperCase();
          }
        }
      }
    }
    insurers.refresh();
  }

  surnameToLatin(String value, bool isAnotherInsurer) {
    String temp = '';
    for (var i = 0; i < value.length; i++) {
      for (var j = 0; j < _alph.length; j++) {
        if (value[i].toLowerCase() == _alph.keys.toList()[j]) {
          temp = temp + _alph.values.toList()[j];
          if (isAnotherInsurer) {
            tempInsurer.value.surnameEng!.text = temp.toUpperCase();
          } else {
            insurers.first.surnameEng!.text = temp.toUpperCase();
          }
        }
      }
    }
    insurers.refresh();
  }
}
