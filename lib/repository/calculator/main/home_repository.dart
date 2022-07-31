import 'package:mobile_nsk/repository/calculator/main/home_provider.dart';

class HomeRepository {
  final HomeProvider _homeProvider = HomeProvider();
  Future getDefaultToken(String email, String password) =>
      _homeProvider.getDefaultToken(email, password);
  Future signUp(String iin, String phone, String docnum, String password,
          String passwordConfirmation) =>
      _homeProvider.signUp(iin, phone, docnum, password, passwordConfirmation);
}
