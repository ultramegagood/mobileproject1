import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/tourism/country.dart';
import 'package:mobile_nsk/models/tourism/country_insurance_amounts.dart';
import 'package:mobile_nsk/models/tourism/franchise.dart';
import 'package:mobile_nsk/models/tourism/insured_list_model.dart';
import 'package:mobile_nsk/models/tourism/program.dart';
import 'package:mobile_nsk/models/tourism/purpose.dart';
import 'package:mobile_nsk/models/tourism/tourism_model.dart';
import 'package:mobile_nsk/pages/calculators/tourism/widgetsTourism/insurance_program_bottom_sheet.dart';
import 'package:mobile_nsk/repository/calculator/tourism/tourism_provider.dart';

class TourismController extends GetxController {
  @override
  void onInit() async {
    loaderRx(true);
    await TourismProvider().getInsuranceRecources();
    await getData();
    loaderRx(false);
    super.onInit();
  }

  var loaderRx = RxBool(false);

  var countries = Country().obs;
  var purposes = Purpose().obs;
  var franchises = Purpose().obs;
  var sportCategories = Purpose().obs;
  var sportTypes = Purpose().obs;
  var programs = Programs().obs;

  var selectedCountries = <Countires>[].obs;
  var selectedBirthDates = <String>[].obs;

  final programId = Rxn<Map<int, List<Object>>>();
  final insuranceAmounts = Rxn<CountryInsuranceAmounts>();
  final franchiseAmounts = Rxn<FranchisesResponse>();

  var selectedType = 'Однократная поездка'.obs;
  var selectedGoal = Rxn<String>();
  var selectedInsuranceSum = Rxn<Amounts>();
  var selectedPhranchise = ''.obs;
  var selectedCovid = '1 000 €'.obs;
  var selectedSportCategory = Rxn<String>();
  var selectedSportType = Rxn<String>();
  var selectedFranchiseAmount = ''.obs;
  var priorRegionId = Rxn<Countires>();
  var selectedCity = cities[1].obs;

  var startDate = ''.obs;
  var endDate = ''.obs;
  var interval = Rxn<int>();

  var insuranceIncluded = false.obs;
  var isSingle = true.obs;
  var isSport = false.obs;
  var isAgree = false.obs;
  var isCountrySelected = false.obs;
  var isGoalSelected = false.obs;
  var isBirthDateSelected = false.obs;

  var temp = Rxn<Purposes>();

  Future getData() async {
    setStartDate(
        DateFormat('yyyy.MM.dd').format(DateTime.now().add(Duration(days: 1))));
    setEndDate(
        DateFormat('yyyy.MM.dd').format(DateTime.now().add(Duration(days: 2))));
    await countries(Country.fromJson({
      'data': json.decode(await box.read('countries')),
    }));
    // addNewCountry();
    // await getInsuranceAmounts(selectedCountries.value!.first.regionId!);
    purposes(await Purpose.fromJson({
      'data': json.decode(box.read('purpose')),
    }));
    // selectedGoal(purposes.value.purposes!.first.name);
    addNewBirthDate();
    franchises(Purpose.fromJson({
      'data': json.decode(box.read('franchises')),
    }));
    selectedPhranchise(franchises.value.purposes!.first.name);
    sportCategories(Purpose.fromJson({
      'data': json.decode(box.read('sport_categories')),
    }));
    sportTypes(Purpose.fromJson({
      'data': json.decode(box.read('sportTypes')),
    }));
    programs(Programs.fromJson({
      "data": json.decode(box.read('programs')),
    }));
    // await getInsuranceAmounts(selectedCountries.first.regionId!);
  }

  getInsuranceAmounts(int regionId) async {
    loaderRx(true);
    insuranceAmounts(await TourismProvider().getInsuranceAmounts(regionId));
    setInsuranceSum(insuranceAmounts.value!.amounts!.first);
    loaderRx(false);
  }

