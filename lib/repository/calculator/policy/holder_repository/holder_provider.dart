import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:mobile_nsk/database/database.dart';
import 'package:mobile_nsk/models/policy/clients.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';

class HolderProvider extends GetConnect {
  Future<void> getHolder(String iin, MyDatabase database, bool isDriver,
      bool isInsurer, Policy policyEntries, Policy policy) async {
    final token = await UserData().getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';
    final response = await post(
        releaseBaseUrl,
        jsonEncode({
          "type": "customer.get_full_client",
          "data": {"iin": iin}
        }));
    if (response.statusCode == 200 &&
        jsonDecode(response.bodyString!)['id'] != null) {
      database.insertNewClient(
          Client.fromJson(jsonDecode(response.bodyString!)),
          jsonDecode(response.bodyString!)["id"].hashCode,
          isDriver,
          isInsurer);
      database.insertClientPolicy(
          jsonDecode(response.bodyString!)["id"], policy.id);
    } else if (response.statusCode == 204) {
      Get.snackbar(
        "Ошибка",
        "Клиент не найден",
        );
    } else {
      Get.snackbar(
        "Ошибка",
        "ошибка запроса",
      );
    }
  }

  Future<void> setClient(
      Client client,
      bool isInsurer,
      String phone,
      String address,
      String email,
      String documentNumber,
      String documentIssueDate,
      String toNamed) async {
    final token = await UserData().getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';
    
    final response = await post(
        releaseBaseUrl,
        jsonEncode({
          "type": "customer.set_full_client",
          "data": {
            'id': client.id,
            'firstName': client.firstName,
            'middleName': client.middleName,
            'lastName': client.lastName,
            'firstNameEng': client.firstNameEng,
            'lastNameEng': client.lastNameEng,
            'legalName': client.legalName,
            'isIndividual': client.isIndividual,
            'iin': client.iin,
            'isResident': client.isResident,
            'countryId': client.countryId,
            'sexId': client.sexId,
            'economicsSectorId': client.economicsSectorId,
            'activityKindId': client.activityKindId,
            'phone': phone,
            'email': email,
            'address': address,
            'documentTypeId': client.documentTypeId,
            'documentNumber': documentNumber,
            'documentIssueDate': documentIssueDate,
            'driverLicenseNumber': client.driverLicenseNumber,
            'driverLicenseNumberIssueDate': client.driverLicenseNumberIssueDate,
            'class': client.classType,
            'birthDate': client.birthDate,
            'isExperienced': client.isExperienced,
            'isPrivileged': client.isPrivileged,
            'isDriver': client.isDriver,
            'isInsurer': client.isInsurer
          }
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept-Type": "application/json"
        });
    log(response.statusCode.toString());
    if (response.statusCode == 200 && isInsurer == true) {
      Get.toNamed(toNamed);
    } else if (response.statusCode == 200 && isInsurer == false) {
      Get.back();
    } else if (response.statusCode == 500) {
      Get.snackbar(
        "Ошибка",
        'Неверные данные',
      );
    } else {
      Get.snackbar(
        "Ошибка",
        "Ошибка подключения",
      );
    }
  }
}
