import 'package:drift/drift.dart';
import 'package:mobile_nsk/database/database.dart';
import 'package:mobile_nsk/models/policy/clients.dart';
import 'package:mobile_nsk/models/policy/policy_converter.dart';
import 'package:mobile_nsk/models/policy/vehicle.dart';
import 'package:json_annotation/json_annotation.dart' as j;
part 'policy_entries.g.dart';

@UseRowClass(Policy)
class PolicieEntrie extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get number => text().nullable()();
  TextColumn get signTime => text().nullable()();
  TextColumn get validFrom => text().nullable()();
  TextColumn get validTill => text().nullable()();
  IntColumn get customerId => integer().withDefault(const Constant(0))();
  IntColumn get insuranceTypeId => integer().withDefault(const Constant(0))();
  IntColumn get cofntractTypeId => integer().withDefault(const Constant(0))();
  TextColumn get mobileNumber => text().nullable()();
  TextColumn get email => text().nullable()();
  IntColumn get notificationTypeId =>
      integer().withDefault(const Constant(0))();
  IntColumn get promo => integer().withDefault(const Constant(0))();
  TextColumn get filialId => text().nullable()();
  TextColumn get siteUserId => text().nullable()();
  IntColumn get discountedPremium => integer().withDefault(const Constant(0))();
  IntColumn get discount => integer().withDefault(const Constant(0))();
  IntColumn get premium => integer().withDefault(const Constant(0))();
  IntColumn get paymentType => integer().withDefault(const Constant(0))();
  IntColumn get contractTypeId => integer().withDefault(const Constant(0))();
  IntColumn get insuranceCoverSum => integer().withDefault(const Constant(0))();
  TextColumn get converter => text().map(const PolicyConverter()).nullable()();
  @override
  Set<Column> get primaryKey => {id};
}
class ClientPolicyEntries extends Table {
  IntColumn get policy => integer()();
  IntColumn get client => integer()();
  @override
  Set<Column>? get primaryKey => {client, policy};
}
class VehiclePolicyEntries extends Table {
  IntColumn get policy => integer()();
  IntColumn get vehicle => integer()();
  @override
  Set<Column>? get primaryKey => {policy, vehicle};
}
@j.JsonSerializable()
class Policy extends Insertable<Policy> {
  final int id;
  final String? number;
  final String? signTime;
  final String? validFrom;
  final String? validTill;
  final int customerId;
  final int insuranceTypeId;
  final int contractTypeId;
  final String? mobileNumber;
  final String? email;
  final int notificationTypeId;
  final int? promo;
  final String? filialId;
  @j.JsonKey(name: "discountedPremium")
  final int discountedPremium;
  final int discount;
  final int premium;
  @j.JsonKey(name: "payment_type")
  final int paymentType;
  final String? siteUserId;
  final int? insuranceCoverSum;
  final Client? holder;
  final List<Client> drivers;
  final List<Vehicle> vehicles;

  factory Policy.fromJson(Map<String, dynamic> json) => _$PolicyFromJson(json);

  Policy(
      this.id,
      this.number,
      this.signTime,
      this.validFrom,
      this.validTill,
      this.customerId,
      this.insuranceTypeId,
      this.contractTypeId,
      this.mobileNumber,
      this.email,
      this.notificationTypeId,
      this.promo,
      this.filialId,
      this.discountedPremium,
      this.discount,
      this.premium,
      this.paymentType,
      this.siteUserId,
      this.insuranceCoverSum,
      this.holder,
      this.drivers,
      this.vehicles);

  Map<String, dynamic> toJson() => _$PolicyToJson(this);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return PolicieEntrieCompanion(
            id: Value(id),
            number: Value(number),
            signTime: Value(signTime),
            validFrom: Value(validFrom),
            validTill: Value(validTill),
            customerId: Value(customerId),
            insuranceTypeId: Value(insuranceTypeId),
            contractTypeId: Value(contractTypeId),
            mobileNumber: Value(mobileNumber),
            email: Value(email),
            premium: Value(premium),
            notificationTypeId: Value(notificationTypeId),
            promo: Value(promo!),
            filialId: Value(filialId),
            discount: Value(discount),
            paymentType: Value(paymentType),
            cofntractTypeId: Value(contractTypeId),
            siteUserId: Value(siteUserId))
        .toColumns(nullToAbsent);
  }
}
