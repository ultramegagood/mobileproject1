import 'package:mobile_nsk/models/tourism/insured_list_model.dart';

class TourismModel {
  String? validFrom;
  String? validTill;
  List<int>? countriesIds;
  int? regionId;
  String? city;
  int? insuranceAmount;
  int? insuranceAmountId;
  String? promoCode;
  int? multitripProgrammeId;
  int? franchiseId;
  int? purposeId;
  List<InsuredListModel>? insuredList;
  int? sportCategoryId;
  int? sportId;
  bool? isMultitrip;
  List<String>? clientsBirthDate;
  int? insuredCount;
  int? ageGroupId;
  bool? isCovid;
  String? covidLimit;
  bool? isAgree;
  bool? insurantTravels;
  bool? isDataCorrect;
  int? premium;
  int? discountedPremium;
  int? currentStepIndex;
  String? error;
  String? email;

  TourismModel({
    this.validFrom,
    this.validTill,
    this.countriesIds,
    this.regionId,
    this.city,
    this.insuranceAmount,
    this.insuranceAmountId,
    this.promoCode,
    this.multitripProgrammeId,
    this.franchiseId,
    this.purposeId,
    this.insuredList,
    this.sportCategoryId,
    this.sportId,
    this.isMultitrip,
    this.clientsBirthDate,
    this.insuredCount,
    this.ageGroupId,
    this.isCovid,
    this.covidLimit,
    this.isAgree,
    this.insurantTravels,
    this.isDataCorrect,
    this.premium,
    this.discountedPremium,
    this.currentStepIndex,
    this.error,
    this.email,
  });

  TourismModel.fromJson(Map<String, dynamic> json) {
    validFrom = json['validFrom'];
    validTill = json['validTill'];
    countriesIds = json['countriesIds'].cast<int>();
    regionId = json['regionId'];
    city = json['city'];
    insuranceAmount = json['insuranceAmount'];
    insuranceAmountId = json['insuranceAmountId'];
    promoCode = json['promoCode'];
    multitripProgrammeId = json['multitripProgrammeId'];
    franchiseId = json['franchiseId'];
    purposeId = json['purposeId'];
    if (json['insuredList'] != null) {
      insuredList = <InsuredListModel>[];
      json['insuredList'].forEach((v) {
        insuredList!.add(InsuredListModel.fromJson(v));
      });
    }
    sportCategoryId = json['sportCategoryId'];
    sportId = json['sportId'];
    isMultitrip = json['isMultitrip'];
    clientsBirthDate = json['clientsBirthDate'].cast<String>();
    insuredCount = json['insuredCount'];
    ageGroupId = json['ageGroupId'];
    isCovid = json['isCovid'];
    covidLimit = json['covidLimit'];
    isAgree = json['isAgree'];
    insurantTravels = json['insurantTravels'];
    isDataCorrect = json['isDataCorrect'];
    premium = json['premium'];
    discountedPremium = json['discountedPremium'];
    currentStepIndex = json['currentStepIndex'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['validFrom'] = validFrom;
    data['validTill'] = validTill;
    data['countriesIds'] = countriesIds;
    data['regionId'] = regionId;
    data['city'] = city;
    data['insuranceAmount'] = insuranceAmount;
    data['insuranceAmountId'] = insuranceAmountId;
    data['promoCode'] = promoCode;
    data['multitripProgrammeId'] = multitripProgrammeId;
    data['franchiseId'] = franchiseId;
    data['purposeId'] = purposeId;
    if (insuredList != null) {
      data['insuredList'] = insuredList!.map((v) => v.toJson()).toList();
    }
    data['sportCategoryId'] = sportCategoryId;
    data['sportId'] = sportId;
    data['isMultitrip'] = isMultitrip;
    data['clientsBirthDate'] = clientsBirthDate;
    data['insuredCount'] = insuredCount;
    data['ageGroupId'] = ageGroupId;
    data['isCovid'] = isCovid;
    data['covidLimit'] = covidLimit;
    data['isAgree'] = isAgree;
    data['insurantTravels'] = insurantTravels;
    data['isDataCorrect'] = isDataCorrect;
    data['premium'] = premium;
    data['discountedPremium'] = discountedPremium;
    data['currentStepIndex'] = currentStepIndex;
    data['error'] = error;
    data['email'] = email;
    data['agree_id'] = null;
    return data;
  }
}
