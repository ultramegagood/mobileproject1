import 'package:get/get.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';

class MainDrawerController extends GetxController {
  var userName = ''.obs;

  @override
  void onInit() async {
    userName(await UserData().getUserName());
    super.onInit();
  }
}