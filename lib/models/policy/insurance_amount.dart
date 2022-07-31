import 'package:json_annotation/json_annotation.dart';
part 'insurance_amount.g.dart';
@JsonSerializable()
class InsuranceAmount {
  final int id;
  final int insuranceSum;
  final int premium;
  final int discountedPremium;

  InsuranceAmount(this.id, this.insuranceSum, this.premium, this.discountedPremium);
  factory InsuranceAmount.fromJson(Map<String,dynamic>json)=>_$InsuranceAmountFromJson(json);
  Map<String, dynamic> toJson() => _$InsuranceAmountToJson(this);

}
