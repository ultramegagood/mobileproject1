import 'package:json_annotation/json_annotation.dart';
part 'agreement_info.g.dart';
@JsonSerializable()
class AgreementInfo {
  final int id;
  final String holderName;
  final String holderIIN;
  final String holderPhone;
  final int productId;
  final String productName;
  final int premium;
  final String signDate;
  final bool isActive;
  final String isPaymentCheck;
  final String fromDate;
  final String? tillDate;
  final List<String> insured;
  final List<String> objects;
  final List<String> franchises;
  final int insuranceAmount;
  final String? agreeVariant;
  final int? promo;
  final int? paymentType;

  AgreementInfo(
      this.id,
      this.holderName,
      this.holderIIN,
      this.holderPhone,
      this.productId,
      this.productName,
      this.premium,
      this.signDate,
      this.isActive,
      this.isPaymentCheck,
      this.fromDate,
      this.tillDate,
      this.insured,
      this.objects,
      this.franchises,
      this.insuranceAmount,
      this.agreeVariant,
      this.promo,
      this.paymentType);
        factory AgreementInfo.fromJson(Map<String, dynamic>json)=> _$AgreementInfoFromJson(json);


    Map<String, dynamic> toJson() => _$AgreementInfoToJson(this);

}
