import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart'as j;
import 'package:mobile_nsk/database/database.dart';
import 'package:mobile_nsk/models/policy/vehicle_converter.dart';
@UseRowClass(Vehicle)
class Vehicles extends Table{
  IntColumn get id  => integer()();
  TextColumn get registrationCertificate => text().nullable().nullable()();
  TextColumn get registrationCertificateDate => text().nullable()();
  IntColumn get typeId => integer()();
  TextColumn get licensePlate => text().nullable()();
  TextColumn get vin => text().nullable()();
  TextColumn get yearManufactured => text().nullable()();
  IntColumn get regionId => integer()();
  TextColumn get model => text().nullable()();
  TextColumn get brand => text().nullable()();
  IntColumn get seats => integer()();
  BoolColumn get isOverSevenYears => boolean()();
  BoolColumn get isOtherCity => boolean()();


  TextColumn get vehicles =>
      text().map(const VehicleConverter()).nullable()();
  @override
  Set<Column> get primaryKey => {id};
}
@j.JsonSerializable()
class Vehicle  implements Insertable<Vehicle>{
  final int id;
  final String? registrationCertificate;
  final String? registrationCertificateDate;
  final int typeId;
  final String? licensePlate;
  final String? vin;
  final String? yearManufactured;
  final int regionId;
  final String? model;
  final String? brand;
  final int seats;
  final bool isOverSevenYears;
  final bool isOtherCity;
  Vehicle(this.id, this.registrationCertificate,
      this.registrationCertificateDate, this.typeId,
      this.licensePlate, this.vin, this.yearManufactured, this.regionId, this.model, this.brand, this.seats, this.isOverSevenYears, this.isOtherCity);
  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    json['id'] as int,
    json['registrationCertificate'] as String? ,
    json['registrationCertificateDate'] as String? ,
    json['typeId'] as int,
    json['licensePlate'] as String? ,
    json['vin'] as String? ,
    json['yearManufactured'] as String? ,
    json['regionId'] as int,
    json['model'] as String?,
    json['brand'] as String? ,
    json['seats'] as int,
    json['isOverSevenYears'] as bool,
    json['isOtherCity'] as bool,
  );
  Map<String, dynamic>toJson()=>{
    'id': id,
    'registrationCertificate': registrationCertificate,
    'registrationCertificateDate': registrationCertificateDate,
    'typeId': typeId,
    'licensePlate': licensePlate,
    'vin': vin,
    'yearManufactured': yearManufactured,
    'regionId': regionId,
    'model': model,
    'brand': brand,
    'seats': seats,
    'isOverSevenYears':isOverSevenYears,
    'isOtherCity': isOtherCity,
  };
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return VehiclesCompanion(
      id: Value(id),
      registrationCertificate: Value(registrationCertificate),
      registrationCertificateDate: Value(registrationCertificateDate),
      typeId: Value(typeId),
      licensePlate: Value(licensePlate),
      vin: Value(vin),
      yearManufactured: Value(yearManufactured),
      regionId: Value(regionId),
      model: Value(model),
      brand: Value(brand),
      seats: Value(seats),
      isOverSevenYears: Value(isOverSevenYears),
      isOtherCity: Value(isOtherCity)
    ).toColumns(nullToAbsent);
  }

}