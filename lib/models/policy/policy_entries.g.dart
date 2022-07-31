// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Policy _$PolicyFromJson(Map<String, dynamic> json) => Policy(
      json['id'] as int,
      json['number'] as String?,
      json['signTime'] as String?,
      json['validFrom'] as String?,
      json['validTill'] as String?,
      json['customerId'] as int,
      json['insuranceTypeId'] as int,
      json['contractTypeId'] as int,
      json['mobileNumber'] as String?,
      json['email'] as String?,
      json['notificationTypeId'] as int,
      json['promo'] as int?,
      json['filialId'] as String?,
      json['discountedPremium'] as int,
      json['discount'] as int,
      json['premium'] as int,
      json['payment_type'] as int,
      json['siteUserId'] as String?,
      json['insuranceCoverSum'] as int?,
      json['holder'] == null
          ? null
          : Client.fromJson(json['holder'] as Map<String, dynamic>),
      (json['drivers'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['vehicles'] as List<dynamic>)
          .map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PolicyToJson(Policy instance) => <String, dynamic>{
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
      'discountedPremium': instance.discountedPremium,
      'discount': instance.discount,
      'premium': instance.premium,
      'payment_type': instance.paymentType,
      'siteUserId': instance.siteUserId,
      'insuranceCoverSum': instance.insuranceCoverSum,
      'holder': instance.holder,
      'drivers': instance.drivers,
      'vehicles': instance.vehicles,
    };