  void setType(String? value) {
    selectedType(value);
    startDate('');
    endDate('');
    interval(0);
    insuranceIncluded(false);
    selectedType.value == 'Однократная поездка'
        ? isSingle(true)
        : isSingle(false);
    if (!isSingle.value) {
      temp(franchises.value.purposes!.last);
      franchises.value.purposes!.removeLast();
      startDate(DateFormat('yyyy.MM.dd')
          .format(DateTime.now().add(Duration(days: 1))));
    } else {
      franchises.value.purposes!.add(temp.value!);
    }
  }

  void setCountry(String value, int index) async {
    for (var i in countries.value.countries!) {
      if (i.name == value) {
        selectedCountries.length == 0
            ? selectedCountries.add(i)
            : selectedCountries[index] = i;
        selectedCountries.refresh();
        isCountrySelected(true);
      }
    }
    priorRegionId(selectedCountries
        .reduce((curr, next) => curr.regionId! > next.regionId! ? curr : next));
    await getInsuranceAmounts(priorRegionId.value!.regionId!);
    isAllDataFull() ? getFranchiseAmount() : null;
  }

  void setGoal(String? value) {
    selectedGoal(value);
    isGoalSelected(true);
    if (value == 'Спорт / Sports') {
      selectedSportCategory(sportCategories.value.purposes!.first.name);
      selectedSportType(sportTypes.value.purposes!.first.name);
      isSport(true);
    } else {
      isSport(false);
    }
    isAllDataFull() ? getFranchiseAmount() : null;
  }

  void setBirthDate(String? value, int index) {
    selectedBirthDates[index] = value!;
    isBirthDateSelected(true);
    isAllDataFull() ? getFranchiseAmount() : null;
  }

  bool isAllDataFull() {
    if (isCountrySelected.value &&
        isGoalSelected.value &&
        isBirthDateSelected.value) {
      return true;
    } else {
      return false;
    }
  }

  void setInsuranceSum(Amounts amounts) {
    selectedInsuranceSum(amounts);
    isAllDataFull() ? getFranchiseAmount() : null;
  }

  void setSportCategory(String? value) => selectedSportCategory(value);
  void setSportType(String? value) => selectedSportType(value);
  void setInsurance() {
    insuranceIncluded(!insuranceIncluded.value);
    isAllDataFull() ? getFranchiseAmount() : null;
  }

  void setCourse(String? value) {
    final tenge = value!.split(' ').last.split('');
    tenge.removeLast();
    for (var i in insuranceAmounts.value!.amounts!) {
      if (i.tenge.toString() == tenge.join()) {
        setInsuranceSum(i);
      }
    }
  }

  void setPhranchise(String? value) {
    selectedPhranchise(value);
    if (isAllDataFull()) {
      if (value!.contains('Classic')) {
        selectedFranchiseAmount(
            franchiseAmounts.value!.franchises!.first.premium.toString());
      } else if (value.contains('STANDARD')) {
        selectedFranchiseAmount(
            franchiseAmounts.value!.franchises![1].premium.toString());
      } else {
        selectedFranchiseAmount(
            franchiseAmounts.value!.franchises!.last.premium.toString());
      }
    }
  }

  void setCovid(String? value) {
    selectedCovid(value);
    isAllDataFull() ? getFranchiseAmount() : null;
  }

  void setStartDate(String value) {
    startDate(value);
    if (!isSingle.value) {
      final s = DateTime.parse(startDate.value.replaceAll('.', '-'))
          .add(Duration(days: interval.value!));
      setEndDate(DateFormat('yyyy.MM.dd').format(s));
    }
    setInterval();
    isAllDataFull() ? getFranchiseAmount() : null;
  }

  void setEndDate(String value) {
    endDate(value);
    setInterval();
    isAllDataFull() ? getFranchiseAmount() : null;
  }

