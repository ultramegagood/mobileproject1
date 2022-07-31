// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreement_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgreementInfo _$AgreementInfoFromJson(Map<String, dynamic> json) =>
    AgreementInfo(
      json['id'] as int,
      json['holderName'] as String,
      json['holderIIN'] as String,
      json['holderPhone'] as String,
      json['productId'] as int,
      json['productName'] as String,
      json['premium'] as int,
      json['signDate'] as String,
      json['isActive'] as bool,
      json['isPaymentCheck'] as String,
      json['fromDate'] as String,
      json['tillDate'] as String?,
      (json['insured'] as List<dynamic>).map((e) => e as String).toList(),
      (json['objects'] as List<dynamic>).map((e) => e as String).toList(),
      (json['franchises'] as List<dynamic>).map((e) => e as String).toList(),
      json['insuranceAmount'] as int,
      json['agreeVariant'] as String?,
      json['promo'] as int?,
      json['paymentType'] as int?,
    );

Map<String, dynamic> _$AgreementInfoToJson(AgreementInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'holderName': instance.holderName,
      'holderIIN': instance.holderIIN,
      'holderPhone': instance.holderPhone,
      'productId': instance.productId,
      'productName': instance.productName,
      'premium': instance.premium,
      'signDate': instance.signDate,
      'isActive': instance.isActive,
      'isPaymentCheck': instance.isPaymentCheck,
      'fromDate': instance.fromDate,
      'tillDate': instance.tillDate,
      'insured': instance.insured,
      'objects': instance.objects,
      'franchises': instance.franchises,
      'insuranceAmount': instance.insuranceAmount,
      'agreeVariant': instance.agreeVariant,
      'promo': instance.promo,
      'paymentType': instance.paymentType,
    };
