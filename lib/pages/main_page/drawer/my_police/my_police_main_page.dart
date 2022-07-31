import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_nsk/core/my_policy/my_policy_controller.dart';
import 'package:mobile_nsk/pages/main_page/drawer/my_police/archive.dart';
import 'package:mobile_nsk/pages/main_page/drawer/my_police/insured_events.dart';
import 'package:mobile_nsk/pages/main_page/drawer/my_police/policies.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';

class MyPoliceMainPage extends GetView<MyPolicyController> {
  MyPoliceMainPage({Key? key}) : super(key: key);

  final controller = Get.put(MyPolicyController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.defaultBackground,
        appBar: const NskAppBar(
          label: 'Мои полисы',
        ),
        body: Column(
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xffC4C4C4),
                    width: 2,
                  ),
                ),
              ),
              child: TabBar(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                indicatorColor: AppColors.primary,
                labelColor: const Color(0xff373737),
                unselectedLabelColor: const Color(0xff9A9A9A),
                tabs: [
                  _buildTab('Полисы'),
                  _buildTab('Страховые случаи'),
                  _buildTab('Архив'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Policies(),
                  const InsuredEvents(),
                  Archive(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildTab(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
