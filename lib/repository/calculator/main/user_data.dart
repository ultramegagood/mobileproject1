import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName') ?? '';
  }

  void setUserName(String? name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', name ?? '');
  }

  Future<bool?> isBiometricsEnabled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isBiometrics') ?? false;
  }

  void setIsBiometricsEnabled(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isBiometrics', value);
  }

  Future<bool?> isNotificationEnabled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isBiometrics') ?? false;
  }

  void setIsNotificationEnabled(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isBiometrics', value);
  }

  Future<bool?> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isAuthenticated');
  }

  void setIsAuthenticated(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isAuthenticated', value);
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? '';
  }

  void setEmail(String? email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email ?? '');
  }

  Future<String?> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('password') ?? '';
  }

  void setPassword(String? password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', password ?? '');
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  void setToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token ?? '');
  }

  Future<String?> getPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('pin') ?? 'Null';
  }

  void setPin(String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pin', pin);
  }

  void removePin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('pin');
  }

  Future<String?> getIin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('iin') ?? '';
  }

  void setIin(String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('iin', pin);
  }

  Future<String?> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('id') ?? '';
  }

  void setId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
  }

  void clearAllData() async {
    removePin();
    setIsAuthenticated(false);
    setEmail('');
    setPassword('');
    setIin('');
    setIsBiometricsEnabled(false);
    setIsNotificationEnabled(false);
    setUserName('');
  }
}
