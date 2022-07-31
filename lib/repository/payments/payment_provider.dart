import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cloudpayments/cloudpayments.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:mobile_nsk/models/policy/agreement_info.dart';
import 'package:mobile_nsk/pages/payments/result_page.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';

class PaymentProvider extends GetConnect {
  Future makePayment(
    String cardNumber,
    String cardDate,
    String cardCVC,
    String cardholder,
    AgreementInfo agreementInfo,
  ) async {
    final ipv4 = await Ipify.ipv4();
    final cryptogram = await Cloudpayments.cardCryptogram(
      cardNumber: cardNumber,
      cardCVC: cardCVC,
      cardDate: cardDate,
      publicId: 'pk_66116b7510e69ef3b43f1e1dbe756',
    );
    String username = 'pk_66116b7510e69ef3b43f1e1dbe756';
    String password = '5838852f159860fb96ee0372c025c3f1';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    log(cryptogram.cryptogram.toString());
    final body = {
      "Amount": agreementInfo.premium,
      "Currency": "KZT",
      "InvoiceId": "${agreementInfo.id} " +
          "${agreementInfo.holderIIN} " +
          "${agreementInfo.holderName} " +
          "${agreementInfo.holderPhone}",
      "IpAddress": ipv4.toString(),
      "Description": "Оплата полиса в nsk.kz через мобильное приложение",
      "Name": cardholder,
      "CardCryptogramPacket": cryptogram.cryptogram
    };
    log(jsonEncode(body));
    final response = await post(
        "https://api.cloudpayments.ru/payments/cards/charge", jsonEncode(body),
        headers: {
          'Authorization': basicAuth,
          "Content-Type": "application/json",
          "Accept-Type": "application/json"
        });
    log(response.statusCode.toString());
    log("payment body is :  "+response.bodyString.toString());
    if (jsonDecode(response.bodyString!) != null  &&
        jsonDecode(response.bodyString!)['Success'] == true) {
      log(response.bodyString!);

      final token = await UserData().getToken();
      String releaseBaseUrl =
          'https://online.nsk.kz/net-service/api/request?token=$token';
      final paymentResponse = await http.post(Uri.parse(releaseBaseUrl),
          body: jsonEncode({
            "type": "policy.activate_agreement",
            "data": {"id": agreementInfo.id}
          }),
          headers: {
            "Content-Type": "application/json",
            "Accept-Type": "application/json"
          });
      log(paymentResponse.body);
      log(paymentResponse.statusCode.toString());
      Get.offAll(PaymentResultPage(isSuccess: true));
    } else {
      log(response.statusCode.toString());
      log(jsonDecode(response.bodyString!).toString());
      log("Error message: " +
          jsonDecode(response.bodyString!)['Message'].toString());
      Get.offAll(PaymentResultPage(
        isSuccess: false,
        errorMessage: jsonDecode(response.bodyString ?? "")['Message'],
      ));
    }
  }
}
