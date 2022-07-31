import 'dart:convert';
import 'dart:developer';

import 'package:mobile_nsk/core/error/exceptions.dart';
import 'package:mobile_nsk/main.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/models/tourism/country_insurance_amounts.dart';
import 'package:mobile_nsk/models/tourism/franchise.dart';
import 'package:mobile_nsk/models/tourism/get_full_client_response.dart';
import 'package:mobile_nsk/models/tourism/insured_list_model.dart';
import 'package:mobile_nsk/models/tourism/set_full_client_request.dart';
import 'package:mobile_nsk/models/tourism/tourism_model.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';

class TourismProvider extends GetConnect {
  final UserData _userData = UserData();

  Future getInsuranceRecources() async {
    final token = await _userData.getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';

    final euro = await post(
      releaseBaseUrl,
      {"type": "resources.euro_rate", "data": null},
    );
    await box.write("euro", euro.bodyString);
    final purpose = await post(
        releaseBaseUrl, {"type": "resources.trip_purposes", "data": null});
    if (purpose.statusCode == 200) {
      await box.write("purpose", purpose.bodyString);
      // log('Purposes: ' + json.decode(purpose.bodyString!).toString());
      final franchises = await post(
          releaseBaseUrl, {"type": "resources.franchises", "data": null});
      if (franchises.statusCode == 200) {
        await box.write("franchises", franchises.bodyString);
        final countries = await post(
            releaseBaseUrl, {"type": "resources.countries", "data": null});
        if (countries.statusCode == 200) {
          await box.write("countries", countries.bodyString);
          final categories = await post(releaseBaseUrl,
              {"type": "resources.sport_categories", "data": null});
          if (categories.statusCode == 200) {
            await box.write("sport_categories", categories.bodyString);
            // log("Sport category: " +
            //     json.decode(categories.bodyString!).toString());
            final sportTypes = await post(
                releaseBaseUrl, {"type": "resources.sports", "data": null});
            if (sportTypes.statusCode == 200) {
              await box.write('sportTypes', sportTypes.bodyString);
              // log("Sport types: " + json.decode(sportTypes.bodyString!).toString());
              final programs = await post(releaseBaseUrl,
                  {"type": "resources.multitrip_programmes", "data": null});
              if (programs.statusCode == 200) {
                await box.write('programs', programs.bodyString);
                // log('Programs: ' + json.decode(programs.bodyString!).toString());
              } else {
                Get.snackbar("Ошибка", "Не удалось загрузить программ");
                Get.offAndToNamed('/home');
              }
            } else {
              Get.snackbar("Ошибка", "Не удалось загрузить типов спорта");
            }
          } else {
            Get.snackbar("Ошибка", "Не удалось загрузить категорий");
          }
        } else {
          Get.snackbar("Ошибка", "Не удалось загрузить список стран");
        }
      } else {
        Get.snackbar("Ошибка", "Не удалось загрузить франшизу");
      }
    } else {
      Get.snackbar("Ошибка", "Не удалось загрузить цели поездки");
    }
  }

