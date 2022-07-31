import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:mobile_nsk/core/error/exceptions.dart';
import 'package:mobile_nsk/models/profile/user.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';

class Profileprovider extends GetConnect {
  UserData _userData = UserData();

  Future<User> getProfile() async {
    final token = await _userData.getToken();
    String releaseBaseUrl =
        'https://online.nsk.kz/authorization-service/api/user?token=$token';
    final response = await get(
      releaseBaseUrl,
      headers: {'Accept': 'application/json'},
    );
    log('Get Profile status: ' + response.statusCode.toString());
    log(jsonDecode(response.bodyString!).toString());
    if (response.statusCode == 200) {
      final profile = User.fromJson(jsonDecode(response.bodyString!)['user']);
      _userData.setUserName(profile.name);
      return profile;
    } else {
      return User();
    }
  }

  Future deleteAccount(int id) async {
    // final token = await _userData.getToken();
    String releaseBaseUrl =
        'http://online.nsk.kz/authorization-service/api/deactivate/$id';
    final response = await post(releaseBaseUrl, null);
    log('Delete Account Status: ' + response.statusCode.toString());
    log(jsonDecode(response.bodyString!).toString());
    if (response.statusCode == 200) {
      log('Successfully deleted!');
    } else {
      throw ServerException(message: 'Что то пошло не так');
    }
  }
}
