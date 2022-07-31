// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourism.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tourism _$TourismFromJson(Map<String, dynamic> json) => Tourism(
      json['id'] as int,
      json['number'] as String?,
      json['signTime'] as String?,
      json['validFrom'] as String?,
      json['validTill'] as String?,
      json['customerId'] as int?,
      json['insuranceTypeId'] as String?,
      json['contractTypeId'] as int?,
      json['mobileNumber'] as String?,
      json['email'] as String?,
      json['notificationTypeId'] as int?,
      json['promo'] as String?,
      json['filialId'] as String?,
      json['siteUserId'] as String?,
      json['discount'] as int?,
      json['insuranceAmount'] as int?,
      json['premium'] as int?,
      json['insuredCount'] as int?,
      json['isMultitrip'] as bool?,
      json['promoCode'] as String?,
      json['purposeId'] as int?,
      json['regionId'] as int?,
      json['franchiseId'] as int?,
      json['sportId'] as int?,
      json['sportCategoryId'] as int?,
      json['multitripProgrammeId'] as int?,
      json['insuranceAmountId'] as int?,
      json['ageGroupId'] as int?,
      json['insurantTravels'] as bool?,
      json['isCovid'] as bool?,
      json['covidLimit'] as String?,
      (json['clientsBirthDate'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['insuredList'] as List<dynamic>)
          .map((e) => InsuredList.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['countriesIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$TourismToJson(Tourism instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'signTime': instance.signTime,
      'validFrom': instance.validFrom,
      'validTill': instance.validTill,
      'customerId': instance.customerId,
      'insuranceTypeId': instance.insuranceTypeId,
      'contractTypeId': instance.contractTypeId,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'notificationTypeId': instance.notificationTypeId,
      'promo': instance.promo,
      'filialId': instance.filialId,
      'siteUserId': instance.siteUserId,
      'discount': instance.discount,
      'insuranceAmount': instance.insuranceAmount,
      'premium': instance.premium,
      'insuredCount': instance.insuredCount,
      'isMultitrip': instance.isMultitrip,
      'promoCode': instance.promoCode,
      'purposeId': instance.purposeId,
      'regionId': instance.regionId,
      'franchiseId': instance.franchiseId,
      'sportId': instance.sportId,
      'sportCategoryId': instance.sportCategoryId,
      'multitripProgrammeId': instance.multitripProgrammeId,
      'insuranceAmountId': instance.insuranceAmountId,
      'ageGroupId': instance.ageGroupId,
      'insurantTravels': instance.insurantTravels,
      'isCovid': instance.isCovid,
      'covidLimit': instance.covidLimit,
      'clientsBirthDate': instance.clientsBirthDate,
      'insuredList': instance.insuredList,
      'countriesIds': instance.countriesIds,
    };
