import 'package:flutter/cupertino.dart';
import 'package:mobile_nsk/database/database.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/repository/calculator/policy/vehicle_repository/vehicle_provider.dart';
TextEditingController licensePlate = TextEditingController();
class VehicleRepository {
  final MyDatabase database;
  final VehicleProvider _vehicleProvider = VehicleProvider();

  VehicleRepository(this.database);
  Future getOgpoVehicle(String text, Policy entries,  ) => _vehicleProvider.getVehicle(text, database, entries, );
}