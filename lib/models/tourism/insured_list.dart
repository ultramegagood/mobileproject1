import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart' as j;
import 'package:mobile_nsk/database/database.dart';

part 'insured_list.g.dart';

@UseRowClass(InsuredList)
class InsuredListEntries extends Table {
  IntColumn get id => integer()();
  IntColumn get sportId => integer().nullable()();
  IntColumn get sportyCategoryId => integer().nullable()();
  IntColumn get ageId => integer().nullable()();
  TextColumn get birthDate => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get documentNumber => text().nullable()();
  TextColumn get documentIssueDate => text().nullable()();
  TextColumn get documentGivenBy => text().nullable()();
}

@j.JsonSerializable()
class InsuredList extends Insertable<InsuredList> {
  int id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? firstNameEng;
  String? lastNameEng;
  String? legalName;
  int isIndividual;
  String? iin;
  int isResident;
  int countryId;
  int sexId;
  int economicsSectorId;
  int activityKindId;
  String? phone;
  String? email;
  String? address;
  int documentTypeId;
  String? documentNumber;
  String? documentIssueDate;
  String? driverLicenseNumber;
  String? driverLicenseNumberIssueDate;
  String? classType;
  String? birthDate;
  bool isExperienced;
  bool isPrivileged;
  bool isDriver;
  bool isInsurer;
  int? sportId;
  int? sportyCategoryId;
  int? ageId;
  String? documentGivenBy;

  InsuredList(
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.firstNameEng,
    this.lastNameEng,
    this.legalName,
    this.isIndividual,
    this.iin,
    this.isResident,
    this.countryId,
    this.sexId,
    this.economicsSectorId,
    this.activityKindId,
    this.phone,
    this.email,
    this.address,
    this.documentTypeId,
    this.documentNumber,
    this.documentIssueDate,
    this.driverLicenseNumber,
    this.driverLicenseNumberIssueDate,
    this.classType,
    this.birthDate,
    this.isExperienced,
    this.isPrivileged,
    this.isDriver,
    this.isInsurer,
    this.sportId,
    this.sportyCategoryId,
    this.ageId,
    this.documentGivenBy,
  );

  factory InsuredList.fromJson(Map<String, dynamic> json) =>
      _$InsuredListFromJson(json);

  toJson() => _$InsuredListToJson(this);
  

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return InsuredListEntriesCompanion(
    id: Value(id),
    firstName: Value(firstName),
    middleName: Value(middleName),
    lastName: Value(lastName),
    firstNameEng: Value(firstNameEng),
    lastNameEng: Value(lastNameEng),
    legalName: Value(legalName),
    isIndividual: Value(isIndividual),
    iin: Value(iin),
    isResident: Value(isResident),
    countryId: Value(countryId),
    sexId: Value(sexId),
    economicsSectorId: Value(economicsSectorId),
    activityKindId: Value(activityKindId),
    phone: Value(phone),
    email: Value(email),
    address: Value(address),
    documentTypeId: Value(documentTypeId),
    documentNumber: Value(documentNumber),
    documentIssueDate: Value(documentIssueDate),
    driverLicenseNumber: Value(driverLicenseNumber),
    driverLicenseNumberIssueDate: Value(driverLicenseNumberIssueDate),
    classType: Value(classType),
    birthDate: Value(birthDate),
    isExperienced: Value(isExperienced),
    isPrivileged: Value(isPrivileged),
    isDriver: Value(isDriver),
    isInsurer: Value(isInsurer),
    sportId: Value(sportId),
    sportyCategoryId: Value(sportyCategoryId),
    ageId: Value(ageId),
    documentGivenBy: Value(documentGivenBy),
    ).toColumns(nullToAbsent);
    // return InsuredListEntriesCompanion(
    //   id: Value(id),
    //   sportId: Value(sportId),
    //   sportyCategoryId: Value(sportyCategoryId),
    //   ageId: Value(ageId),
    //   birthDate: Value(birthDate),
    //   email: Value(email),
    //   documentNumber: Value(documentNumber),
    //   documentIssueDate: Value(documentIssueDate),
    //   documentGivenBy: Value(documentGivenBy),
    // ).toColumns(nullToAbsent);
  }
}