  void setInterval() {
    if (startDate.value != '' && endDate.value != '') {
      final s = DateTime.parse(endDate.value.replaceAll('.', '-'))
          .difference(DateTime.parse(startDate.value.replaceAll('.', '-')))
          .inDays;
      log('Interval: ' + s.toString());
      if (s < 0) {
        endDate(DateFormat('yyyy.MM.dd').format(
            DateTime.parse(startDate.value.replaceAll('.', '-'))
                .add(Duration(days: 1))));
        interval(DateTime.parse(endDate.value.replaceAll('.', '-'))
                .difference(
                    DateTime.parse(startDate.value.replaceAll('.', '-')))
                .inDays
                .abs() +
            1);
      } else {
        interval(s.abs() + 1);
      }
    }
  }

  void setIsAgree(bool? value) => isAgree(value);

  void setSelectedCity(String? value) => selectedCity(value);

  void addNewCountry() {
    if (selectedCountries.length < 3) {
      selectedCountries.add(Countires(
        id: countries.value.countries!.first.id!,
        name: countries.value.countries!.first.name,
        regionId: countries.value.countries!.first.regionId,
      ));
    }
  }

  void removeCountry(int index) {
    selectedCountries.removeAt(index);
    priorRegionId(selectedCountries
        .reduce((curr, next) => curr.regionId! > next.regionId! ? curr : next));
    getInsuranceAmounts(priorRegionId.value!.regionId!);
  }

  void addNewBirthDate() {
    if (selectedBirthDates.length < 3) {
      selectedBirthDates.add('');
    }
  }

  void removeBirthDate(int index) {
    selectedBirthDates.removeAt(index);
    getFranchiseAmount();
  }

  getFranchiseAmount() async {
    if (startDate.value != '' &&
        endDate.value != '' &&
        selectedBirthDates.isNotEmpty) {
      loaderRx(true);
      franchiseAmounts(
          await TourismProvider().calculateHealthFranchise(model()));
      selectedFranchiseAmount(
          franchiseAmounts.value!.franchises!.first.premium.toString());
      loaderRx(false);
    }
  }

