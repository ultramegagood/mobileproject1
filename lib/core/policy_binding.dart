import 'package:get/instance_manager.dart';
import 'package:mobile_nsk/core/policy_controller.dart';

class PolicyBind implements Bindings {
  @override
  void dependencies() {
    Get.put(PolicyController());
  }
}
