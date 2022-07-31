// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<int> id;
  final Value<String?> firstName;
  final Value<String?> middleName;
  final Value<String?> lastName;
  final Value<String?> firstNameEng;
  final Value<String?> lastNameEng;
  final Value<String?> legalName;
  final Value<int> isIndividual;
  final Value<String?> iin;
  final Value<int> isResident;
  final Value<int> countryId;
  final Value<int> sexId;
  final Value<int> economicsSectorId;
  final Value<int> activityKindId;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> address;
  final Value<int> documentTypeId;
  final Value<String?> documentNumber;
  final Value<String?> documentIssueDate;
  final Value<String?> driverLicenseNumber;
  final Value<String?> driverLicenseNumberIssueDate;
  final Value<String?> classType;
  final Value<String?> birthDate;
  final Value<bool> isExperienced;
  final Value<bool> isPrivileged;
  final Value<bool> isDriver;
  final Value<bool> isInsurer;
  final Value<Client?> holders;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.firstNameEng = const Value.absent(),
    this.lastNameEng = const Value.absent(),
    this.legalName = const Value.absent(),
    this.isIndividual = const Value.absent(),
    this.iin = const Value.absent(),
    this.isResident = const Value.absent(),
    this.countryId = const Value.absent(),
    this.sexId = const Value.absent(),
    this.economicsSectorId = const Value.absent(),
    this.activityKindId = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.documentTypeId = const Value.absent(),
    this.documentNumber = const Value.absent(),
    this.documentIssueDate = const Value.absent(),
    this.driverLicenseNumber = const Value.absent(),
    this.driverLicenseNumberIssueDate = const Value.absent(),
    this.classType = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.isExperienced = const Value.absent(),
    this.isPrivileged = const Value.absent(),
    this.isDriver = const Value.absent(),
    this.isInsurer = const Value.absent(),
    this.holders = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.firstNameEng = const Value.absent(),
    this.lastNameEng = const Value.absent(),
    this.legalName = const Value.absent(),
    required int isIndividual,
    this.iin = const Value.absent(),
    required int isResident,
    required int countryId,
    required int sexId,
    required int economicsSectorId,
    required int activityKindId,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    required int documentTypeId,
    this.documentNumber = const Value.absent(),
    this.documentIssueDate = const Value.absent(),
    this.driverLicenseNumber = const Value.absent(),
    this.driverLicenseNumberIssueDate = const Value.absent(),
    this.classType = const Value.absent(),
    this.birthDate = const Value.absent(),
    required bool isExperienced,
    required bool isPrivileged,
    this.isDriver = const Value.absent(),
    this.isInsurer = const Value.absent(),
    this.holders = const Value.absent(),
  })  : isIndividual = Value(isIndividual),
        isResident = Value(isResident),
        countryId = Value(countryId),
        sexId = Value(sexId),
        economicsSectorId = Value(economicsSectorId),
        activityKindId = Value(activityKindId),
        documentTypeId = Value(documentTypeId),
        isExperienced = Value(isExperienced),
        isPrivileged = Value(isPrivileged);
  static Insertable<Client> custom({
    Expression<int>? id,
    Expression<String?>? firstName,
    Expression<String?>? middleName,
    Expression<String?>? lastName,
    Expression<String?>? firstNameEng,
    Expression<String?>? lastNameEng,
    Expression<String?>? legalName,
    Expression<int>? isIndividual,
    Expression<String?>? iin,
    Expression<int>? isResident,
    Expression<int>? countryId,
    Expression<int>? sexId,
    Expression<int>? economicsSectorId,
    Expression<int>? activityKindId,
    Expression<String?>? phone,
    Expression<String?>? email,
    Expression<String?>? address,
    Expression<int>? documentTypeId,
    Expression<String?>? documentNumber,
    Expression<String?>? documentIssueDate,
    Expression<String?>? driverLicenseNumber,
    Expression<String?>? driverLicenseNumberIssueDate,
    Expression<String?>? classType,
    Expression<String?>? birthDate,
    Expression<bool>? isExperienced,
    Expression<bool>? isPrivileged,
    Expression<bool>? isDriver,
    Expression<bool>? isInsurer,
    Expression<Client?>? holders,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (middleName != null) 'middle_name': middleName,
      if (lastName != null) 'last_name': lastName,
      if (firstNameEng != null) 'first_name_eng': firstNameEng,
      if (lastNameEng != null) 'last_name_eng': lastNameEng,
      if (legalName != null) 'legal_name': legalName,
      if (isIndividual != null) 'is_individual': isIndividual,
      if (iin != null) 'iin': iin,
      if (isResident != null) 'is_resident': isResident,
      if (countryId != null) 'country_id': countryId,
      if (sexId != null) 'sex_id': sexId,
      if (economicsSectorId != null) 'economics_sector_id': economicsSectorId,
      if (activityKindId != null) 'activity_kind_id': activityKindId,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (documentTypeId != null) 'document_type_id': documentTypeId,
      if (documentNumber != null) 'document_number': documentNumber,
      if (documentIssueDate != null) 'document_issue_date': documentIssueDate,
      if (driverLicenseNumber != null)
        'driver_license_number': driverLicenseNumber,
      if (driverLicenseNumberIssueDate != null)
        'driver_license_number_issue_date': driverLicenseNumberIssueDate,
      if (classType != null) 'class': classType,
      if (birthDate != null) 'birth_date': birthDate,
      if (isExperienced != null) 'is_experienced': isExperienced,
      if (isPrivileged != null) 'is_privileged': isPrivileged,
      if (isDriver != null) 'is_driver': isDriver,
      if (isInsurer != null) 'is_insurer': isInsurer,
      if (holders != null) 'holders': holders,
    });
  }

  ClientsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? firstName,
      Value<String?>? middleName,
      Value<String?>? lastName,
      Value<String?>? firstNameEng,
      Value<String?>? lastNameEng,
      Value<String?>? legalName,
      Value<int>? isIndividual,
      Value<String?>? iin,
      Value<int>? isResident,
      Value<int>? countryId,
      Value<int>? sexId,
      Value<int>? economicsSectorId,
      Value<int>? activityKindId,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? address,
      Value<int>? documentTypeId,
      Value<String?>? documentNumber,
      Value<String?>? documentIssueDate,
      Value<String?>? driverLicenseNumber,
      Value<String?>? driverLicenseNumberIssueDate,
      Value<String?>? classType,
      Value<String?>? birthDate,
      Value<bool>? isExperienced,
      Value<bool>? isPrivileged,
      Value<bool>? isDriver,
      Value<bool>? isInsurer,
      Value<Client?>? holders}) {
    return ClientsCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      firstNameEng: firstNameEng ?? this.firstNameEng,
      lastNameEng: lastNameEng ?? this.lastNameEng,
      legalName: legalName ?? this.legalName,
      isIndividual: isIndividual ?? this.isIndividual,
      iin: iin ?? this.iin,
      isResident: isResident ?? this.isResident,
      countryId: countryId ?? this.countryId,
      sexId: sexId ?? this.sexId,
      economicsSectorId: economicsSectorId ?? this.economicsSectorId,
      activityKindId: activityKindId ?? this.activityKindId,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      documentTypeId: documentTypeId ?? this.documentTypeId,
      documentNumber: documentNumber ?? this.documentNumber,
      documentIssueDate: documentIssueDate ?? this.documentIssueDate,
      driverLicenseNumber: driverLicenseNumber ?? this.driverLicenseNumber,
      driverLicenseNumberIssueDate:
          driverLicenseNumberIssueDate ?? this.driverLicenseNumberIssueDate,
      classType: classType ?? this.classType,
      birthDate: birthDate ?? this.birthDate,
      isExperienced: isExperienced ?? this.isExperienced,
      isPrivileged: isPrivileged ?? this.isPrivileged,
      isDriver: isDriver ?? this.isDriver,
      isInsurer: isInsurer ?? this.isInsurer,
      holders: holders ?? this.holders,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (middleName.present) {
      map['middle_name'] = Variable<String?>(middleName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (firstNameEng.present) {
      map['first_name_eng'] = Variable<String?>(firstNameEng.value);
    }
    if (lastNameEng.present) {
      map['last_name_eng'] = Variable<String?>(lastNameEng.value);
    }
    if (legalName.present) {
      map['legal_name'] = Variable<String?>(legalName.value);
    }
    if (isIndividual.present) {
      map['is_individual'] = Variable<int>(isIndividual.value);
    }
    if (iin.present) {
      map['iin'] = Variable<String?>(iin.value);
    }
    if (isResident.present) {
      map['is_resident'] = Variable<int>(isResident.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    if (sexId.present) {
      map['sex_id'] = Variable<int>(sexId.value);
    }
    if (economicsSectorId.present) {
      map['economics_sector_id'] = Variable<int>(economicsSectorId.value);
    }
    if (activityKindId.present) {
      map['activity_kind_id'] = Variable<int>(activityKindId.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String?>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String?>(address.value);
    }
    if (documentTypeId.present) {
      map['document_type_id'] = Variable<int>(documentTypeId.value);
    }
    if (documentNumber.present) {
      map['document_number'] = Variable<String?>(documentNumber.value);
    }
    if (documentIssueDate.present) {
      map['document_issue_date'] = Variable<String?>(documentIssueDate.value);
    }
    if (driverLicenseNumber.present) {
      map['driver_license_number'] =
          Variable<String?>(driverLicenseNumber.value);
    }
    if (driverLicenseNumberIssueDate.present) {
      map['driver_license_number_issue_date'] =
          Variable<String?>(driverLicenseNumberIssueDate.value);
    }
    if (classType.present) {
      map['class'] = Variable<String?>(classType.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<String?>(birthDate.value);
    }
    if (isExperienced.present) {
      map['is_experienced'] = Variable<bool>(isExperienced.value);
    }
    if (isPrivileged.present) {
      map['is_privileged'] = Variable<bool>(isPrivileged.value);
    }
    if (isDriver.present) {
      map['is_driver'] = Variable<bool>(isDriver.value);
    }
    if (isInsurer.present) {
      map['is_insurer'] = Variable<bool>(isInsurer.value);
    }
    if (holders.present) {
      final converter = $ClientsTable.$converter0;
      map['holders'] = Variable<String?>(converter.mapToSql(holders.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('firstNameEng: $firstNameEng, ')
          ..write('lastNameEng: $lastNameEng, ')
          ..write('legalName: $legalName, ')
          ..write('isIndividual: $isIndividual, ')
          ..write('iin: $iin, ')
          ..write('isResident: $isResident, ')
          ..write('countryId: $countryId, ')
          ..write('sexId: $sexId, ')
          ..write('economicsSectorId: $economicsSectorId, ')
          ..write('activityKindId: $activityKindId, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('documentTypeId: $documentTypeId, ')
          ..write('documentNumber: $documentNumber, ')
          ..write('documentIssueDate: $documentIssueDate, ')
          ..write('driverLicenseNumber: $driverLicenseNumber, ')
          ..write(
              'driverLicenseNumberIssueDate: $driverLicenseNumberIssueDate, ')
          ..write('classType: $classType, ')
          ..write('birthDate: $birthDate, ')
          ..write('isExperienced: $isExperienced, ')
          ..write('isPrivileged: $isPrivileged, ')
          ..write('isDriver: $isDriver, ')
          ..write('isInsurer: $isInsurer, ')
          ..write('holders: $holders')
          ..write(')'))
        .toString();
  }
}

class $ClientsTable extends Clients with TableInfo<$ClientsTable, Client> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _middleNameMeta = const VerificationMeta('middleName');
  @override
  late final GeneratedColumn<String?> middleName = GeneratedColumn<String?>(
      'middle_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _firstNameEngMeta =
      const VerificationMeta('firstNameEng');
  @override
  late final GeneratedColumn<String?> firstNameEng = GeneratedColumn<String?>(
      'first_name_eng', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _lastNameEngMeta =
      const VerificationMeta('lastNameEng');
  @override
  late final GeneratedColumn<String?> lastNameEng = GeneratedColumn<String?>(
      'last_name_eng', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _legalNameMeta = const VerificationMeta('legalName');
  @override
  late final GeneratedColumn<String?> legalName = GeneratedColumn<String?>(
      'legal_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isIndividualMeta =
      const VerificationMeta('isIndividual');
  @override
  late final GeneratedColumn<int?> isIndividual = GeneratedColumn<int?>(
      'is_individual', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _iinMeta = const VerificationMeta('iin');
  @override
  late final GeneratedColumn<String?> iin = GeneratedColumn<String?>(
      'iin', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isResidentMeta = const VerificationMeta('isResident');
  @override
  late final GeneratedColumn<int?> isResident = GeneratedColumn<int?>(
      'is_resident', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<int?> countryId = GeneratedColumn<int?>(
      'country_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _sexIdMeta = const VerificationMeta('sexId');
  @override
  late final GeneratedColumn<int?> sexId = GeneratedColumn<int?>(
      'sex_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _economicsSectorIdMeta =
      const VerificationMeta('economicsSectorId');
  @override
  late final GeneratedColumn<int?> economicsSectorId = GeneratedColumn<int?>(
      'economics_sector_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _activityKindIdMeta =
      const VerificationMeta('activityKindId');
  @override
  late final GeneratedColumn<int?> activityKindId = GeneratedColumn<int?>(
      'activity_kind_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _documentTypeIdMeta =
      const VerificationMeta('documentTypeId');
  @override
  late final GeneratedColumn<int?> documentTypeId = GeneratedColumn<int?>(
      'document_type_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _documentNumberMeta =
      const VerificationMeta('documentNumber');
  @override
  late final GeneratedColumn<String?> documentNumber = GeneratedColumn<String?>(
      'document_number', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _documentIssueDateMeta =
      const VerificationMeta('documentIssueDate');
  @override
  late final GeneratedColumn<String?> documentIssueDate =
      GeneratedColumn<String?>('document_issue_date', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _driverLicenseNumberMeta =
      const VerificationMeta('driverLicenseNumber');
  @override
  late final GeneratedColumn<String?> driverLicenseNumber =
      GeneratedColumn<String?>('driver_license_number', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _driverLicenseNumberIssueDateMeta =
      const VerificationMeta('driverLicenseNumberIssueDate');
  @override
  late final GeneratedColumn<String?> driverLicenseNumberIssueDate =
      GeneratedColumn<String?>(
          'driver_license_number_issue_date', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _classTypeMeta = const VerificationMeta('classType');
  @override
  late final GeneratedColumn<String?> classType = GeneratedColumn<String?>(
      'class', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _birthDateMeta = const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<String?> birthDate = GeneratedColumn<String?>(
      'birth_date', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isExperiencedMeta =
      const VerificationMeta('isExperienced');
  @override
  late final GeneratedColumn<bool?> isExperienced = GeneratedColumn<bool?>(
      'is_experienced', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_experienced IN (0, 1))');
  final VerificationMeta _isPrivilegedMeta =
      const VerificationMeta('isPrivileged');
  @override
  late final GeneratedColumn<bool?> isPrivileged = GeneratedColumn<bool?>(
      'is_privileged', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_privileged IN (0, 1))');
  final VerificationMeta _isDriverMeta = const VerificationMeta('isDriver');
  @override
  late final GeneratedColumn<bool?> isDriver = GeneratedColumn<bool?>(
      'is_driver', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_driver IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isInsurerMeta = const VerificationMeta('isInsurer');
  @override
  late final GeneratedColumn<bool?> isInsurer = GeneratedColumn<bool?>(
      'is_insurer', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_insurer IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _holdersMeta = const VerificationMeta('holders');
  @override
  late final GeneratedColumnWithTypeConverter<Client, String?> holders =
      GeneratedColumn<String?>('holders', aliasedName, true,
              type: const StringType(), requiredDuringInsert: false)
          .withConverter<Client>($ClientsTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        firstName,
        middleName,
        lastName,
        firstNameEng,
        lastNameEng,
        legalName,
        isIndividual,
        iin,
        isResident,
        countryId,
        sexId,
        economicsSectorId,
        activityKindId,
        phone,
        email,
        address,
        documentTypeId,
        documentNumber,
        documentIssueDate,
        driverLicenseNumber,
        driverLicenseNumberIssueDate,
        classType,
        birthDate,
        isExperienced,
        isPrivileged,
        isDriver,
        isInsurer,
        holders
      ];
  @override
  String get aliasedName => _alias ?? 'clients';
  @override
  String get actualTableName => 'clients';
  @override
  VerificationContext validateIntegrity(Insertable<Client> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('middle_name')) {
      context.handle(
          _middleNameMeta,
          middleName.isAcceptableOrUnknown(
              data['middle_name']!, _middleNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('first_name_eng')) {
      context.handle(
          _firstNameEngMeta,
          firstNameEng.isAcceptableOrUnknown(
              data['first_name_eng']!, _firstNameEngMeta));
    }
    if (data.containsKey('last_name_eng')) {
      context.handle(
          _lastNameEngMeta,
          lastNameEng.isAcceptableOrUnknown(
              data['last_name_eng']!, _lastNameEngMeta));
    }
    if (data.containsKey('legal_name')) {
      context.handle(_legalNameMeta,
          legalName.isAcceptableOrUnknown(data['legal_name']!, _legalNameMeta));
    }
    if (data.containsKey('is_individual')) {
      context.handle(
          _isIndividualMeta,
          isIndividual.isAcceptableOrUnknown(
              data['is_individual']!, _isIndividualMeta));
    } else if (isInserting) {
      context.missing(_isIndividualMeta);
    }
    if (data.containsKey('iin')) {
      context.handle(
          _iinMeta, iin.isAcceptableOrUnknown(data['iin']!, _iinMeta));
    }
    if (data.containsKey('is_resident')) {
      context.handle(
          _isResidentMeta,
          isResident.isAcceptableOrUnknown(
              data['is_resident']!, _isResidentMeta));
    } else if (isInserting) {
      context.missing(_isResidentMeta);
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('sex_id')) {
      context.handle(
          _sexIdMeta, sexId.isAcceptableOrUnknown(data['sex_id']!, _sexIdMeta));
    } else if (isInserting) {
      context.missing(_sexIdMeta);
    }
    if (data.containsKey('economics_sector_id')) {
      context.handle(
          _economicsSectorIdMeta,
          economicsSectorId.isAcceptableOrUnknown(
              data['economics_sector_id']!, _economicsSectorIdMeta));
    } else if (isInserting) {
      context.missing(_economicsSectorIdMeta);
    }
    if (data.containsKey('activity_kind_id')) {
      context.handle(
          _activityKindIdMeta,
          activityKindId.isAcceptableOrUnknown(
              data['activity_kind_id']!, _activityKindIdMeta));
    } else if (isInserting) {
      context.missing(_activityKindIdMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('document_type_id')) {
      context.handle(
          _documentTypeIdMeta,
          documentTypeId.isAcceptableOrUnknown(
              data['document_type_id']!, _documentTypeIdMeta));
    } else if (isInserting) {
      context.missing(_documentTypeIdMeta);
    }
    if (data.containsKey('document_number')) {
      context.handle(
          _documentNumberMeta,
          documentNumber.isAcceptableOrUnknown(
              data['document_number']!, _documentNumberMeta));
    }
    if (data.containsKey('document_issue_date')) {
      context.handle(
          _documentIssueDateMeta,
          documentIssueDate.isAcceptableOrUnknown(
              data['document_issue_date']!, _documentIssueDateMeta));
    }
    if (data.containsKey('driver_license_number')) {
      context.handle(
          _driverLicenseNumberMeta,
          driverLicenseNumber.isAcceptableOrUnknown(
              data['driver_license_number']!, _driverLicenseNumberMeta));
    }
    if (data.containsKey('driver_license_number_issue_date')) {
      context.handle(
          _driverLicenseNumberIssueDateMeta,
          driverLicenseNumberIssueDate.isAcceptableOrUnknown(
              data['driver_license_number_issue_date']!,
              _driverLicenseNumberIssueDateMeta));
    }
    if (data.containsKey('class')) {
      context.handle(_classTypeMeta,
          classType.isAcceptableOrUnknown(data['class']!, _classTypeMeta));
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    }
    if (data.containsKey('is_experienced')) {
      context.handle(
          _isExperiencedMeta,
          isExperienced.isAcceptableOrUnknown(
              data['is_experienced']!, _isExperiencedMeta));
    } else if (isInserting) {
      context.missing(_isExperiencedMeta);
    }
    if (data.containsKey('is_privileged')) {
      context.handle(
          _isPrivilegedMeta,
          isPrivileged.isAcceptableOrUnknown(
              data['is_privileged']!, _isPrivilegedMeta));
    } else if (isInserting) {
      context.missing(_isPrivilegedMeta);
    }
    if (data.containsKey('is_driver')) {
      context.handle(_isDriverMeta,
          isDriver.isAcceptableOrUnknown(data['is_driver']!, _isDriverMeta));
    }
    if (data.containsKey('is_insurer')) {
      context.handle(_isInsurerMeta,
          isInsurer.isAcceptableOrUnknown(data['is_insurer']!, _isInsurerMeta));
    }
    context.handle(_holdersMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}middle_name']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name_eng']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name_eng']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}legal_name']),
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_individual'])!,
      const StringType().mapFromDatabaseResponse(data['${effectivePrefix}iin']),
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_resident'])!,
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id'])!,
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sex_id'])!,
      const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}economics_sector_id'])!,
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}activity_kind_id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}document_type_id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}document_number']),
      const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}document_issue_date']),
      const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}driver_license_number']),
      const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}driver_license_number_issue_date']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}class']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_date']),
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_experienced'])!,
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_privileged'])!,
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_driver'])!,
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_insurer'])!,
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }

  static TypeConverter<Client, String> $converter0 = const ClientConverter();
}

class VehiclesCompanion extends UpdateCompanion<Vehicle> {
  final Value<int> id;
  final Value<String?> registrationCertificate;
  final Value<String?> registrationCertificateDate;
  final Value<int> typeId;
  final Value<String?> licensePlate;
  final Value<String?> vin;
  final Value<String?> yearManufactured;
  final Value<int> regionId;
  final Value<String?> model;
  final Value<String?> brand;
  final Value<int> seats;
  final Value<bool> isOverSevenYears;
  final Value<bool> isOtherCity;
  final Value<Vehicle?> vehicles;
  const VehiclesCompanion({
    this.id = const Value.absent(),
    this.registrationCertificate = const Value.absent(),
    this.registrationCertificateDate = const Value.absent(),
    this.typeId = const Value.absent(),
    this.licensePlate = const Value.absent(),
    this.vin = const Value.absent(),
    this.yearManufactured = const Value.absent(),
    this.regionId = const Value.absent(),
    this.model = const Value.absent(),
    this.brand = const Value.absent(),
    this.seats = const Value.absent(),
    this.isOverSevenYears = const Value.absent(),
    this.isOtherCity = const Value.absent(),
    this.vehicles = const Value.absent(),
  });
  VehiclesCompanion.insert({
    this.id = const Value.absent(),
    this.registrationCertificate = const Value.absent(),
    this.registrationCertificateDate = const Value.absent(),
    required int typeId,
    this.licensePlate = const Value.absent(),
    this.vin = const Value.absent(),
    this.yearManufactured = const Value.absent(),
    required int regionId,
    this.model = const Value.absent(),
    this.brand = const Value.absent(),
    required int seats,
    required bool isOverSevenYears,
    required bool isOtherCity,
    this.vehicles = const Value.absent(),
  })  : typeId = Value(typeId),
        regionId = Value(regionId),
        seats = Value(seats),
        isOverSevenYears = Value(isOverSevenYears),
        isOtherCity = Value(isOtherCity);
  static Insertable<Vehicle> custom({
    Expression<int>? id,
    Expression<String?>? registrationCertificate,
    Expression<String?>? registrationCertificateDate,
    Expression<int>? typeId,
    Expression<String?>? licensePlate,
    Expression<String?>? vin,
    Expression<String?>? yearManufactured,
    Expression<int>? regionId,
    Expression<String?>? model,
    Expression<String?>? brand,
    Expression<int>? seats,
    Expression<bool>? isOverSevenYears,
    Expression<bool>? isOtherCity,
    Expression<Vehicle?>? vehicles,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (registrationCertificate != null)
        'registration_certificate': registrationCertificate,
      if (registrationCertificateDate != null)
        'registration_certificate_date': registrationCertificateDate,
      if (typeId != null) 'type_id': typeId,
      if (licensePlate != null) 'license_plate': licensePlate,
      if (vin != null) 'vin': vin,
      if (yearManufactured != null) 'year_manufactured': yearManufactured,
      if (regionId != null) 'region_id': regionId,
      if (model != null) 'model': model,
      if (brand != null) 'brand': brand,
      if (seats != null) 'seats': seats,
      if (isOverSevenYears != null) 'is_over_seven_years': isOverSevenYears,
      if (isOtherCity != null) 'is_other_city': isOtherCity,
      if (vehicles != null) 'vehicles': vehicles,
    });
  }

  VehiclesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? registrationCertificate,
      Value<String?>? registrationCertificateDate,
      Value<int>? typeId,
      Value<String?>? licensePlate,
      Value<String?>? vin,
      Value<String?>? yearManufactured,
      Value<int>? regionId,
      Value<String?>? model,
      Value<String?>? brand,
      Value<int>? seats,
      Value<bool>? isOverSevenYears,
      Value<bool>? isOtherCity,
      Value<Vehicle?>? vehicles}) {
    return VehiclesCompanion(
      id: id ?? this.id,
      registrationCertificate:
          registrationCertificate ?? this.registrationCertificate,
      registrationCertificateDate:
          registrationCertificateDate ?? this.registrationCertificateDate,
      typeId: typeId ?? this.typeId,
      licensePlate: licensePlate ?? this.licensePlate,
      vin: vin ?? this.vin,
      yearManufactured: yearManufactured ?? this.yearManufactured,
      regionId: regionId ?? this.regionId,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      seats: seats ?? this.seats,
      isOverSevenYears: isOverSevenYears ?? this.isOverSevenYears,
      isOtherCity: isOtherCity ?? this.isOtherCity,
      vehicles: vehicles ?? this.vehicles,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (registrationCertificate.present) {
      map['registration_certificate'] =
          Variable<String?>(registrationCertificate.value);
    }
    if (registrationCertificateDate.present) {
      map['registration_certificate_date'] =
          Variable<String?>(registrationCertificateDate.value);
    }
    if (typeId.present) {
      map['type_id'] = Variable<int>(typeId.value);
    }
    if (licensePlate.present) {
      map['license_plate'] = Variable<String?>(licensePlate.value);
    }
    if (vin.present) {
      map['vin'] = Variable<String?>(vin.value);
    }
    if (yearManufactured.present) {
      map['year_manufactured'] = Variable<String?>(yearManufactured.value);
    }
    if (regionId.present) {
      map['region_id'] = Variable<int>(regionId.value);
    }
    if (model.present) {
      map['model'] = Variable<String?>(model.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String?>(brand.value);
    }
    if (seats.present) {
      map['seats'] = Variable<int>(seats.value);
    }
    if (isOverSevenYears.present) {
      map['is_over_seven_years'] = Variable<bool>(isOverSevenYears.value);
    }
    if (isOtherCity.present) {
      map['is_other_city'] = Variable<bool>(isOtherCity.value);
    }
    if (vehicles.present) {
      final converter = $VehiclesTable.$converter0;
      map['vehicles'] = Variable<String?>(converter.mapToSql(vehicles.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehiclesCompanion(')
          ..write('id: $id, ')
          ..write('registrationCertificate: $registrationCertificate, ')
          ..write('registrationCertificateDate: $registrationCertificateDate, ')
          ..write('typeId: $typeId, ')
          ..write('licensePlate: $licensePlate, ')
          ..write('vin: $vin, ')
          ..write('yearManufactured: $yearManufactured, ')
          ..write('regionId: $regionId, ')
          ..write('model: $model, ')
          ..write('brand: $brand, ')
          ..write('seats: $seats, ')
          ..write('isOverSevenYears: $isOverSevenYears, ')
          ..write('isOtherCity: $isOtherCity, ')
          ..write('vehicles: $vehicles')
          ..write(')'))
        .toString();
  }
}

class $VehiclesTable extends Vehicles with TableInfo<$VehiclesTable, Vehicle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehiclesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _registrationCertificateMeta =
      const VerificationMeta('registrationCertificate');
  @override
  late final GeneratedColumn<String?> registrationCertificate =
      GeneratedColumn<String?>('registration_certificate', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _registrationCertificateDateMeta =
      const VerificationMeta('registrationCertificateDate');
  @override
  late final GeneratedColumn<String?> registrationCertificateDate =
      GeneratedColumn<String?>(
          'registration_certificate_date', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _typeIdMeta = const VerificationMeta('typeId');
  @override
  late final GeneratedColumn<int?> typeId = GeneratedColumn<int?>(
      'type_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _licensePlateMeta =
      const VerificationMeta('licensePlate');
  @override
  late final GeneratedColumn<String?> licensePlate = GeneratedColumn<String?>(
      'license_plate', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _vinMeta = const VerificationMeta('vin');
  @override
  late final GeneratedColumn<String?> vin = GeneratedColumn<String?>(
      'vin', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _yearManufacturedMeta =
      const VerificationMeta('yearManufactured');
  @override
  late final GeneratedColumn<String?> yearManufactured =
      GeneratedColumn<String?>('year_manufactured', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _regionIdMeta = const VerificationMeta('regionId');
  @override
  late final GeneratedColumn<int?> regionId = GeneratedColumn<int?>(
      'region_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String?> model = GeneratedColumn<String?>(
      'model', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String?> brand = GeneratedColumn<String?>(
      'brand', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _seatsMeta = const VerificationMeta('seats');
  @override
  late final GeneratedColumn<int?> seats = GeneratedColumn<int?>(
      'seats', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _isOverSevenYearsMeta =
      const VerificationMeta('isOverSevenYears');
  @override
  late final GeneratedColumn<bool?> isOverSevenYears = GeneratedColumn<bool?>(
      'is_over_seven_years', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_over_seven_years IN (0, 1))');
  final VerificationMeta _isOtherCityMeta =
      const VerificationMeta('isOtherCity');
  @override
  late final GeneratedColumn<bool?> isOtherCity = GeneratedColumn<bool?>(
      'is_other_city', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_other_city IN (0, 1))');
  final VerificationMeta _vehiclesMeta = const VerificationMeta('vehicles');
  @override
  late final GeneratedColumnWithTypeConverter<Vehicle, String?> vehicles =
      GeneratedColumn<String?>('vehicles', aliasedName, true,
              type: const StringType(), requiredDuringInsert: false)
          .withConverter<Vehicle>($VehiclesTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        registrationCertificate,
        registrationCertificateDate,
        typeId,
        licensePlate,
        vin,
        yearManufactured,
        regionId,
        model,
        brand,
        seats,
        isOverSevenYears,
        isOtherCity,
        vehicles
      ];
  @override
  String get aliasedName => _alias ?? 'vehicles';
  @override
  String get actualTableName => 'vehicles';
  @override
  VerificationContext validateIntegrity(Insertable<Vehicle> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('registration_certificate')) {
      context.handle(
          _registrationCertificateMeta,
          registrationCertificate.isAcceptableOrUnknown(
              data['registration_certificate']!, _registrationCertificateMeta));
    }
    if (data.containsKey('registration_certificate_date')) {
      context.handle(
          _registrationCertificateDateMeta,
          registrationCertificateDate.isAcceptableOrUnknown(
              data['registration_certificate_date']!,
              _registrationCertificateDateMeta));
    }
    if (data.containsKey('type_id')) {
      context.handle(_typeIdMeta,
          typeId.isAcceptableOrUnknown(data['type_id']!, _typeIdMeta));
    } else if (isInserting) {
      context.missing(_typeIdMeta);
    }
    if (data.containsKey('license_plate')) {
      context.handle(
          _licensePlateMeta,
          licensePlate.isAcceptableOrUnknown(
              data['license_plate']!, _licensePlateMeta));
    }
    if (data.containsKey('vin')) {
      context.handle(
          _vinMeta, vin.isAcceptableOrUnknown(data['vin']!, _vinMeta));
    }
    if (data.containsKey('year_manufactured')) {
      context.handle(
          _yearManufacturedMeta,
          yearManufactured.isAcceptableOrUnknown(
              data['year_manufactured']!, _yearManufacturedMeta));
    }
    if (data.containsKey('region_id')) {
      context.handle(_regionIdMeta,
          regionId.isAcceptableOrUnknown(data['region_id']!, _regionIdMeta));
    } else if (isInserting) {
      context.missing(_regionIdMeta);
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    }
    if (data.containsKey('seats')) {
      context.handle(
          _seatsMeta, seats.isAcceptableOrUnknown(data['seats']!, _seatsMeta));
    } else if (isInserting) {
      context.missing(_seatsMeta);
    }
    if (data.containsKey('is_over_seven_years')) {
      context.handle(
          _isOverSevenYearsMeta,
          isOverSevenYears.isAcceptableOrUnknown(
              data['is_over_seven_years']!, _isOverSevenYearsMeta));
    } else if (isInserting) {
      context.missing(_isOverSevenYearsMeta);
    }
    if (data.containsKey('is_other_city')) {
      context.handle(
          _isOtherCityMeta,
          isOtherCity.isAcceptableOrUnknown(
              data['is_other_city']!, _isOtherCityMeta));
    } else if (isInserting) {
      context.missing(_isOtherCityMeta);
    }
    context.handle(_vehiclesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vehicle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vehicle(
      const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}registration_certificate']),
      const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}registration_certificate_date']),
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type_id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}license_plate']),
      const StringType().mapFromDatabaseResponse(data['${effectivePrefix}vin']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}year_manufactured']),
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}region_id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}model']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}brand']),
      const IntType().mapFromDatabaseResponse(data['${effectivePrefix}seats'])!,
      const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}is_over_seven_years'])!,
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_other_city'])!,
    );
  }

  @override
  $VehiclesTable createAlias(String alias) {
    return $VehiclesTable(attachedDatabase, alias);
  }

  static TypeConverter<Vehicle, String> $converter0 = const VehicleConverter();
}

class PolicieEntrieCompanion extends UpdateCompanion<Policy> {
  final Value<int> id;
  final Value<String?> number;
  final Value<String?> signTime;
  final Value<String?> validFrom;
  final Value<String?> validTill;
  final Value<int> customerId;
  final Value<int> insuranceTypeId;
  final Value<int> cofntractTypeId;
  final Value<String?> mobileNumber;
  final Value<String?> email;
  final Value<int> notificationTypeId;
  final Value<int> promo;
  final Value<String?> filialId;
  final Value<String?> siteUserId;
  final Value<int> discountedPremium;
  final Value<int> discount;
  final Value<int> premium;
  final Value<int> paymentType;
  final Value<int> contractTypeId;
  final Value<int> insuranceCoverSum;
  final Value<Policy?> converter;
  const PolicieEntrieCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.signTime = const Value.absent(),
    this.validFrom = const Value.absent(),
    this.validTill = const Value.absent(),
    this.customerId = const Value.absent(),
    this.insuranceTypeId = const Value.absent(),
    this.cofntractTypeId = const Value.absent(),
    this.mobileNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.notificationTypeId = const Value.absent(),
    this.promo = const Value.absent(),
    this.filialId = const Value.absent(),
    this.siteUserId = const Value.absent(),
    this.discountedPremium = const Value.absent(),
    this.discount = const Value.absent(),
    this.premium = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.contractTypeId = const Value.absent(),
    this.insuranceCoverSum = const Value.absent(),
    this.converter = const Value.absent(),
  });
  PolicieEntrieCompanion.insert({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.signTime = const Value.absent(),
    this.validFrom = const Value.absent(),
    this.validTill = const Value.absent(),
    this.customerId = const Value.absent(),
    this.insuranceTypeId = const Value.absent(),
    this.cofntractTypeId = const Value.absent(),
    this.mobileNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.notificationTypeId = const Value.absent(),
    this.promo = const Value.absent(),
    this.filialId = const Value.absent(),
    this.siteUserId = const Value.absent(),
    this.discountedPremium = const Value.absent(),
    this.discount = const Value.absent(),
    this.premium = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.contractTypeId = const Value.absent(),
    this.insuranceCoverSum = const Value.absent(),
    this.converter = const Value.absent(),
  });
  static Insertable<Policy> custom({
    Expression<int>? id,
    Expression<String?>? number,
    Expression<String?>? signTime,
    Expression<String?>? validFrom,
    Expression<String?>? validTill,
    Expression<int>? customerId,
    Expression<int>? insuranceTypeId,
    Expression<int>? cofntractTypeId,
    Expression<String?>? mobileNumber,
    Expression<String?>? email,
    Expression<int>? notificationTypeId,
    Expression<int>? promo,
    Expression<String?>? filialId,
    Expression<String?>? siteUserId,
    Expression<int>? discountedPremium,
    Expression<int>? discount,
    Expression<int>? premium,
    Expression<int>? paymentType,
    Expression<int>? contractTypeId,
    Expression<int>? insuranceCoverSum,
    Expression<Policy?>? converter,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (signTime != null) 'sign_time': signTime,
      if (validFrom != null) 'valid_from': validFrom,
      if (validTill != null) 'valid_till': validTill,
      if (customerId != null) 'customer_id': customerId,
      if (insuranceTypeId != null) 'insurance_type_id': insuranceTypeId,
      if (cofntractTypeId != null) 'cofntract_type_id': cofntractTypeId,
      if (mobileNumber != null) 'mobile_number': mobileNumber,
      if (email != null) 'email': email,
      if (notificationTypeId != null)
        'notification_type_id': notificationTypeId,
      if (promo != null) 'promo': promo,
      if (filialId != null) 'filial_id': filialId,
      if (siteUserId != null) 'site_user_id': siteUserId,
      if (discountedPremium != null) 'discounted_premium': discountedPremium,
      if (discount != null) 'discount': discount,
      if (premium != null) 'premium': premium,
      if (paymentType != null) 'payment_type': paymentType,
      if (contractTypeId != null) 'contract_type_id': contractTypeId,
      if (insuranceCoverSum != null) 'insurance_cover_sum': insuranceCoverSum,
      if (converter != null) 'converter': converter,
    });
  }

  PolicieEntrieCompanion copyWith(
      {Value<int>? id,
      Value<String?>? number,
      Value<String?>? signTime,
      Value<String?>? validFrom,
      Value<String?>? validTill,
      Value<int>? customerId,
      Value<int>? insuranceTypeId,
      Value<int>? cofntractTypeId,
      Value<String?>? mobileNumber,
      Value<String?>? email,
      Value<int>? notificationTypeId,
      Value<int>? promo,
      Value<String?>? filialId,
      Value<String?>? siteUserId,
      Value<int>? discountedPremium,
      Value<int>? discount,
      Value<int>? premium,
      Value<int>? paymentType,
      Value<int>? contractTypeId,
      Value<int>? insuranceCoverSum,
      Value<Policy?>? converter}) {
    return PolicieEntrieCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      signTime: signTime ?? this.signTime,
      validFrom: validFrom ?? this.validFrom,
      validTill: validTill ?? this.validTill,
      customerId: customerId ?? this.customerId,
      insuranceTypeId: insuranceTypeId ?? this.insuranceTypeId,
      cofntractTypeId: cofntractTypeId ?? this.cofntractTypeId,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      notificationTypeId: notificationTypeId ?? this.notificationTypeId,
      promo: promo ?? this.promo,
      filialId: filialId ?? this.filialId,
      siteUserId: siteUserId ?? this.siteUserId,
      discountedPremium: discountedPremium ?? this.discountedPremium,
      discount: discount ?? this.discount,
      premium: premium ?? this.premium,
      paymentType: paymentType ?? this.paymentType,
      contractTypeId: contractTypeId ?? this.contractTypeId,
      insuranceCoverSum: insuranceCoverSum ?? this.insuranceCoverSum,
      converter: converter ?? this.converter,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<String?>(number.value);
    }
    if (signTime.present) {
      map['sign_time'] = Variable<String?>(signTime.value);
    }
    if (validFrom.present) {
      map['valid_from'] = Variable<String?>(validFrom.value);
    }
    if (validTill.present) {
      map['valid_till'] = Variable<String?>(validTill.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (insuranceTypeId.present) {
      map['insurance_type_id'] = Variable<int>(insuranceTypeId.value);
    }
    if (cofntractTypeId.present) {
      map['cofntract_type_id'] = Variable<int>(cofntractTypeId.value);
    }
    if (mobileNumber.present) {
      map['mobile_number'] = Variable<String?>(mobileNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (notificationTypeId.present) {
      map['notification_type_id'] = Variable<int>(notificationTypeId.value);
    }
    if (promo.present) {
      map['promo'] = Variable<int>(promo.value);
    }
    if (filialId.present) {
      map['filial_id'] = Variable<String?>(filialId.value);
    }
    if (siteUserId.present) {
      map['site_user_id'] = Variable<String?>(siteUserId.value);
    }
    if (discountedPremium.present) {
      map['discounted_premium'] = Variable<int>(discountedPremium.value);
    }
    if (discount.present) {
      map['discount'] = Variable<int>(discount.value);
    }
    if (premium.present) {
      map['premium'] = Variable<int>(premium.value);
    }
    if (paymentType.present) {
      map['payment_type'] = Variable<int>(paymentType.value);
    }
    if (contractTypeId.present) {
      map['contract_type_id'] = Variable<int>(contractTypeId.value);
    }
    if (insuranceCoverSum.present) {
      map['insurance_cover_sum'] = Variable<int>(insuranceCoverSum.value);
    }
    if (this.converter.present) {
      final converter = $PolicieEntrieTable.$converter0;
      map['converter'] =
          Variable<String?>(converter.mapToSql(this.converter.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PolicieEntrieCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('signTime: $signTime, ')
          ..write('validFrom: $validFrom, ')
          ..write('validTill: $validTill, ')
          ..write('customerId: $customerId, ')
          ..write('insuranceTypeId: $insuranceTypeId, ')
          ..write('cofntractTypeId: $cofntractTypeId, ')
          ..write('mobileNumber: $mobileNumber, ')
          ..write('email: $email, ')
          ..write('notificationTypeId: $notificationTypeId, ')
          ..write('promo: $promo, ')
          ..write('filialId: $filialId, ')
          ..write('siteUserId: $siteUserId, ')
          ..write('discountedPremium: $discountedPremium, ')
          ..write('discount: $discount, ')
          ..write('premium: $premium, ')
          ..write('paymentType: $paymentType, ')
          ..write('contractTypeId: $contractTypeId, ')
          ..write('insuranceCoverSum: $insuranceCoverSum, ')
          ..write('converter: $converter')
          ..write(')'))
        .toString();
  }
}

class $PolicieEntrieTable extends PolicieEntrie
    with TableInfo<$PolicieEntrieTable, Policy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PolicieEntrieTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  final VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String?> number = GeneratedColumn<String?>(
      'number', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _signTimeMeta = const VerificationMeta('signTime');
  @override
  late final GeneratedColumn<String?> signTime = GeneratedColumn<String?>(
      'sign_time', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _validFromMeta = const VerificationMeta('validFrom');
  @override
  late final GeneratedColumn<String?> validFrom = GeneratedColumn<String?>(
      'valid_from', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _validTillMeta = const VerificationMeta('validTill');
  @override
  late final GeneratedColumn<String?> validTill = GeneratedColumn<String?>(
      'valid_till', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _customerIdMeta = const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int?> customerId = GeneratedColumn<int?>(
      'customer_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _insuranceTypeIdMeta =
      const VerificationMeta('insuranceTypeId');
  @override
  late final GeneratedColumn<int?> insuranceTypeId = GeneratedColumn<int?>(
      'insurance_type_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _cofntractTypeIdMeta =
      const VerificationMeta('cofntractTypeId');
  @override
  late final GeneratedColumn<int?> cofntractTypeId = GeneratedColumn<int?>(
      'cofntract_type_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _mobileNumberMeta =
      const VerificationMeta('mobileNumber');
  @override
  late final GeneratedColumn<String?> mobileNumber = GeneratedColumn<String?>(
      'mobile_number', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _notificationTypeIdMeta =
      const VerificationMeta('notificationTypeId');
  @override
  late final GeneratedColumn<int?> notificationTypeId = GeneratedColumn<int?>(
      'notification_type_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _promoMeta = const VerificationMeta('promo');
  @override
  late final GeneratedColumn<int?> promo = GeneratedColumn<int?>(
      'promo', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _filialIdMeta = const VerificationMeta('filialId');
  @override
  late final GeneratedColumn<String?> filialId = GeneratedColumn<String?>(
      'filial_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _siteUserIdMeta = const VerificationMeta('siteUserId');
  @override
  late final GeneratedColumn<String?> siteUserId = GeneratedColumn<String?>(
      'site_user_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _discountedPremiumMeta =
      const VerificationMeta('discountedPremium');
  @override
  late final GeneratedColumn<int?> discountedPremium = GeneratedColumn<int?>(
      'discounted_premium', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _discountMeta = const VerificationMeta('discount');
  @override
  late final GeneratedColumn<int?> discount = GeneratedColumn<int?>(
      'discount', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _premiumMeta = const VerificationMeta('premium');
  @override
  late final GeneratedColumn<int?> premium = GeneratedColumn<int?>(
      'premium', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _paymentTypeMeta =
      const VerificationMeta('paymentType');
  @override
  late final GeneratedColumn<int?> paymentType = GeneratedColumn<int?>(
      'payment_type', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _contractTypeIdMeta =
      const VerificationMeta('contractTypeId');
  @override
  late final GeneratedColumn<int?> contractTypeId = GeneratedColumn<int?>(
      'contract_type_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _insuranceCoverSumMeta =
      const VerificationMeta('insuranceCoverSum');
  @override
  late final GeneratedColumn<int?> insuranceCoverSum = GeneratedColumn<int?>(
      'insurance_cover_sum', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _converterMeta = const VerificationMeta('converter');
  @override
  late final GeneratedColumnWithTypeConverter<Policy, String?> converter =
      GeneratedColumn<String?>('converter', aliasedName, true,
              type: const StringType(), requiredDuringInsert: false)
          .withConverter<Policy>($PolicieEntrieTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        number,
        signTime,
        validFrom,
        validTill,
        customerId,
        insuranceTypeId,
        cofntractTypeId,
        mobileNumber,
        email,
        notificationTypeId,
        promo,
        filialId,
        siteUserId,
        discountedPremium,
        discount,
        premium,
        paymentType,
        contractTypeId,
        insuranceCoverSum,
        converter
      ];
  @override
  String get aliasedName => _alias ?? 'policie_entrie';
  @override
  String get actualTableName => 'policie_entrie';
  @override
  VerificationContext validateIntegrity(Insertable<Policy> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    }
    if (data.containsKey('sign_time')) {
      context.handle(_signTimeMeta,
          signTime.isAcceptableOrUnknown(data['sign_time']!, _signTimeMeta));
    }
    if (data.containsKey('valid_from')) {
      context.handle(_validFromMeta,
          validFrom.isAcceptableOrUnknown(data['valid_from']!, _validFromMeta));
    }
    if (data.containsKey('valid_till')) {
      context.handle(_validTillMeta,
          validTill.isAcceptableOrUnknown(data['valid_till']!, _validTillMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    }
    if (data.containsKey('insurance_type_id')) {
      context.handle(
          _insuranceTypeIdMeta,
          insuranceTypeId.isAcceptableOrUnknown(
              data['insurance_type_id']!, _insuranceTypeIdMeta));
    }
    if (data.containsKey('cofntract_type_id')) {
      context.handle(
          _cofntractTypeIdMeta,
          cofntractTypeId.isAcceptableOrUnknown(
              data['cofntract_type_id']!, _cofntractTypeIdMeta));
    }
    if (data.containsKey('mobile_number')) {
      context.handle(
          _mobileNumberMeta,
          mobileNumber.isAcceptableOrUnknown(
              data['mobile_number']!, _mobileNumberMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('notification_type_id')) {
      context.handle(
          _notificationTypeIdMeta,
          notificationTypeId.isAcceptableOrUnknown(
              data['notification_type_id']!, _notificationTypeIdMeta));
    }
    if (data.containsKey('promo')) {
      context.handle(
          _promoMeta, promo.isAcceptableOrUnknown(data['promo']!, _promoMeta));
    }
    if (data.containsKey('filial_id')) {
      context.handle(_filialIdMeta,
          filialId.isAcceptableOrUnknown(data['filial_id']!, _filialIdMeta));
    }
    if (data.containsKey('site_user_id')) {
      context.handle(
          _siteUserIdMeta,
          siteUserId.isAcceptableOrUnknown(
              data['site_user_id']!, _siteUserIdMeta));
    }
    if (data.containsKey('discounted_premium')) {
      context.handle(
          _discountedPremiumMeta,
          discountedPremium.isAcceptableOrUnknown(
              data['discounted_premium']!, _discountedPremiumMeta));
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('premium')) {
      context.handle(_premiumMeta,
          premium.isAcceptableOrUnknown(data['premium']!, _premiumMeta));
    }
    if (data.containsKey('payment_type')) {
      context.handle(
          _paymentTypeMeta,
          paymentType.isAcceptableOrUnknown(
              data['payment_type']!, _paymentTypeMeta));
    }
    if (data.containsKey('contract_type_id')) {
      context.handle(
          _contractTypeIdMeta,
          contractTypeId.isAcceptableOrUnknown(
              data['contract_type_id']!, _contractTypeIdMeta));
    }
    if (data.containsKey('insurance_cover_sum')) {
      context.handle(
          _insuranceCoverSumMeta,
          insuranceCoverSum.isAcceptableOrUnknown(
              data['insurance_cover_sum']!, _insuranceCoverSumMeta));
    }
    context.handle(_converterMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Policy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Policy(
        const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}number']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}sign_time']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}valid_from']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}valid_till']),
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}customer_id'])!,
        const IntType().mapFromDatabaseResponse(
            data['${effectivePrefix}insurance_type_id'])!,
        const IntType().mapFromDatabaseResponse(
            data['${effectivePrefix}contract_type_id'])!,
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}mobile_number']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}email']),
        const IntType().mapFromDatabaseResponse(
            data['${effectivePrefix}notification_type_id'])!,
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}promo'])!,
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}filial_id']),
        const IntType().mapFromDatabaseResponse(
            data['${effectivePrefix}discounted_premium'])!,
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}discount'])!,
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}premium'])!,
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}payment_type'])!,
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}site_user_id']),
        const IntType().mapFromDatabaseResponse(
            data['${effectivePrefix}insurance_cover_sum'])!,
        null,
        [],
        []);
  }

  @override
  $PolicieEntrieTable createAlias(String alias) {
    return $PolicieEntrieTable(attachedDatabase, alias);
  }

  static TypeConverter<Policy, String> $converter0 = const PolicyConverter();
}

class ClientPolicyEntrie extends DataClass
    implements Insertable<ClientPolicyEntrie> {
  final int policy;
  final int client;
  ClientPolicyEntrie({required this.policy, required this.client});
  factory ClientPolicyEntrie.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ClientPolicyEntrie(
      policy: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}policy'])!,
      client: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}client'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['policy'] = Variable<int>(policy);
    map['client'] = Variable<int>(client);
    return map;
  }

  ClientPolicyEntriesCompanion toCompanion(bool nullToAbsent) {
    return ClientPolicyEntriesCompanion(
      policy: Value(policy),
      client: Value(client),
    );
  }

  factory ClientPolicyEntrie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientPolicyEntrie(
      policy: serializer.fromJson<int>(json['policy']),
      client: serializer.fromJson<int>(json['client']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'policy': serializer.toJson<int>(policy),
      'client': serializer.toJson<int>(client),
    };
  }

  ClientPolicyEntrie copyWith({int? policy, int? client}) => ClientPolicyEntrie(
        policy: policy ?? this.policy,
        client: client ?? this.client,
      );
  @override
  String toString() {
    return (StringBuffer('ClientPolicyEntrie(')
          ..write('policy: $policy, ')
          ..write('client: $client')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(policy, client);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientPolicyEntrie &&
          other.policy == this.policy &&
          other.client == this.client);
}

class ClientPolicyEntriesCompanion extends UpdateCompanion<ClientPolicyEntrie> {
  final Value<int> policy;
  final Value<int> client;
  const ClientPolicyEntriesCompanion({
    this.policy = const Value.absent(),
    this.client = const Value.absent(),
  });
  ClientPolicyEntriesCompanion.insert({
    required int policy,
    required int client,
  })  : policy = Value(policy),
        client = Value(client);
  static Insertable<ClientPolicyEntrie> custom({
    Expression<int>? policy,
    Expression<int>? client,
  }) {
    return RawValuesInsertable({
      if (policy != null) 'policy': policy,
      if (client != null) 'client': client,
    });
  }

  ClientPolicyEntriesCompanion copyWith(
      {Value<int>? policy, Value<int>? client}) {
    return ClientPolicyEntriesCompanion(
      policy: policy ?? this.policy,
      client: client ?? this.client,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (policy.present) {
      map['policy'] = Variable<int>(policy.value);
    }
    if (client.present) {
      map['client'] = Variable<int>(client.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientPolicyEntriesCompanion(')
          ..write('policy: $policy, ')
          ..write('client: $client')
          ..write(')'))
        .toString();
  }
}

class $ClientPolicyEntriesTable extends ClientPolicyEntries
    with TableInfo<$ClientPolicyEntriesTable, ClientPolicyEntrie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientPolicyEntriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _policyMeta = const VerificationMeta('policy');
  @override
  late final GeneratedColumn<int?> policy = GeneratedColumn<int?>(
      'policy', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _clientMeta = const VerificationMeta('client');
  @override
  late final GeneratedColumn<int?> client = GeneratedColumn<int?>(
      'client', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [policy, client];
  @override
  String get aliasedName => _alias ?? 'client_policy_entries';
  @override
  String get actualTableName => 'client_policy_entries';
  @override
  VerificationContext validateIntegrity(Insertable<ClientPolicyEntrie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('policy')) {
      context.handle(_policyMeta,
          policy.isAcceptableOrUnknown(data['policy']!, _policyMeta));
    } else if (isInserting) {
      context.missing(_policyMeta);
    }
    if (data.containsKey('client')) {
      context.handle(_clientMeta,
          client.isAcceptableOrUnknown(data['client']!, _clientMeta));
    } else if (isInserting) {
      context.missing(_clientMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {client, policy};
  @override
  ClientPolicyEntrie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ClientPolicyEntrie.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ClientPolicyEntriesTable createAlias(String alias) {
    return $ClientPolicyEntriesTable(attachedDatabase, alias);
  }
}

class VehiclePolicyEntrie extends DataClass
    implements Insertable<VehiclePolicyEntrie> {
  final int policy;
  final int vehicle;
  VehiclePolicyEntrie({required this.policy, required this.vehicle});
  factory VehiclePolicyEntrie.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return VehiclePolicyEntrie(
      policy: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}policy'])!,
      vehicle: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vehicle'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['policy'] = Variable<int>(policy);
    map['vehicle'] = Variable<int>(vehicle);
    return map;
  }

  VehiclePolicyEntriesCompanion toCompanion(bool nullToAbsent) {
    return VehiclePolicyEntriesCompanion(
      policy: Value(policy),
      vehicle: Value(vehicle),
    );
  }

  factory VehiclePolicyEntrie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehiclePolicyEntrie(
      policy: serializer.fromJson<int>(json['policy']),
      vehicle: serializer.fromJson<int>(json['vehicle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'policy': serializer.toJson<int>(policy),
      'vehicle': serializer.toJson<int>(vehicle),
    };
  }

  VehiclePolicyEntrie copyWith({int? policy, int? vehicle}) =>
      VehiclePolicyEntrie(
        policy: policy ?? this.policy,
        vehicle: vehicle ?? this.vehicle,
      );
  @override
  String toString() {
    return (StringBuffer('VehiclePolicyEntrie(')
          ..write('policy: $policy, ')
          ..write('vehicle: $vehicle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(policy, vehicle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehiclePolicyEntrie &&
          other.policy == this.policy &&
          other.vehicle == this.vehicle);
}

class VehiclePolicyEntriesCompanion
    extends UpdateCompanion<VehiclePolicyEntrie> {
  final Value<int> policy;
  final Value<int> vehicle;
  const VehiclePolicyEntriesCompanion({
    this.policy = const Value.absent(),
    this.vehicle = const Value.absent(),
  });
  VehiclePolicyEntriesCompanion.insert({
    required int policy,
    required int vehicle,
  })  : policy = Value(policy),
        vehicle = Value(vehicle);
  static Insertable<VehiclePolicyEntrie> custom({
    Expression<int>? policy,
    Expression<int>? vehicle,
  }) {
    return RawValuesInsertable({
      if (policy != null) 'policy': policy,
      if (vehicle != null) 'vehicle': vehicle,
    });
  }

  VehiclePolicyEntriesCompanion copyWith(
      {Value<int>? policy, Value<int>? vehicle}) {
    return VehiclePolicyEntriesCompanion(
      policy: policy ?? this.policy,
      vehicle: vehicle ?? this.vehicle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (policy.present) {
      map['policy'] = Variable<int>(policy.value);
    }
    if (vehicle.present) {
      map['vehicle'] = Variable<int>(vehicle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehiclePolicyEntriesCompanion(')
          ..write('policy: $policy, ')
          ..write('vehicle: $vehicle')
          ..write(')'))
        .toString();
  }
}

class $VehiclePolicyEntriesTable extends VehiclePolicyEntries
    with TableInfo<$VehiclePolicyEntriesTable, VehiclePolicyEntrie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehiclePolicyEntriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _policyMeta = const VerificationMeta('policy');
  @override
  late final GeneratedColumn<int?> policy = GeneratedColumn<int?>(
      'policy', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _vehicleMeta = const VerificationMeta('vehicle');
  @override
  late final GeneratedColumn<int?> vehicle = GeneratedColumn<int?>(
      'vehicle', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [policy, vehicle];
  @override
  String get aliasedName => _alias ?? 'vehicle_policy_entries';
  @override
  String get actualTableName => 'vehicle_policy_entries';
  @override
  VerificationContext validateIntegrity(
      Insertable<VehiclePolicyEntrie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('policy')) {
      context.handle(_policyMeta,
          policy.isAcceptableOrUnknown(data['policy']!, _policyMeta));
    } else if (isInserting) {
      context.missing(_policyMeta);
    }
    if (data.containsKey('vehicle')) {
      context.handle(_vehicleMeta,
          vehicle.isAcceptableOrUnknown(data['vehicle']!, _vehicleMeta));
    } else if (isInserting) {
      context.missing(_vehicleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {policy, vehicle};
  @override
  VehiclePolicyEntrie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return VehiclePolicyEntrie.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $VehiclePolicyEntriesTable createAlias(String alias) {
    return $VehiclePolicyEntriesTable(attachedDatabase, alias);
  }
}

class TourismEntriesCompanion extends UpdateCompanion<Tourism> {
  final Value<int> id;
  final Value<String?> number;
  final Value<String?> signTime;
  final Value<String?> validFrom;
  final Value<String?> validTill;
  final Value<int?> customerId;
  final Value<String?> insuranceTypeId;
  final Value<int?> contractTypeId;
  final Value<String?> mobileNumber;
  final Value<String?> email;
  final Value<int?> notificationTypeId;
  final Value<String?> promo;
  final Value<String?> filialId;
  final Value<String?> siteUserId;
  final Value<int?> discount;
  final Value<int?> insuranceAmount;
  final Value<int?> premium;
  final Value<int?> insuredCount;
  final Value<bool?> isMultitrip;
  final Value<String?> promoCode;
  final Value<int?> purposeId;
  final Value<int?> regionId;
  final Value<int?> franchiseId;
  final Value<int?> sportId;
  final Value<int?> sportCategoryId;
  final Value<int?> multitripProgrammeId;
  final Value<int?> insuranceAmountId;
  final Value<int?> ageGroupId;
  final Value<bool?> insurantTravels;
  final Value<bool?> isCovid;
  final Value<String?> covidLimit;
  const TourismEntriesCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.signTime = const Value.absent(),
    this.validFrom = const Value.absent(),
    this.validTill = const Value.absent(),
    this.customerId = const Value.absent(),
    this.insuranceTypeId = const Value.absent(),
    this.contractTypeId = const Value.absent(),
    this.mobileNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.notificationTypeId = const Value.absent(),
    this.promo = const Value.absent(),
    this.filialId = const Value.absent(),
    this.siteUserId = const Value.absent(),
    this.discount = const Value.absent(),
    this.insuranceAmount = const Value.absent(),
    this.premium = const Value.absent(),
    this.insuredCount = const Value.absent(),
    this.isMultitrip = const Value.absent(),
    this.promoCode = const Value.absent(),
    this.purposeId = const Value.absent(),
    this.regionId = const Value.absent(),
    this.franchiseId = const Value.absent(),
    this.sportId = const Value.absent(),
    this.sportCategoryId = const Value.absent(),
    this.multitripProgrammeId = const Value.absent(),
    this.insuranceAmountId = const Value.absent(),
    this.ageGroupId = const Value.absent(),
    this.insurantTravels = const Value.absent(),
    this.isCovid = const Value.absent(),
    this.covidLimit = const Value.absent(),
  });
  TourismEntriesCompanion.insert({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.signTime = const Value.absent(),
    this.validFrom = const Value.absent(),
    this.validTill = const Value.absent(),
    this.customerId = const Value.absent(),
    this.insuranceTypeId = const Value.absent(),
    this.contractTypeId = const Value.absent(),
    this.mobileNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.notificationTypeId = const Value.absent(),
    this.promo = const Value.absent(),
    this.filialId = const Value.absent(),
    this.siteUserId = const Value.absent(),
    this.discount = const Value.absent(),
    this.insuranceAmount = const Value.absent(),
    this.premium = const Value.absent(),
    this.insuredCount = const Value.absent(),
    this.isMultitrip = const Value.absent(),
    this.promoCode = const Value.absent(),
    this.purposeId = const Value.absent(),
    this.regionId = const Value.absent(),
    this.franchiseId = const Value.absent(),
    this.sportId = const Value.absent(),
    this.sportCategoryId = const Value.absent(),
    this.multitripProgrammeId = const Value.absent(),
    this.insuranceAmountId = const Value.absent(),
    this.ageGroupId = const Value.absent(),
    this.insurantTravels = const Value.absent(),
    this.isCovid = const Value.absent(),
    this.covidLimit = const Value.absent(),
  });
  static Insertable<Tourism> custom({
    Expression<int>? id,
    Expression<String?>? number,
    Expression<String?>? signTime,
    Expression<String?>? validFrom,
    Expression<String?>? validTill,
    Expression<int?>? customerId,
    Expression<String?>? insuranceTypeId,
    Expression<int?>? contractTypeId,
    Expression<String?>? mobileNumber,
    Expression<String?>? email,
    Expression<int?>? notificationTypeId,
    Expression<String?>? promo,
    Expression<String?>? filialId,
    Expression<String?>? siteUserId,
    Expression<int?>? discount,
    Expression<int?>? insuranceAmount,
    Expression<int?>? premium,
    Expression<int?>? insuredCount,
    Expression<bool?>? isMultitrip,
    Expression<String?>? promoCode,
    Expression<int?>? purposeId,
    Expression<int?>? regionId,
    Expression<int?>? franchiseId,
    Expression<int?>? sportId,
    Expression<int?>? sportCategoryId,
    Expression<int?>? multitripProgrammeId,
    Expression<int?>? insuranceAmountId,
    Expression<int?>? ageGroupId,
    Expression<bool?>? insurantTravels,
    Expression<bool?>? isCovid,
    Expression<String?>? covidLimit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (signTime != null) 'sign_time': signTime,
      if (validFrom != null) 'valid_from': validFrom,
      if (validTill != null) 'valid_till': validTill,
      if (customerId != null) 'customer_id': customerId,
      if (insuranceTypeId != null) 'insurance_type_id': insuranceTypeId,
      if (contractTypeId != null) 'contract_type_id': contractTypeId,
      if (mobileNumber != null) 'mobile_number': mobileNumber,
      if (email != null) 'email': email,
      if (notificationTypeId != null)
        'notification_type_id': notificationTypeId,
      if (promo != null) 'promo': promo,
      if (filialId != null) 'filial_id': filialId,
      if (siteUserId != null) 'site_user_id': siteUserId,
      if (discount != null) 'discount': discount,
      if (insuranceAmount != null) 'insurance_amount': insuranceAmount,
      if (premium != null) 'premium': premium,
      if (insuredCount != null) 'insured_count': insuredCount,
      if (isMultitrip != null) 'is_multitrip': isMultitrip,
      if (promoCode != null) 'promo_code': promoCode,
      if (purposeId != null) 'purpose_id': purposeId,
      if (regionId != null) 'region_id': regionId,
      if (franchiseId != null) 'franchise_id': franchiseId,
      if (sportId != null) 'sport_id': sportId,
      if (sportCategoryId != null) 'sport_category_id': sportCategoryId,
      if (multitripProgrammeId != null)
        'multitrip_programme_id': multitripProgrammeId,
      if (insuranceAmountId != null) 'insurance_amount_id': insuranceAmountId,
      if (ageGroupId != null) 'age_group_id': ageGroupId,
      if (insurantTravels != null) 'insurant_travels': insurantTravels,
      if (isCovid != null) 'is_covid': isCovid,
      if (covidLimit != null) 'covid_limit': covidLimit,
    });
  }

  TourismEntriesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? number,
      Value<String?>? signTime,
      Value<String?>? validFrom,
      Value<String?>? validTill,
      Value<int?>? customerId,
      Value<String?>? insuranceTypeId,
      Value<int?>? contractTypeId,
      Value<String?>? mobileNumber,
      Value<String?>? email,
      Value<int?>? notificationTypeId,
      Value<String?>? promo,
      Value<String?>? filialId,
      Value<String?>? siteUserId,
      Value<int?>? discount,
      Value<int?>? insuranceAmount,
      Value<int?>? premium,
      Value<int?>? insuredCount,
      Value<bool?>? isMultitrip,
      Value<String?>? promoCode,
      Value<int?>? purposeId,
      Value<int?>? regionId,
      Value<int?>? franchiseId,
      Value<int?>? sportId,
      Value<int?>? sportCategoryId,
      Value<int?>? multitripProgrammeId,
      Value<int?>? insuranceAmountId,
      Value<int?>? ageGroupId,
      Value<bool?>? insurantTravels,
      Value<bool?>? isCovid,
      Value<String?>? covidLimit}) {
    return TourismEntriesCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      signTime: signTime ?? this.signTime,
      validFrom: validFrom ?? this.validFrom,
      validTill: validTill ?? this.validTill,
      customerId: customerId ?? this.customerId,
      insuranceTypeId: insuranceTypeId ?? this.insuranceTypeId,
      contractTypeId: contractTypeId ?? this.contractTypeId,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      notificationTypeId: notificationTypeId ?? this.notificationTypeId,
      promo: promo ?? this.promo,
      filialId: filialId ?? this.filialId,
      siteUserId: siteUserId ?? this.siteUserId,
      discount: discount ?? this.discount,
      insuranceAmount: insuranceAmount ?? this.insuranceAmount,
      premium: premium ?? this.premium,
      insuredCount: insuredCount ?? this.insuredCount,
      isMultitrip: isMultitrip ?? this.isMultitrip,
      promoCode: promoCode ?? this.promoCode,
      purposeId: purposeId ?? this.purposeId,
      regionId: regionId ?? this.regionId,
      franchiseId: franchiseId ?? this.franchiseId,
      sportId: sportId ?? this.sportId,
      sportCategoryId: sportCategoryId ?? this.sportCategoryId,
      multitripProgrammeId: multitripProgrammeId ?? this.multitripProgrammeId,
      insuranceAmountId: insuranceAmountId ?? this.insuranceAmountId,
      ageGroupId: ageGroupId ?? this.ageGroupId,
      insurantTravels: insurantTravels ?? this.insurantTravels,
      isCovid: isCovid ?? this.isCovid,
      covidLimit: covidLimit ?? this.covidLimit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<String?>(number.value);
    }
    if (signTime.present) {
      map['sign_time'] = Variable<String?>(signTime.value);
    }
    if (validFrom.present) {
      map['valid_from'] = Variable<String?>(validFrom.value);
    }
    if (validTill.present) {
      map['valid_till'] = Variable<String?>(validTill.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int?>(customerId.value);
    }
    if (insuranceTypeId.present) {
      map['insurance_type_id'] = Variable<String?>(insuranceTypeId.value);
    }
    if (contractTypeId.present) {
      map['contract_type_id'] = Variable<int?>(contractTypeId.value);
    }
    if (mobileNumber.present) {
      map['mobile_number'] = Variable<String?>(mobileNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (notificationTypeId.present) {
      map['notification_type_id'] = Variable<int?>(notificationTypeId.value);
    }
    if (promo.present) {
      map['promo'] = Variable<String?>(promo.value);
    }
    if (filialId.present) {
      map['filial_id'] = Variable<String?>(filialId.value);
    }
    if (siteUserId.present) {
      map['site_user_id'] = Variable<String?>(siteUserId.value);
    }
    if (discount.present) {
      map['discount'] = Variable<int?>(discount.value);
    }
    if (insuranceAmount.present) {
      map['insurance_amount'] = Variable<int?>(insuranceAmount.value);
    }
    if (premium.present) {
      map['premium'] = Variable<int?>(premium.value);
    }
    if (insuredCount.present) {
      map['insured_count'] = Variable<int?>(insuredCount.value);
    }
    if (isMultitrip.present) {
      map['is_multitrip'] = Variable<bool?>(isMultitrip.value);
    }
    if (promoCode.present) {
      map['promo_code'] = Variable<String?>(promoCode.value);
    }
    if (purposeId.present) {
      map['purpose_id'] = Variable<int?>(purposeId.value);
    }
    if (regionId.present) {
      map['region_id'] = Variable<int?>(regionId.value);
    }
    if (franchiseId.present) {
      map['franchise_id'] = Variable<int?>(franchiseId.value);
    }
    if (sportId.present) {
      map['sport_id'] = Variable<int?>(sportId.value);
    }
    if (sportCategoryId.present) {
      map['sport_category_id'] = Variable<int?>(sportCategoryId.value);
    }
    if (multitripProgrammeId.present) {
      map['multitrip_programme_id'] =
          Variable<int?>(multitripProgrammeId.value);
    }
    if (insuranceAmountId.present) {
      map['insurance_amount_id'] = Variable<int?>(insuranceAmountId.value);
    }
    if (ageGroupId.present) {
      map['age_group_id'] = Variable<int?>(ageGroupId.value);
    }
    if (insurantTravels.present) {
      map['insurant_travels'] = Variable<bool?>(insurantTravels.value);
    }
    if (isCovid.present) {
      map['is_covid'] = Variable<bool?>(isCovid.value);
    }
    if (covidLimit.present) {
      map['covid_limit'] = Variable<String?>(covidLimit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TourismEntriesCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('signTime: $signTime, ')
          ..write('validFrom: $validFrom, ')
          ..write('validTill: $validTill, ')
          ..write('customerId: $customerId, ')
          ..write('insuranceTypeId: $insuranceTypeId, ')
          ..write('contractTypeId: $contractTypeId, ')
          ..write('mobileNumber: $mobileNumber, ')
          ..write('email: $email, ')
          ..write('notificationTypeId: $notificationTypeId, ')
          ..write('promo: $promo, ')
          ..write('filialId: $filialId, ')
          ..write('siteUserId: $siteUserId, ')
          ..write('discount: $discount, ')
          ..write('insuranceAmount: $insuranceAmount, ')
          ..write('premium: $premium, ')
          ..write('insuredCount: $insuredCount, ')
          ..write('isMultitrip: $isMultitrip, ')
          ..write('promoCode: $promoCode, ')
          ..write('purposeId: $purposeId, ')
          ..write('regionId: $regionId, ')
          ..write('franchiseId: $franchiseId, ')
          ..write('sportId: $sportId, ')
          ..write('sportCategoryId: $sportCategoryId, ')
          ..write('multitripProgrammeId: $multitripProgrammeId, ')
          ..write('insuranceAmountId: $insuranceAmountId, ')
          ..write('ageGroupId: $ageGroupId, ')
          ..write('insurantTravels: $insurantTravels, ')
          ..write('isCovid: $isCovid, ')
          ..write('covidLimit: $covidLimit')
          ..write(')'))
        .toString();
  }
}

class $TourismEntriesTable extends TourismEntries
    with TableInfo<$TourismEntriesTable, Tourism> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TourismEntriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  final VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String?> number = GeneratedColumn<String?>(
      'number', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _signTimeMeta = const VerificationMeta('signTime');
  @override
  late final GeneratedColumn<String?> signTime = GeneratedColumn<String?>(
      'sign_time', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _validFromMeta = const VerificationMeta('validFrom');
  @override
  late final GeneratedColumn<String?> validFrom = GeneratedColumn<String?>(
      'valid_from', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _validTillMeta = const VerificationMeta('validTill');
  @override
  late final GeneratedColumn<String?> validTill = GeneratedColumn<String?>(
      'valid_till', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _customerIdMeta = const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int?> customerId = GeneratedColumn<int?>(
      'customer_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _insuranceTypeIdMeta =
      const VerificationMeta('insuranceTypeId');
  @override
  late final GeneratedColumn<String?> insuranceTypeId =
      GeneratedColumn<String?>('insurance_type_id', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _contractTypeIdMeta =
      const VerificationMeta('contractTypeId');
  @override
  late final GeneratedColumn<int?> contractTypeId = GeneratedColumn<int?>(
      'contract_type_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _mobileNumberMeta =
      const VerificationMeta('mobileNumber');
  @override
  late final GeneratedColumn<String?> mobileNumber = GeneratedColumn<String?>(
      'mobile_number', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _notificationTypeIdMeta =
      const VerificationMeta('notificationTypeId');
  @override
  late final GeneratedColumn<int?> notificationTypeId = GeneratedColumn<int?>(
      'notification_type_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _promoMeta = const VerificationMeta('promo');
  @override
  late final GeneratedColumn<String?> promo = GeneratedColumn<String?>(
      'promo', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _filialIdMeta = const VerificationMeta('filialId');
  @override
  late final GeneratedColumn<String?> filialId = GeneratedColumn<String?>(
      'filial_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _siteUserIdMeta = const VerificationMeta('siteUserId');
  @override
  late final GeneratedColumn<String?> siteUserId = GeneratedColumn<String?>(
      'site_user_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _discountMeta = const VerificationMeta('discount');
  @override
  late final GeneratedColumn<int?> discount = GeneratedColumn<int?>(
      'discount', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _insuranceAmountMeta =
      const VerificationMeta('insuranceAmount');
  @override
  late final GeneratedColumn<int?> insuranceAmount = GeneratedColumn<int?>(
      'insurance_amount', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _premiumMeta = const VerificationMeta('premium');
  @override
  late final GeneratedColumn<int?> premium = GeneratedColumn<int?>(
      'premium', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _insuredCountMeta =
      const VerificationMeta('insuredCount');
  @override
  late final GeneratedColumn<int?> insuredCount = GeneratedColumn<int?>(
      'insured_count', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _isMultitripMeta =
      const VerificationMeta('isMultitrip');
  @override
  late final GeneratedColumn<bool?> isMultitrip = GeneratedColumn<bool?>(
      'is_multitrip', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_multitrip IN (0, 1))');
  final VerificationMeta _promoCodeMeta = const VerificationMeta('promoCode');
  @override
  late final GeneratedColumn<String?> promoCode = GeneratedColumn<String?>(
      'promo_code', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _purposeIdMeta = const VerificationMeta('purposeId');
  @override
  late final GeneratedColumn<int?> purposeId = GeneratedColumn<int?>(
      'purpose_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _regionIdMeta = const VerificationMeta('regionId');
  @override
  late final GeneratedColumn<int?> regionId = GeneratedColumn<int?>(
      'region_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _franchiseIdMeta =
      const VerificationMeta('franchiseId');
  @override
  late final GeneratedColumn<int?> franchiseId = GeneratedColumn<int?>(
      'franchise_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _sportIdMeta = const VerificationMeta('sportId');
  @override
  late final GeneratedColumn<int?> sportId = GeneratedColumn<int?>(
      'sport_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _sportCategoryIdMeta =
      const VerificationMeta('sportCategoryId');
  @override
  late final GeneratedColumn<int?> sportCategoryId = GeneratedColumn<int?>(
      'sport_category_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _multitripProgrammeIdMeta =
      const VerificationMeta('multitripProgrammeId');
  @override
  late final GeneratedColumn<int?> multitripProgrammeId = GeneratedColumn<int?>(
      'multitrip_programme_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _insuranceAmountIdMeta =
      const VerificationMeta('insuranceAmountId');
  @override
  late final GeneratedColumn<int?> insuranceAmountId = GeneratedColumn<int?>(
      'insurance_amount_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _ageGroupIdMeta = const VerificationMeta('ageGroupId');
  @override
  late final GeneratedColumn<int?> ageGroupId = GeneratedColumn<int?>(
      'age_group_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _insurantTravelsMeta =
      const VerificationMeta('insurantTravels');
  @override
  late final GeneratedColumn<bool?> insurantTravels = GeneratedColumn<bool?>(
      'insurant_travels', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (insurant_travels IN (0, 1))');
  final VerificationMeta _isCovidMeta = const VerificationMeta('isCovid');
  @override
  late final GeneratedColumn<bool?> isCovid = GeneratedColumn<bool?>(
      'is_covid', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_covid IN (0, 1))');
  final VerificationMeta _covidLimitMeta = const VerificationMeta('covidLimit');
  @override
  late final GeneratedColumn<String?> covidLimit = GeneratedColumn<String?>(
      'covid_limit', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        number,
        signTime,
        validFrom,
        validTill,
        customerId,
        insuranceTypeId,
        contractTypeId,
        mobileNumber,
        email,
        notificationTypeId,
        promo,
        filialId,
        siteUserId,
        discount,
        insuranceAmount,
        premium,
        insuredCount,
        isMultitrip,
        promoCode,
        purposeId,
        regionId,
        franchiseId,
        sportId,
        sportCategoryId,
        multitripProgrammeId,
        insuranceAmountId,
        ageGroupId,
        insurantTravels,
        isCovid,
        covidLimit
      ];
  @override
  String get aliasedName => _alias ?? 'tourism_entries';
  @override
  String get actualTableName => 'tourism_entries';
  @override
  VerificationContext validateIntegrity(Insertable<Tourism> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    }
    if (data.containsKey('sign_time')) {
      context.handle(_signTimeMeta,
          signTime.isAcceptableOrUnknown(data['sign_time']!, _signTimeMeta));
    }
    if (data.containsKey('valid_from')) {
      context.handle(_validFromMeta,
          validFrom.isAcceptableOrUnknown(data['valid_from']!, _validFromMeta));
    }
    if (data.containsKey('valid_till')) {
      context.handle(_validTillMeta,
          validTill.isAcceptableOrUnknown(data['valid_till']!, _validTillMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    }
    if (data.containsKey('insurance_type_id')) {
      context.handle(
          _insuranceTypeIdMeta,
          insuranceTypeId.isAcceptableOrUnknown(
              data['insurance_type_id']!, _insuranceTypeIdMeta));
    }
    if (data.containsKey('contract_type_id')) {
      context.handle(
          _contractTypeIdMeta,
          contractTypeId.isAcceptableOrUnknown(
              data['contract_type_id']!, _contractTypeIdMeta));
    }
    if (data.containsKey('mobile_number')) {
      context.handle(
          _mobileNumberMeta,
          mobileNumber.isAcceptableOrUnknown(
              data['mobile_number']!, _mobileNumberMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('notification_type_id')) {
      context.handle(
          _notificationTypeIdMeta,
          notificationTypeId.isAcceptableOrUnknown(
              data['notification_type_id']!, _notificationTypeIdMeta));
    }
    if (data.containsKey('promo')) {
      context.handle(
          _promoMeta, promo.isAcceptableOrUnknown(data['promo']!, _promoMeta));
    }
    if (data.containsKey('filial_id')) {
      context.handle(_filialIdMeta,
          filialId.isAcceptableOrUnknown(data['filial_id']!, _filialIdMeta));
    }
    if (data.containsKey('site_user_id')) {
      context.handle(
          _siteUserIdMeta,
          siteUserId.isAcceptableOrUnknown(
              data['site_user_id']!, _siteUserIdMeta));
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('insurance_amount')) {
      context.handle(
          _insuranceAmountMeta,
          insuranceAmount.isAcceptableOrUnknown(
              data['insurance_amount']!, _insuranceAmountMeta));
    }
    if (data.containsKey('premium')) {
      context.handle(_premiumMeta,
          premium.isAcceptableOrUnknown(data['premium']!, _premiumMeta));
    }
    if (data.containsKey('insured_count')) {
      context.handle(
          _insuredCountMeta,
          insuredCount.isAcceptableOrUnknown(
              data['insured_count']!, _insuredCountMeta));
    }
    if (data.containsKey('is_multitrip')) {
      context.handle(
          _isMultitripMeta,
          isMultitrip.isAcceptableOrUnknown(
              data['is_multitrip']!, _isMultitripMeta));
    }
    if (data.containsKey('promo_code')) {
      context.handle(_promoCodeMeta,
          promoCode.isAcceptableOrUnknown(data['promo_code']!, _promoCodeMeta));
    }
    if (data.containsKey('purpose_id')) {
      context.handle(_purposeIdMeta,
          purposeId.isAcceptableOrUnknown(data['purpose_id']!, _purposeIdMeta));
    }
    if (data.containsKey('region_id')) {
      context.handle(_regionIdMeta,
          regionId.isAcceptableOrUnknown(data['region_id']!, _regionIdMeta));
    }
    if (data.containsKey('franchise_id')) {
      context.handle(
          _franchiseIdMeta,
          franchiseId.isAcceptableOrUnknown(
              data['franchise_id']!, _franchiseIdMeta));
    }
    if (data.containsKey('sport_id')) {
      context.handle(_sportIdMeta,
          sportId.isAcceptableOrUnknown(data['sport_id']!, _sportIdMeta));
    }
    if (data.containsKey('sport_category_id')) {
      context.handle(
          _sportCategoryIdMeta,
          sportCategoryId.isAcceptableOrUnknown(
              data['sport_category_id']!, _sportCategoryIdMeta));
    }
    if (data.containsKey('multitrip_programme_id')) {
      context.handle(
          _multitripProgrammeIdMeta,
          multitripProgrammeId.isAcceptableOrUnknown(
              data['multitrip_programme_id']!, _multitripProgrammeIdMeta));
    }
    if (data.containsKey('insurance_amount_id')) {
      context.handle(
          _insuranceAmountIdMeta,
          insuranceAmountId.isAcceptableOrUnknown(
              data['insurance_amount_id']!, _insuranceAmountIdMeta));
    }
    if (data.containsKey('age_group_id')) {
      context.handle(
          _ageGroupIdMeta,
          ageGroupId.isAcceptableOrUnknown(
              data['age_group_id']!, _ageGroupIdMeta));
    }
    if (data.containsKey('insurant_travels')) {
      context.handle(
          _insurantTravelsMeta,
          insurantTravels.isAcceptableOrUnknown(
              data['insurant_travels']!, _insurantTravelsMeta));
    }
    if (data.containsKey('is_covid')) {
      context.handle(_isCovidMeta,
          isCovid.isAcceptableOrUnknown(data['is_covid']!, _isCovidMeta));
    }
    if (data.containsKey('covid_limit')) {
      context.handle(
          _covidLimitMeta,
          covidLimit.isAcceptableOrUnknown(
              data['covid_limit']!, _covidLimitMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tourism map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tourism(
        const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}number']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}sign_time']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}valid_from']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}valid_till']),
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}customer_id']),
        const StringType().mapFromDatabaseResponse(
            data['${effectivePrefix}insurance_type_id']),
        const IntType().mapFromDatabaseResponse(
            data['${effectivePrefix}contract_type_id']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}mobile_number']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}email']),
        const IntType().mapFromDatabaseResponse(
            data['${effectivePrefix}notification_type_id']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}promo']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}filial_id']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}site_user_id']),
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}discount']),
        const IntType().mapFromDatabaseResponse(
            data['${effectivePrefix}insurance_amount']),
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}premium']),
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}insured_count']),
        const BoolType()
            .mapFromDatabaseResponse(data['${effectivePrefix}is_multitrip']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}promo_code']),
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}purpose_id']),
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}region_id']),
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}franchise_id']),
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}sport_id']),
        const IntType().mapFromDatabaseResponse(
            data['${effectivePrefix}sport_category_id']),
        const IntType().mapFromDatabaseResponse(
            data['${effectivePrefix}multitrip_programme_id']),
        const IntType().mapFromDatabaseResponse(
            data['${effectivePrefix}insurance_amount_id']),
        const IntType()
            .mapFromDatabaseResponse(data['${effectivePrefix}age_group_id']),
        const BoolType().mapFromDatabaseResponse(
            data['${effectivePrefix}insurant_travels']),
        const BoolType()
            .mapFromDatabaseResponse(data['${effectivePrefix}is_covid']),
        const StringType()
            .mapFromDatabaseResponse(data['${effectivePrefix}covid_limit']),
        [],
        [],
        []);
  }

  @override
  $TourismEntriesTable createAlias(String alias) {
    return $TourismEntriesTable(attachedDatabase, alias);
  }
}

class InsuredListEntriesCompanion extends UpdateCompanion<InsuredList> {
  final Value<int> id;
  final Value<String?> firstName;
  final Value<String?> middleName;
  final Value<String?> lastName;
  final Value<String?> firstNameEng;
  final Value<String?> lastNameEng;
  final Value<String?> legalName;
  final Value<int> isIndividual;
  final Value<String?> iin;
  final Value<int> isResident;
  final Value<int> countryId;
  final Value<int> sexId;
  final Value<int> economicsSectorId;
  final Value<int> activityKindId;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> address;
  final Value<int> documentTypeId;
  final Value<String?> documentNumber;
  final Value<String?> documentIssueDate;
  final Value<String?> driverLicenseNumber;
  final Value<String?> driverLicenseNumberIssueDate;
  final Value<String?> classType;
  final Value<String?> birthDate;
  final Value<bool> isExperienced;
  final Value<bool> isPrivileged;
  final Value<bool> isDriver;
  final Value<bool> isInsurer;
  final Value<int?> sportId;
  final Value<int?> sportyCategoryId;
  final Value<int?> ageId;
  final Value<String?> documentGivenBy;
  const InsuredListEntriesCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.firstNameEng = const Value.absent(),
    this.lastNameEng = const Value.absent(),
    this.legalName = const Value.absent(),
    this.isIndividual = const Value.absent(),
    this.iin = const Value.absent(),
    this.isResident = const Value.absent(),
    this.countryId = const Value.absent(),
    this.sexId = const Value.absent(),
    this.economicsSectorId = const Value.absent(),
    this.activityKindId = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.documentTypeId = const Value.absent(),
    this.documentNumber = const Value.absent(),
    this.documentIssueDate = const Value.absent(),
    this.driverLicenseNumber = const Value.absent(),
    this.driverLicenseNumberIssueDate = const Value.absent(),
    this.classType = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.isExperienced = const Value.absent(),
    this.isPrivileged = const Value.absent(),
    this.isDriver = const Value.absent(),
    this.isInsurer = const Value.absent(),
    this.sportId = const Value.absent(),
    this.sportyCategoryId = const Value.absent(),
    this.ageId = const Value.absent(),
    this.documentGivenBy = const Value.absent(),
  });
  InsuredListEntriesCompanion.insert({
    required int id,
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.firstNameEng = const Value.absent(),
    this.lastNameEng = const Value.absent(),
    this.legalName = const Value.absent(),
    this.isIndividual = const Value.absent(),
    this.iin = const Value.absent(),
    this.isResident = const Value.absent(),
    this.countryId = const Value.absent(),
    this.sexId = const Value.absent(),
    this.economicsSectorId = const Value.absent(),
    this.activityKindId = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.documentTypeId = const Value.absent(),
    this.documentNumber = const Value.absent(),
    this.documentIssueDate = const Value.absent(),
    this.driverLicenseNumber = const Value.absent(),
    this.driverLicenseNumberIssueDate = const Value.absent(),
    this.classType = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.isExperienced = const Value.absent(),
    this.isPrivileged = const Value.absent(),
    this.isDriver = const Value.absent(),
    this.isInsurer = const Value.absent(),
    this.sportId = const Value.absent(),
    this.sportyCategoryId = const Value.absent(),
    this.ageId = const Value.absent(),
    this.documentGivenBy = const Value.absent(),
  }) : id = Value(id);
  static Insertable<InsuredList> custom({
    Expression<int>? id,
    Expression<String?>? firstName,
    Expression<String?>? middleName,
    Expression<String?>? lastName,
    Expression<String?>? firstNameEng,
    Expression<String?>? lastNameEng,
    Expression<String?>? legalName,
    Expression<int>? isIndividual,
    Expression<String?>? iin,
    Expression<int>? isResident,
    Expression<int>? countryId,
    Expression<int>? sexId,
    Expression<int>? economicsSectorId,
    Expression<int>? activityKindId,
    Expression<String?>? phone,
    Expression<String?>? email,
    Expression<String?>? address,
    Expression<int>? documentTypeId,
    Expression<String?>? documentNumber,
    Expression<String?>? documentIssueDate,
    Expression<String?>? driverLicenseNumber,
    Expression<String?>? driverLicenseNumberIssueDate,
    Expression<String?>? classType,
    Expression<String?>? birthDate,
    Expression<bool?>? isExperienced,
    Expression<bool?>? isPrivileged,
    Expression<bool?>? isDriver,
    Expression<bool?>? isInsurer,
    Expression<int?>? sportId,
    Expression<int?>? sportyCategoryId,
    Expression<int?>? ageId,
    Expression<String?>? documentGivenBy,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sportId != null) 'sport_id': sportId,
      if (sportyCategoryId != null) 'sporty_category_id': sportyCategoryId,
      if (ageId != null) 'age_id': ageId,
      if (birthDate != null) 'birth_date': birthDate,
      if (email != null) 'email': email,
      if (documentNumber != null) 'document_number': documentNumber,
      if (documentIssueDate != null) 'document_issue_date': documentIssueDate,
      if (documentGivenBy != null) 'document_given_by': documentGivenBy,
    });
  }

  InsuredListEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? sportId,
      Value<int?>? sportyCategoryId,
      Value<int?>? ageId,
      Value<String?>? birthDate,
      Value<String?>? email,
      Value<String?>? documentNumber,
      Value<String?>? documentIssueDate,
      Value<String?>? documentGivenBy}) {
    return InsuredListEntriesCompanion(
      id: id ?? this.id,
      sportId: sportId ?? this.sportId,
      sportyCategoryId: sportyCategoryId ?? this.sportyCategoryId,
      ageId: ageId ?? this.ageId,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      documentNumber: documentNumber ?? this.documentNumber,
      documentIssueDate: documentIssueDate ?? this.documentIssueDate,
      documentGivenBy: documentGivenBy ?? this.documentGivenBy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sportId.present) {
      map['sport_id'] = Variable<int?>(sportId.value);
    }
    if (sportyCategoryId.present) {
      map['sporty_category_id'] = Variable<int?>(sportyCategoryId.value);
    }
    if (ageId.present) {
      map['age_id'] = Variable<int?>(ageId.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<String?>(birthDate.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (documentNumber.present) {
      map['document_number'] = Variable<String?>(documentNumber.value);
    }
    if (documentIssueDate.present) {
      map['document_issue_date'] = Variable<String?>(documentIssueDate.value);
    }
    if (documentGivenBy.present) {
      map['document_given_by'] = Variable<String?>(documentGivenBy.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InsuredListEntriesCompanion(')
          ..write('id: $id, ')
          ..write('sportId: $sportId, ')
          ..write('sportyCategoryId: $sportyCategoryId, ')
          ..write('ageId: $ageId, ')
          ..write('birthDate: $birthDate, ')
          ..write('email: $email, ')
          ..write('documentNumber: $documentNumber, ')
          ..write('documentIssueDate: $documentIssueDate, ')
          ..write('documentGivenBy: $documentGivenBy')
          ..write(')'))
        .toString();
  }
}

class $InsuredListEntriesTable extends InsuredListEntries
    with TableInfo<$InsuredListEntriesTable, InsuredList> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InsuredListEntriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _sportIdMeta = const VerificationMeta('sportId');
  @override
  late final GeneratedColumn<int?> sportId = GeneratedColumn<int?>(
      'sport_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _sportyCategoryIdMeta =
      const VerificationMeta('sportyCategoryId');
  @override
  late final GeneratedColumn<int?> sportyCategoryId = GeneratedColumn<int?>(
      'sporty_category_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _ageIdMeta = const VerificationMeta('ageId');
  @override
  late final GeneratedColumn<int?> ageId = GeneratedColumn<int?>(
      'age_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _birthDateMeta = const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<String?> birthDate = GeneratedColumn<String?>(
      'birth_date', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _documentNumberMeta =
      const VerificationMeta('documentNumber');
  @override
  late final GeneratedColumn<String?> documentNumber = GeneratedColumn<String?>(
      'document_number', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _documentIssueDateMeta =
      const VerificationMeta('documentIssueDate');
  @override
  late final GeneratedColumn<String?> documentIssueDate =
      GeneratedColumn<String?>('document_issue_date', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _documentGivenByMeta =
      const VerificationMeta('documentGivenBy');
  @override
  late final GeneratedColumn<String?> documentGivenBy =
      GeneratedColumn<String?>('document_given_by', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sportId,
        sportyCategoryId,
        ageId,
        birthDate,
        email,
        documentNumber,
        documentIssueDate,
        documentGivenBy
      ];
  @override
  String get aliasedName => _alias ?? 'insured_list_entries';
  @override
  String get actualTableName => 'insured_list_entries';
  @override
  VerificationContext validateIntegrity(Insertable<InsuredList> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sport_id')) {
      context.handle(_sportIdMeta,
          sportId.isAcceptableOrUnknown(data['sport_id']!, _sportIdMeta));
    }
    if (data.containsKey('sporty_category_id')) {
      context.handle(
          _sportyCategoryIdMeta,
          sportyCategoryId.isAcceptableOrUnknown(
              data['sporty_category_id']!, _sportyCategoryIdMeta));
    }
    if (data.containsKey('age_id')) {
      context.handle(
          _ageIdMeta, ageId.isAcceptableOrUnknown(data['age_id']!, _ageIdMeta));
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('document_number')) {
      context.handle(
          _documentNumberMeta,
          documentNumber.isAcceptableOrUnknown(
              data['document_number']!, _documentNumberMeta));
    }
    if (data.containsKey('document_issue_date')) {
      context.handle(
          _documentIssueDateMeta,
          documentIssueDate.isAcceptableOrUnknown(
              data['document_issue_date']!, _documentIssueDateMeta));
    }
    if (data.containsKey('document_given_by')) {
      context.handle(
          _documentGivenByMeta,
          documentGivenBy.isAcceptableOrUnknown(
              data['document_given_by']!, _documentGivenByMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  InsuredList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InsuredList(
      const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}middle_name']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name_eng']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name_eng']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}legal_name']),
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_individual'])!,
      const StringType().mapFromDatabaseResponse(data['${effectivePrefix}iin']),
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_resident'])!,
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id'])!,
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sex_id'])!,
      const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}economics_sector_id'])!,
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}activity_kind_id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}document_type_id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}document_number']),
      const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}document_issue_date']),
      const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}driver_license_number']),
      const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}driver_license_number_issue_date']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}class_type']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_date']),
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_experienced'])!,
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_privileged'])!,
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_driver'])!,
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_insurer'])!,
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sport_id']),
      const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}sporty_category_id']),
      const IntType().mapFromDatabaseResponse(data['${effectivePrefix}age_id']),
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}document_given_by']),
    );
  }

  @override
  $InsuredListEntriesTable createAlias(String alias) {
    return $InsuredListEntriesTable(attachedDatabase, alias);
  }
}

class InsuredListTourismData extends DataClass
    implements Insertable<InsuredListTourismData> {
  final int tourism;
  final int insuredList;
  InsuredListTourismData({required this.tourism, required this.insuredList});
  factory InsuredListTourismData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return InsuredListTourismData(
      tourism: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tourism'])!,
      insuredList: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}insured_list'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tourism'] = Variable<int>(tourism);
    map['insured_list'] = Variable<int>(insuredList);
    return map;
  }

  InsuredListTourismCompanion toCompanion(bool nullToAbsent) {
    return InsuredListTourismCompanion(
      tourism: Value(tourism),
      insuredList: Value(insuredList),
    );
  }

  factory InsuredListTourismData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InsuredListTourismData(
      tourism: serializer.fromJson<int>(json['tourism']),
      insuredList: serializer.fromJson<int>(json['insuredList']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tourism': serializer.toJson<int>(tourism),
      'insuredList': serializer.toJson<int>(insuredList),
    };
  }

  InsuredListTourismData copyWith({int? tourism, int? insuredList}) =>
      InsuredListTourismData(
        tourism: tourism ?? this.tourism,
        insuredList: insuredList ?? this.insuredList,
      );
  @override
  String toString() {
    return (StringBuffer('InsuredListTourismData(')
          ..write('tourism: $tourism, ')
          ..write('insuredList: $insuredList')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tourism, insuredList);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InsuredListTourismData &&
          other.tourism == this.tourism &&
          other.insuredList == this.insuredList);
}

class InsuredListTourismCompanion
    extends UpdateCompanion<InsuredListTourismData> {
  final Value<int> tourism;
  final Value<int> insuredList;
  const InsuredListTourismCompanion({
    this.tourism = const Value.absent(),
    this.insuredList = const Value.absent(),
  });
  InsuredListTourismCompanion.insert({
    required int tourism,
    required int insuredList,
  })  : tourism = Value(tourism),
        insuredList = Value(insuredList);
  static Insertable<InsuredListTourismData> custom({
    Expression<int>? tourism,
    Expression<int>? insuredList,
  }) {
    return RawValuesInsertable({
      if (tourism != null) 'tourism': tourism,
      if (insuredList != null) 'insured_list': insuredList,
    });
  }

  InsuredListTourismCompanion copyWith(
      {Value<int>? tourism, Value<int>? insuredList}) {
    return InsuredListTourismCompanion(
      tourism: tourism ?? this.tourism,
      insuredList: insuredList ?? this.insuredList,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tourism.present) {
      map['tourism'] = Variable<int>(tourism.value);
    }
    if (insuredList.present) {
      map['insured_list'] = Variable<int>(insuredList.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InsuredListTourismCompanion(')
          ..write('tourism: $tourism, ')
          ..write('insuredList: $insuredList')
          ..write(')'))
        .toString();
  }
}

class $InsuredListTourismTable extends InsuredListTourism
    with TableInfo<$InsuredListTourismTable, InsuredListTourismData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InsuredListTourismTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _tourismMeta = const VerificationMeta('tourism');
  @override
  late final GeneratedColumn<int?> tourism = GeneratedColumn<int?>(
      'tourism', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _insuredListMeta =
      const VerificationMeta('insuredList');
  @override
  late final GeneratedColumn<int?> insuredList = GeneratedColumn<int?>(
      'insured_list', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [tourism, insuredList];
  @override
  String get aliasedName => _alias ?? 'insured_list_tourism';
  @override
  String get actualTableName => 'insured_list_tourism';
  @override
  VerificationContext validateIntegrity(
      Insertable<InsuredListTourismData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tourism')) {
      context.handle(_tourismMeta,
          tourism.isAcceptableOrUnknown(data['tourism']!, _tourismMeta));
    } else if (isInserting) {
      context.missing(_tourismMeta);
    }
    if (data.containsKey('insured_list')) {
      context.handle(
          _insuredListMeta,
          insuredList.isAcceptableOrUnknown(
              data['insured_list']!, _insuredListMeta));
    } else if (isInserting) {
      context.missing(_insuredListMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {insuredList, tourism};
  @override
  InsuredListTourismData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return InsuredListTourismData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $InsuredListTourismTable createAlias(String alias) {
    return $InsuredListTourismTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $VehiclesTable vehicles = $VehiclesTable(this);
  late final $PolicieEntrieTable policieEntrie = $PolicieEntrieTable(this);
  late final $ClientPolicyEntriesTable clientPolicyEntries =
      $ClientPolicyEntriesTable(this);
  late final $VehiclePolicyEntriesTable vehiclePolicyEntries =
      $VehiclePolicyEntriesTable(this);
  late final $TourismEntriesTable tourismEntries = $TourismEntriesTable(this);
  late final $InsuredListEntriesTable insuredListEntries =
      $InsuredListEntriesTable(this);
  late final $InsuredListTourismTable insuredListTourism =
      $InsuredListTourismTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        clients,
        vehicles,
        policieEntrie,
        clientPolicyEntries,
        vehiclePolicyEntries,
        tourismEntries,
        insuredListEntries,
        insuredListTourism
      ];
}
