import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mobile_nsk/core/payment/PaymentBinding.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/tourism/purpose.dart';
import 'package:mobile_nsk/pages/auth/signup/pin_code_create_screen.dart';
import 'package:mobile_nsk/pages/auth/signup/signup_screen.dart';
import 'package:mobile_nsk/pages/auth/singnin/primary_entry_screen.dart';
import 'package:mobile_nsk/pages/auth/singnin/signin_screen.dart';
import 'package:mobile_nsk/pages/calculators/entrance/entrance_page.dart';
import 'package:mobile_nsk/pages/calculators/kasko_express/kasko_express_calculate.dart';
import 'package:mobile_nsk/pages/calculators/kasko_express/kasko_express_holder.dart';
import 'package:mobile_nsk/pages/calculators/kasko_express/kasko_express_info.dart';
import 'package:mobile_nsk/pages/calculators/kasko_express/kasko_express_vehicle.dart';
import 'package:mobile_nsk/pages/calculators/ogpo/policy_calculate.dart';
import 'package:mobile_nsk/pages/calculators/ogpo/policy_holder.dart';
import 'package:mobile_nsk/pages/calculators/ogpo/policy_vehicle.dart';
import 'package:mobile_nsk/pages/calculators/tourism/screen/tourism_step_one_screen.dart';
import 'package:mobile_nsk/pages/calculators/tourism/screen/tourism_step_three_screen.dart';
import 'package:mobile_nsk/pages/calculators/tourism/screen/tourism_step_two_screen.dart';
import 'package:mobile_nsk/pages/contacts/contacts_main_page.dart';
import 'package:mobile_nsk/pages/main_page/drawer/my_police/my_police_main_page.dart';
import 'package:mobile_nsk/pages/main_page/drawer/mypolice.dart';
import 'package:mobile_nsk/pages/main_page/drawer/settingpage.dart';
import 'package:mobile_nsk/pages/main_page/drawer/tourismdescrip.dart';
import 'package:mobile_nsk/pages/main_page/mainpage.dart';
import 'package:mobile_nsk/pages/payments/cloudpayments.dart';
import 'package:mobile_nsk/pages/profile/change_password_screen.dart';
import 'package:mobile_nsk/pages/profile/change_phone_number_screen.dart';
import 'package:mobile_nsk/pages/profile/change_pin_code_screen.dart';
import 'package:mobile_nsk/pages/profile/phone_number_confirmation_screen.dart';
import 'package:mobile_nsk/pages/profile/settings_screen.dart';
import 'package:mobile_nsk/repository/calculator/main/user_data.dart';

import 'core/home_binding.dart';
import 'core/policy_binding.dart';
import 'pages/calculators/ogpo/policy_info.dart';

class AppRoutes {
  static Future<String> init() async {
    UserData _userData = UserData();
    final purpose = Purposes(
      id: 1,
    );
    await box.write('test', purpose);
    final isAuth = await _userData.isAuthenticated();
    log(isAuth.toString());
    if (isAuth == null || !isAuth) {
      return '/primaryEntry';
    } else {
      return '/signin';
    }
    // return '/payment';
  }

  static List<GetPage> routes = [
    GetPage(
      name: '/primaryEntry',
      page: () => PrimaryEntryScreen(),
    ),
    GetPage(
      name: '/signin',
      page: () => SignInScreen(),
    ),
    GetPage(
      name: '/signup',
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: '/pin_create',
      page: () => PinCodeCreateScreen(),
    ),
    GetPage(
      name: '/settings',
      page: () => SettingsScreen(),
    ),
    GetPage(
      name: '/change_password',
      page: () => const ChangePasswordScreen(),
    ),
    GetPage(
      name: '/change_pin',
      page: () => ChangePinCodeScreen(),
    ),
    GetPage(
      name: '/change_phone',
      page: () => ChangePhoneNumberScreen(),
    ),
    GetPage(
      name: '/change_phone/confirm',
      page: () => PhoneNumberConfirmationScreen(),
    ),
    GetPage(
      name: '/policy',
      page: () => PolicyHolder(),
      binding: PolicyBind(),
    ),
    GetPage(
      name: '/policy/step2',
      page: () => PolicyVehicle(),
    ),
    GetPage(
      name: '/policy/step2/calculate_policy',
      page: () => PolicyCalculate(),
    ),
    GetPage(
      name: '/entrance',
      page: () => const Entrance(),
    ),
    GetPage(
      name: '/main',
      binding: HomeBind(),
      page: () => MainPage(),
    ),
    GetPage(
        name: '/kasko_express',
        page: () => KaskoExpressHolder(),
        binding: PolicyBind()),
    GetPage(
      name: '/kasko_express/vehicle',
      page: () => KaskoExpressVehicle(),
    ),
    GetPage(
      name: '/kasko_express/vehicle/calculate',
      page: () => KaskoExpressCalculate(),
    ),
    GetPage(
      name: '/kasko_express/info',
      page: () => KaskoExpressInfo(),
    ),
    GetPage(
      name: '/policy/step2/calculate_policy/policy_info',
      page: () => PolicyAgreement(),
    ),
    GetPage(
        name: '/payment', page: () => PaymentPage(), binding: PaymentBinding()),
    GetPage(
      name: '/mypolicy_main',
      page: () => MyPoliceMainPage(),
    ),
    GetPage(
      name: '/mypolicy',
      page: () => const MyPolicePage(),
    ),
    GetPage(
      name: '/contacts',
      page: () => ContactsMainPage(),
    ),
    GetPage(
      name: '/setting',
      page: () => const SettingPage(),
    ),
    GetPage(
      name: '/tourism/step1',
      page: () => TourismStepOneScreen(),
    ),
    GetPage(
      name: '/tourism/step2',
      page: () => TourismStepTwoScreen(),
    ),
    GetPage(
      name: '/tourism/step3',
      page: () => TourismStepThreeScreen(),
    ),
    GetPage(
      name: '/tourisminfo',
      page: () => const TourismDescripPage(),
    ),
  ];
}
