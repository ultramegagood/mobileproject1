import 'package:drift/drift.dart';
import 'package:mobile_nsk/database/database.dart';
import 'package:json_annotation/json_annotation.dart' as j;
import 'package:mobile_nsk/models/tourism/insured_list.dart';

part 'tourism.g.dart';

class InsuredListTourism extends Table {
  IntColumn get tourism => integer()();
  IntColumn get insuredList => integer()();
  @override
  Set<Column>? get primaryKey => {insuredList, tourism};
}

@UseRowClass(Tourism)
class TourismEntries extends Table {
  IntColumn get id => integer().withDefault(Constant(0))();
  TextColumn get number => text().nullable()();
  TextColumn get signTime => text().nullable()();
  TextColumn get validFrom => text().nullable()();
  TextColumn get validTill => text().nullable()();
  IntColumn get customerId => integer().nullable()();
  TextColumn get insuranceTypeId => text().nullable()();
  IntColumn get contractTypeId => integer().nullable()();
  TextColumn get mobileNumber => text().nullable()();
  TextColumn get email => text().nullable()();
  IntColumn get notificationTypeId => integer().nullable()();
  TextColumn get promo => text().nullable()();
  TextColumn get filialId => text().nullable()();
  TextColumn get siteUserId => text().nullable()();
  IntColumn get discount => integer().nullable()();
  IntColumn get insuranceAmount => integer().nullable()();
  IntColumn get premium => integer().nullable()();
  IntColumn get insuredCount => integer().nullable()();
  BoolColumn get isMultitrip => boolean().nullable()();
  TextColumn get promoCode => text().nullable()();
  IntColumn get purposeId => integer().nullable()();
  IntColumn get regionId => integer().nullable()();
  IntColumn get franchiseId => integer().nullable()();
  IntColumn get sportId => integer().nullable()();
  IntColumn get sportCategoryId => integer().nullable()();
  IntColumn get multitripProgrammeId => integer().nullable()();
  IntColumn get insuranceAmountId => integer().nullable()();
  IntColumn get ageGroupId => integer().nullable()();
  BoolColumn get insurantTravels => boolean().nullable()();
  BoolColumn get isCovid => boolean().nullable()();
  TextColumn get covidLimit => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@j.JsonSerializable()
class Tourism extends Insertable<Tourism> {
  final int id;
  final String? number;
  final String? signTime;
  final String? validFrom;
  final String? validTill;
  final int? customerId;
  final String? insuranceTypeId;
  final int? contractTypeId;
  final String? mobileNumber;
  final String? email;
  final int? notificationTypeId;
  final String? promo;
  final String? filialId;
  final String? siteUserId;
  final int? discount;
  final int? insuranceAmount;
  final int? premium;
  final int? insuredCount;
  final bool? isMultitrip;
  final String? promoCode;
  final int? purposeId;
  final int? regionId;
  final int? franchiseId;
  final int? sportId;
  final int? sportCategoryId;
  final int? multitripProgrammeId;
  final int? insuranceAmountId;
  final int? ageGroupId;
  final bool? insurantTravels;
  final bool? isCovid;
  final String? covidLimit;
  final List<String>? clientsBirthDate;
  final List<InsuredList> insuredList;
  final List<int>? countriesIds;

  Tourism(
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
      this.siteUserId,
      this.discount,
      this.insuranceAmount,
      this.premium,
      this.insuredCount,
      this.isMultitrip,
      this.promoCode,
      this.purposeId,
      this.regionId,
      this.franchiseId,
      this.sportId,
      this.sportCategoryId,
      this.multitripProgrammeId,
      this.insuranceAmountId,
      this.ageGroupId,
      this.insurantTravels,
      this.isCovid,
      this.covidLimit,
      this.clientsBirthDate,
      this.insuredList,
      this.countriesIds);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return TourismEntriesCompanion(
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
      notificationTypeId: Value(notificationTypeId),
      promo: Value(promo),
      filialId: Value(filialId),
      siteUserId: Value(siteUserId),
      discount: Value(discount),
      insuranceAmount: Value(insuranceAmount),
      premium: Value(premium),
      insuredCount: Value(insuredCount),
      isMultitrip: Value(isMultitrip),
      promoCode: Value(promoCode),
      purposeId: Value(purposeId),
      regionId: Value(regionId),
      franchiseId: Value(franchiseId),
      sportId: Value(sportId),
      sportCategoryId: Value(sportCategoryId),
      multitripProgrammeId: Value(multitripProgrammeId),
      insuranceAmountId: Value(insuranceAmountId),
      ageGroupId: Value(ageGroupId),
      insurantTravels: Value(insurantTravels),
      isCovid: Value(isCovid),
      covidLimit: Value(covidLimit),
    ).toColumns(nullToAbsent);
  }

  Map<String, dynamic> toJson() => _$TourismToJson(this);
}
