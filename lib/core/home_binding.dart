import 'package:get/instance_manager.dart';
import 'package:mobile_nsk/core/home_controller.dart';


class HomeBind implements Bindings {
  

  @override
  void dependencies() {
    Get.put(HomeController());
  }
}