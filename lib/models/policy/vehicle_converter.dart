import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:mobile_nsk/models/policy/vehicle.dart';

class VehicleConverter extends TypeConverter<Vehicle, String> {
  const VehicleConverter();
  @override
  Vehicle? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Vehicle.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String? mapToSql(Vehicle? value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