  void bottomSheet(BuildContext context) async {
    programId(
      await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) => InsuranceProgramBottomSheet(
          programs: programs,
        ),
      ),
    );
    final end = DateFormat('yyyy.MM.dd').format(DateTime.now().add(Duration(
        days: int.parse(programId.value!.values.first[1].toString()))));
    setEndDate(end);
  }

  void calculate() async {
    loaderRx(true);
    final status = await TourismProvider().calculateHealth(model());
    if (status == 200) {
      Get.toNamed('/tourism/step2');
    } else {
      Get.snackbar('Ошибка', 'Что то пошло не так');
    }
    loaderRx(false);
  }

  TourismModel model() {
    int? _goalId = findId(selectedGoal.value!, purposes.value.purposes);
    int? _franchiseId =
        findId(selectedPhranchise.value, franchises.value.purposes);
    int? _sportCategoryId = selectedSportCategory.value == null
        ? null
        : findId(selectedSportCategory.value!, sportCategories.value.purposes);
    int? _sportId = selectedSportType.value == null
        ? null
        : findId(selectedSportType.value!, sportTypes.value.purposes);

    final List<int> _countryIds = [];
    for (var i in selectedCountries) {
      log(i.id.toString());
      _countryIds.add(i.id!);
    }
    final List<String> _birthDates = [];
    for (var i in selectedBirthDates) {
      _birthDates.add(i);
    }
    final _validFrom = DateFormat('dd.MM.yyyy')
        .format(DateTime.parse(startDate.value.replaceAll('.', '-')));
    final _validTill = DateFormat('dd.MM.yyyy')
        .format(DateTime.parse(endDate.value.replaceAll('.', '-')));
    String? _covidLimit;
    if (insuranceIncluded.value) {
      if (selectedCovid.value.contains('1 000')) {
        _covidLimit = 'OneThousand';
      } else {
        _covidLimit = 'ThreeThousand';
      }
    } else {
      _covidLimit = 'OneThousand';
    }

    final priorRegion = selectedCountries
        .reduce((curr, next) => curr.regionId! > next.regionId! ? curr : next);
    box.write(
      'tourismModel',
      TourismModel(
        validFrom: _validFrom,
        validTill: _validTill,
        countriesIds: _countryIds,
        regionId: priorRegion.regionId,
        city: selectedCity.value,
        insuranceAmount: selectedInsuranceSum.value!.tenge,
        insuranceAmountId: selectedInsuranceSum.value!.id,
        promoCode: '',
        multitripProgrammeId:
            programId.value == null ? null : programId.value!.keys.first,
        franchiseId: _franchiseId,
        purposeId: _goalId,
        sportCategoryId: _sportCategoryId,
        sportId: _sportId,
        isMultitrip: !isSingle.value,
        clientsBirthDate: _birthDates,
        insuredCount: selectedBirthDates.length,
        ageGroupId: 3005,
        isCovid: insuranceIncluded.value,
        covidLimit: _covidLimit,
        isAgree: isAgree.value,
        insurantTravels: true,
        isDataCorrect: false,
        premium: 0,
        discountedPremium: 0,
        currentStepIndex: 0,
        error: null,
        email: null,
      ),
    );

    return TourismModel(
      validFrom: _validFrom,
      validTill: _validTill,
      countriesIds: _countryIds,
      regionId: priorRegion.regionId,
      city: selectedCity.value,
      insuranceAmount: selectedInsuranceSum.value!.tenge,
      insuranceAmountId: selectedInsuranceSum.value!.id,
      promoCode: '',
      multitripProgrammeId:
          programId.value == null ? null : programId.value!.keys.first,
      franchiseId: _franchiseId,
      purposeId: _goalId,
      insuredList: [
        InsuredListModel(
          id: 0,
          isResident: 1,
          iin: '',
          firstName: '',
          lastName: '',
          middleName: '',
          birthDate: null,
          phone: '',
          sportCategoryId: _sportCategoryId ?? 0,
          sportId: _sportId ?? 0,
          address: '',
          isBeneficiary: true,
          sexId: 1,
          firstNameEng: '',
          lastNameEng: '',
          documentNumber: '',
          documentGivenBy: 'МинЮст РК',
          documentIssueDate: null,
          documentTypeId: 2,
          documentPassport: null,
          isic: true,
          isicPhoto: null,
          error: '',
          isIndividual: 1,
          countryId: _countryIds.first,
        ),
      ],
      sportCategoryId: _sportCategoryId,
      sportId: _sportId,
      isMultitrip: !isSingle.value,
      clientsBirthDate: _birthDates,
      insuredCount: selectedBirthDates.length,
      ageGroupId: 3005,
      isCovid: insuranceIncluded.value,
      covidLimit: _covidLimit,
      isAgree: isAgree.value,
      insurantTravels: true,
      isDataCorrect: false,
      premium: 0,
      discountedPremium: 0,
      currentStepIndex: 0,
      error: null,
    );
  }

  int? findId(String? name, var list) {
    for (var i in list ?? []) {
      if (name == i.name) {
        return i.id!;
      }
    }
  }

  static List<String> cities = [
    "Другое",
    "Алматы",
    "Нур-Султан",
    "Аксай",
    "Аксукент",
    "Актау",
    "Актобе",
    "Атбасар",
    "Атырау",
    "Аягоз",
    "Балхаш",
    "Державинск",
    "Жезказган",
    "Житикара",
    "Капчагай",
    "Караганда",
    "Кокшетау",
    "Костанай",
    "Кульсары",
    "Кызылорда",
    "Лисаковск",
    "Павлодар",
    "Петропавловск",
    "Рудный",
    "Сарань",
    "Сатпаев",
    "Семей",
    "Степногорск",
    "Талдыкорган",
    "Тараз",
    "Темиртау",
    "Туркестан",
    "Уральск",
    "Усть-Каменогорск",
    "Шахтинск",
    "Шымкент",
    "Щучинск",
    "Экибастуз"
  ];

  List<String> get getCities => cities;
}
