import 'package:drift/drift.dart';
import 'package:mobile_nsk/database/database.dart';
import 'package:mobile_nsk/models/policy/client_converter.dart';

@UseRowClass(Client)
class Clients extends Table {
  IntColumn get id => integer()();
  TextColumn get firstName => text().nullable()();
  TextColumn get middleName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get firstNameEng => text().nullable()();
  TextColumn get lastNameEng => text().nullable()();
  TextColumn get legalName => text().nullable()();
  IntColumn get isIndividual => integer()();
  TextColumn get iin => text().nullable()();
  IntColumn get isResident => integer()();
  IntColumn get countryId => integer()();
  IntColumn get sexId => integer()();
  IntColumn get economicsSectorId => integer()();
  IntColumn get activityKindId => integer()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get address => text().nullable()();
  IntColumn get documentTypeId => integer()();
  TextColumn get documentNumber => text().nullable()();
  TextColumn get documentIssueDate => text().nullable()();
  TextColumn get driverLicenseNumber => text().nullable()();
  TextColumn get driverLicenseNumberIssueDate => text().nullable()();
  TextColumn get classType => text().nullable().named("class")();
  TextColumn get birthDate => text().nullable()();
  BoolColumn get isExperienced => boolean()();
  BoolColumn get isPrivileged => boolean()();
  BoolColumn get isDriver => boolean().withDefault(const Constant(false))();
  BoolColumn get isInsurer => boolean().withDefault(const Constant(false))();
  TextColumn get holders => text().map(const ClientConverter()).nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class Client implements Insertable<Client> {
  final int id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? firstNameEng;
  final String? lastNameEng;
  final String? legalName;
  final int isIndividual;
  final String? iin;
  final int isResident;
  final int countryId;
  final int sexId;
  final int economicsSectorId;
  final int activityKindId;
  final String? phone;
  final String? email;
  final String? address;
  final int documentTypeId;
  final String? documentNumber;
  final String? documentIssueDate;
  final String? driverLicenseNumber;
  final String? driverLicenseNumberIssueDate;
  final String? classType;
  final String? birthDate;
  final bool isExperienced;
  final bool isPrivileged;
  final bool isDriver;
  final bool isInsurer;

  Client(
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
    this.isInsurer
  );
  factory Client.fromJson(Map<String, dynamic> json) => Client(
        json['id'] as int,
        json['firstName'] as String? ,
        json['middleName'] as String? ,
        json['lastName'] as String? ,
        json['firstNameEng'] as String? ,
        json['lastNameEng'] as String? ,
        json['legalName'] as String? ,
        json['isIndividual'] as int? ?? 0,
        json['iin'] as String? ,
        json['isResident'] as int? ?? 0,
        json['countryId'] as int? ?? 0,
        json['sexId'] as int? ?? 0,
        json['economicsSectorId'] as int? ?? 0,
        json['activityKindId'] as int? ?? 0,
        json['phone'] as String? ,
        json['email'] as String? ,
        json['address'] as String? ,
        json['documentTypeId'] as int? ?? 0,
        json['documentNumber'] as String? ,
        json['documentIssueDate'] as String? ,
        json['driverLicenseNumber'] as String? ,
        json['driverLicenseNumberIssueDate'] as String? ,
        json['class'] as String? ?? '0' ,
        json['birthDate'] as String? ,
        json['isExperienced'] as bool,
        json['isPrivileged'] as bool,
        json['isDriver'] as bool? ?? false,
        json['isInsurer'] as bool? ?? false
      );
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'firstNameEng': firstNameEng,
        'lastNameEng': lastNameEng,
        'legalName': legalName,
        'isIndividual': isIndividual,
        'iin': iin,
        'isResident': isResident,
        'countryId': countryId,
        'sexId': sexId,
        'economicsSectorId': economicsSectorId,
        'activityKindId': activityKindId,
        'phone': phone,
        'email': email,
        'address': address,
        'documentTypeId': documentTypeId,
        'documentNumber': documentNumber,
        'documentIssueDate': documentIssueDate,
        'driverLicenseNumber': driverLicenseNumber,
        'driverLicenseNumberIssueDate': driverLicenseNumberIssueDate,
        'class': classType,
        'birthDate': birthDate,
        'isExperienced': isExperienced,
        'isPrivileged': isPrivileged,
        'isDriver':isDriver,
        'isInsurer':isInsurer
      };
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return ClientsCompanion(
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
    ).toColumns(nullToAbsent);
  }
}
