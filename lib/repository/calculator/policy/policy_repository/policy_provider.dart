import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/policy/archive_policy.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';

class PolicyProvider extends GetConnect {
  Future<void> calculateOgpo(
      Policy policy, String validFrom, String validTill) async {
    final body = Policy(
        policy.id,
        policy.number,
        policy.signTime,
        validFrom,
        validTill,
        policy.customerId,
        policy.insuranceTypeId,
        policy.contractTypeId,
        policy.mobileNumber,
        policy.email,
        policy.notificationTypeId,
        policy.promo,
        policy.filialId,
        policy.discountedPremium,
        policy.discount,
        policy.premium,
        policy.paymentType,
        policy.siteUserId,
        policy.insuranceCoverSum,
        policy.drivers.where((element) => element.isInsurer == true).single,
        policy.drivers,
        policy.vehicles);

    final token = await UserData().getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';

    final response = await post(releaseBaseUrl,
        jsonEncode({"type": "contract.calculate_osago", "data": body}),
        headers: {
          "Content-Type": "application/json",
          "Accept-Type": "application/json"
        });
    log(response.statusCode.toString());
    log('Body: ' + response.bodyString!);
    if (response.statusCode == 200) {
      database.updatePremium(
          policy,
          jsonDecode(response.bodyString!)['premium'],
          jsonDecode(response.bodyString!)['discountedPremium']);
    } else {
      Get.snackbar(
        "Ошибка",
        "сервер не отвечает",
      );
    }
  }

  Future writeKaskoExpress(Policy policy, int amountId) async {
    final body = Policy(
        policy.id,
        policy.number,
        policy.signTime,
        policy.validFrom,
        policy.validTill,
        policy.customerId,
        policy.insuranceTypeId,
        policy.contractTypeId,
        policy.mobileNumber,
        policy.email,
        policy.notificationTypeId,
        policy.promo,
        policy.filialId,
        policy.discountedPremium,
        10,
        policy.premium,
        policy.paymentType,
        policy.siteUserId,
        amountId,
        policy.drivers.where((element) => element.isInsurer == true).single,
        policy.drivers,
        policy.vehicles);

    final token = await UserData().getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';
      final response = await http.post(Uri.parse(releaseBaseUrl),
          body: jsonEncode(
              {"type": "contract.write_kasko_express", "data": body}),
          headers: {
            "Content-Type": "application/json",
            "Accept-Type": "application/json",
          });
          log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return getAgreementInfo(response.body, "/kasko_express/info");
      } else {
        Get.snackbar(
          "Ошибка",
          "сервер не отвечает повторите",
        );
      }
 
  }

  Future getInsuranceAmount() async {
    final token = await UserData().getToken();
    String releaseBaseUrl = 'https://online.nsk.kz/net-service/api/request?token=$token';

    final response = await post(
        releaseBaseUrl,
        jsonEncode({
          "type": "resources.kasko_express_insurance_amounts",
          "data": null
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept-Type": "application/json"
        });

    if (response.statusCode == 200) {
      return box.write('insuranceAmount', response.bodyString!);
    } else {
      Get.snackbar(
        "Ошибка",
        "сервер не отвечает",
      );
    }
  }

  Future writeOgpo(Policy policy) async {
    final body = Policy(
        policy.id,
        policy.number,
        policy.signTime,
        policy.validFrom,
        policy.validTill,
        policy.customerId,
        policy.insuranceTypeId,
        policy.contractTypeId,
        policy.mobileNumber,
        policy.email,
        policy.notificationTypeId,
        policy.promo,
        policy.filialId,
        policy.discountedPremium,
        policy.discount,
        policy.premium,
        policy.paymentType,
        policy.siteUserId,
        policy.insuranceCoverSum,
        policy.drivers.where((element) => element.isInsurer == true).single,
        policy.drivers,
        policy.vehicles);
    try {
      final token = await UserData().getToken();
      String releaseBaseUrl =
          'https://online.nsk.kz/net-service/api/request?token=$token';

      final response = await http.post(Uri.parse(releaseBaseUrl),
          body: jsonEncode({"type": "contract.write_osago", "data": body}),
          headers: {
            "Content-Type": "application/json",
            "Accept-Type": "application/json"
          });
      if (response.statusCode == 200) {
        return getAgreementInfo(
            response.body, "/policy/step2/calculate_policy/policy_info");
      } else {
        Get.snackbar(
          "Ошибка",
          "сервер не отвечает",
        );
      }
    } catch (e) {
      Get.snackbar("Ошибка", "Ошибка сервера");
    }
  }

  Future getAgreementInfo(String id, String route) async {
    final token = await UserData().getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';

    final response = await post(
        releaseBaseUrl,
        jsonEncode({
          "type": "policy.get_agreement_info",
          "data": {"id": id}
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept-Type": "application/json"
        });
    if (response.statusCode == 200) {
      await box.write('agreement_info', response.bodyString!);
      return Get.toNamed(
        route,
      );
    } else {
      Get.snackbar(
        "Ошибка",
        "сервер не отвечает",
      );
    }
  }

  Future getMyActivePolicy() async {
    final token = await UserData().getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';

    final response = await post(
      releaseBaseUrl,
      jsonEncode({
        'type': 'cabinet.get_client_agreements_info',
        "data": {"filter": "active"},
      }),
      headers: {'Accept': 'application/json'},
    );
    log(response.statusCode.toString());
    log(jsonDecode(response.bodyString!).toString());
    if (response.statusCode == 200) {
      log('Success');
    } else {
      Get.snackbar('Ошибка', jsonDecode(response.bodyString!)['message']);
    }
  }

  Future<ArchivePolicy> getMyExpiredPolicy() async {
  // Future getMyExpiredPolicy() async {
    final token = await UserData().getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';
     final response = await post(
      releaseBaseUrl,
      jsonEncode({
        'type': 'cabinet.get_client_agreements_info',
        "data": {"filter": "expired"},
      }),
      headers: {'Accept': 'application/json'},
    );
    log('Expired status: ' + response.statusCode.toString());
    log(jsonDecode(response.bodyString!).toString());
    if (response.statusCode == 200) {
    final expired = ArchivePolicy.fromJson({'policies':jsonDecode(response.bodyString!)});
    return expired;
    } else {
      return ArchivePolicy();
    }
  }

}
