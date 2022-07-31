import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile_nsk/database/database.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/models/policy/vehicle.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';

class VehicleProvider extends GetConnect {
  Future<void> getVehicle(
    String licensePlate,
    MyDatabase database,
    Policy policyEntries,
  ) async {
    final token = await UserData().getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';
    final response = await post(
        releaseBaseUrl,
        jsonEncode({
          "type": "vehicle.get_ogpo_vehicle",
          "data": {"licensePlate": licensePlate}
        })).timeout(const Duration(seconds: 20));
    if (response.statusCode == 200) {
      await database
          .insertNewVehicle(Vehicle.fromJson(jsonDecode(response.bodyString!)));
      await database.insertVehiclePolicy(
          jsonDecode(response.bodyString!)["id"], policyEntries);
    } else {
      log(response.bodyString.toString());
      log(response.statusCode.toString());
      Get.snackbar(
        "Ошибка",
        "ТС не найден",
      );
    }
  }
}