  Future<CountryInsuranceAmounts> getInsuranceAmounts(int regionId) async {
    final token = await _userData.getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';
    final response = await post(
        releaseBaseUrl,
        jsonEncode({
          "type": "resources.insurance_amounts",
          "data": {"regionId": regionId}
        }),
        headers: {'Accept': 'application/json'});
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return CountryInsuranceAmounts.fromJson(
          {'amounts': json.decode(response.bodyString!)});
    } else {
      return CountryInsuranceAmounts();
    }
  }

  Future<FranchisesResponse> calculateHealthFranchise(
      TourismModel tourism) async {
    final body = toBody(tourism);
    final token = await _userData.getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';
    final response = await post(
      releaseBaseUrl,
      jsonEncode({'type': "contract.calculate_health_franchise", 'data': body}),
    );

    log('Calculate franchise status: ' + response.statusCode.toString());
    log("Franchise: ${response.body}");
    if (response.statusCode == 200) {
      final franchises = FranchisesResponse.fromJson({
        'franchises': jsonDecode(response.bodyString!),
      });
      return franchises;
    } else {
      return FranchisesResponse();
    }
  }

  Future<int> calculateHealth(TourismModel tourism) async {
    final body = toBody(tourism);
    final token = await _userData.getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';
    log(jsonEncode(body));
    final response = await post(
      releaseBaseUrl,
      jsonEncode({'type': "contract.calculate_health", 'data': body}),
      headers: {'Accept': 'application/json'},
    );
    log(response.statusCode.toString());
    log('Premium: ' + json.decode(response.bodyString!).toString());
    box.write('premium', json.decode(response.bodyString!));
    return response.statusCode!;
  }

  Future<int> writeHealth(TourismModel model) async {
    final body = toBody(model);
    log(body.email.toString());
    log('Write Health Body: ' +
        jsonEncode({'type': "contract.write_health", 'data': body}).toString());
    final token = await _userData.getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';
    // final response = await http.post(
    //   Uri.parse(releaseBaseUrl),
    //   body: jsonEncode({'type': "contract.write_health", 'data': body}),
    //   headers: {'Accept': 'application/json'},
    // );
    final response = await post(
      releaseBaseUrl,
      jsonEncode({'type': "contract.write_health", 'data': body}),
      headers: {'Accept': 'application/json'},
    );
    log('WriteHealth status: ' + response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException(
          message: response.statusCode == null
              ? 'Что то пошло не так'
              : jsonDecode(response.bodyString!)['message']);
    }
  }

  Future<GetFullClientResponse> getFullClient(String iin) async {
    final token = await _userData.getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';
    final response = await post(
      releaseBaseUrl,
      jsonEncode({
        "type": "customer.get_full_client",
        'data': InsuredListModel(iin: iin)
      }),
      headers: {'Accept': 'application/json'},
    );
    log(response.statusCode.toString());
    // log(jsonDecode(response.bodyString!).toString());
    if (response.statusCode == 200) {
      return GetFullClientResponse.fromJson(jsonDecode(response.bodyString!));
    } else {
      throw ServerException(
          message: jsonDecode(response.bodyString!)['message']);
    }
  }

  Future<int> setFullClient(SetFullClientRequest client) async {
    final token = await _userData.getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/net-service/api/request?token=$token';
    final response = await post(
      releaseBaseUrl,
      jsonEncode({"type": "customer.set_full_client", 'data': client}),
      headers: {'Accept': 'application/json'},
    );
    log('SetFullClient status: ' + response.statusCode.toString());
    log(jsonDecode(response.bodyString!).toString());
    if (response.statusCode == 200) {
      return jsonDecode(response.bodyString!)['id'];
    } else {
      throw ServerException(
          message: jsonDecode(response.bodyString!)['message']);
    }
  }

  TourismModel toBody(TourismModel tourism) => TourismModel(
        validFrom: tourism.validFrom,
        validTill: tourism.validTill,
        countriesIds: tourism.countriesIds,
        regionId: tourism.regionId,
        city: tourism.city,
        insuranceAmount: tourism.insuranceAmount,
        insuranceAmountId: tourism.insuranceAmountId,
        promoCode: tourism.promoCode,
        multitripProgrammeId: tourism.multitripProgrammeId,
        franchiseId: tourism.franchiseId,
        purposeId: tourism.purposeId,
        insuredList: tourism.insuredList,
        sportCategoryId: tourism.sportCategoryId,
        sportId: tourism.sportId,
        isMultitrip: tourism.isMultitrip,
        clientsBirthDate: tourism.clientsBirthDate,
        insuredCount: tourism.insuredCount,
        ageGroupId: tourism.ageGroupId,
        isCovid: tourism.isCovid,
        covidLimit: tourism.covidLimit,
        isAgree: tourism.isAgree,
        insurantTravels: tourism.insurantTravels,
        isDataCorrect: tourism.isDataCorrect,
        premium: tourism.premium,
        discountedPremium: tourism.discountedPremium,
        currentStepIndex: tourism.currentStepIndex,
        error: tourism.error,
        email: tourism.email,
      );
}
