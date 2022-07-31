import 'dart:async';

import 'package:get/get.dart';

class PhoneNumberConfirmationController extends GetxController {
  var isCanSendNewCode = false.obs;

  static const countDownDuration = Duration(seconds: 5);

  Rx<Duration> duration = const Duration(seconds: 5).obs;
  Timer? _timer;

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final seconds = duration.value.inSeconds - 1;
      if (seconds < 0) {
        _timer!.cancel();
      } else {
        duration(Duration(seconds: seconds));
      }
    });
  }

  reset() {
    duration(countDownDuration);
  }

  String toDigits(int n) => n.toString().padLeft(2, '0');

  setToSendNewCode(bool value) {
    isCanSendNewCode(value);
  }
}
