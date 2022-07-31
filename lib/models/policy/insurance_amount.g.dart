// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceAmount _$InsuranceAmountFromJson(Map<String, dynamic> json) =>
    InsuranceAmount(
      json['id'] as int,
      json['insuranceSum'] as int,
      json['premium'] as int,
      json['discountedPremium'] as int,
    );

Map<String, dynamic> _$InsuranceAmountToJson(InsuranceAmount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'insuranceSum': instance.insuranceSum,
      'premium': instance.premium,
      'discountedPremium': instance.discountedPremium,
    };
