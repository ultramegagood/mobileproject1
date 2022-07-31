import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';
import 'package:mobile_nsk/repository/profile/profile_repository.dart';
import 'package:mobile_nsk/shared/theme.dart';

class HomeProvider extends GetConnect {
  String baseAuthUrl = 'http://online.nsk.kz/authorization-service/api';

  Future getDefaultToken(String? phone, String? password) async {
    // final body = jsonEncode({
    //   'email': "info@nsk.kz",
    //   'password': "udOPB\$imAihq",
    //   'phone': '77713404056',
    //   'password': 'tyler13'
    // });

    log(phone.toString());
    UserData _userData = UserData();
    log('Email: ' + (await _userData.getEmail()).toString());
    log('Password: ' + (await _userData.getPassword()).toString());
    final body = jsonEncode(
      {
        "phone": await _userData.getEmail() == ''
            ? phone!.replaceAll(RegExp(r'[^0-9]'), '')
            : await _userData.getEmail(),
        "password": await _userData.getPassword() == ''
            ? password
            : await _userData.getPassword()
      },
    );
    final response = await post(
      baseAuthUrl + "/login",
      body,
      headers: {'Content-Type': 'application/json'},
    );
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      _userData.setToken(jsonDecode(response.bodyString!)['token']);
      log('Token: ' + (await UserData().getToken()).toString());
      UserData().setIsAuthenticated(true);
      if (phone != null) {
        UserData().setEmail(phone.replaceAll(RegExp(r'[^0-9]'), ''));
        UserData().setPassword(password);
      }

      await ProfileRepository().getProfile();

      phone == null ? Get.offAllNamed('/main') : Get.offAllNamed('/pin_create');
    } else {
      Get.snackbar(
        'Ошибка',
        'Аутентификация не пройдена',
      );
    }
  }

  Future signUp(String iin, String phone, String docNum, String password,
      String passwordConfirmation) async {
    final body = jsonEncode({
      "iin": iin,
      "phone": phone.replaceAll(RegExp(r'[^0-9]'), ''),
      "doc_num": docNum,
      "password": password,
      "password_confirmation": passwordConfirmation,
    });
    log('Register body: ' + body.toString());
    final response = await post(
      baseAuthUrl + '/registration',
      body,
    );

    if (response.statusCode == 200) {
      log('Success');
    } else {
      log(json.decode(response.bodyString!).toString());
      // final error = RegisterError.fromJson(json.decode(response.bodyString!));
      final error = json.decode(response.bodyString!);
      Get.dialog(
        AlertDialog(
          title: const Text(
            'Ошибка при регистрации',
          ),
          content: NskText(error['data'].toString()),
          // content: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     ...List.generate(
          //       error['data'].iin!.length,
          //       (index) => NskText(
          //         '• ' + error.data!.iin![index],
          //         textAlign: TextAlign.left,
          //       ),
          //     ),
          //     ...List.generate(
          //       error.data!.phone!.length,
          //       (index) => NskText(
          //         '• ' + error.data!.phone![index],
          //         textAlign: TextAlign.left,
          //       ),
          //     ),
          //     ...List.generate(
          //       error.data!.password!.length,
          //       (index) => NskText(
          //         '• ' + error.data!.password![index],
          //         textAlign: TextAlign.left,
          //       ),
          //     ),
          //   ],
          // ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const NskText(
                'Ok',
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      );
    }
  }
}
