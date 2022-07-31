
import 'package:get/get.dart';
import 'package:mobile_nsk/repository/calculator/main/home_repository.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  var isIinNotNull = false.obs;
  var isPhoneNotNull = false.obs;
  var isDocNumNotNull = false.obs;
  String? password;
  String? passwordConfirm;

  var isSixSymbols = Rx<ValidationStates>(ValidationStates.neutral);
  var isOneNumber = Rx<ValidationStates>(ValidationStates.neutral);
  var isFirstUppercase = Rx<ValidationStates>(ValidationStates.neutral);

  var isButtonEnabled = false.obs;

  final repository = HomeRepository();

  void setPasswordVisibility() {
    isPasswordVisible(!isPasswordVisible.value);
  }

  void notNullValidation(String? value, RxBool isNotNull) {
    if (value == null || value.isEmpty) {
      isNotNull(false);
    } else {
      isNotNull(true);
    }
    lastValidation();
  }

  void passValidation(String value, bool isPasswordConfim) {
    isPasswordConfim ? passwordConfirm = value : password = value;
    if (value.length >= 6) {
      isSixSymbols(ValidationStates.correct);
    } else {
      isSixSymbols(ValidationStates.incorrect);
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      isOneNumber(ValidationStates.correct);
    } else {
      isOneNumber(ValidationStates.incorrect);
    }
    if (value.contains(RegExp(r'[A-Z]'))) {
      isFirstUppercase(ValidationStates.correct);
    } else {
      isFirstUppercase(ValidationStates.incorrect);
    }
    lastValidation();
  }

  void lastValidation() {
    if (isFirstUppercase == ValidationStates.correct &&
        isOneNumber == ValidationStates.correct &&
        isSixSymbols == ValidationStates.correct &&
        isPhoneNotNull.value &&
        (password == passwordConfirm)) {
      isButtonEnabled(true);
    } else {
      isButtonEnabled(false);
    }
  }

  void register(
    String iin,
    String phone,
    String docNum,
    String password,
    String passwordConfirm,
  ) {
    if (isButtonEnabled.value) {
      repository.signUp(iin, phone, docNum, password, passwordConfirm);
    }
  }
}

enum ValidationStates {
  correct,
  incorrect,
  neutral,
}
