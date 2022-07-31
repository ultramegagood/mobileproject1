import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_nsk/core/contacts/contacts_main_controller.dart';
import 'package:mobile_nsk/pages/contacts/contacts_map.dart';
import 'package:mobile_nsk/pages/contacts/contacts_offices_list.dart';
import 'package:mobile_nsk/pages/widgets/loading_view.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:get/get.dart';

class ContactsMainPage extends GetView<ContactsMainController> {
  ContactsMainPage({Key? key}) : super(key: key);

  final controller = Get.put(ContactsMainController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.defaultBackground,
          appBar: NskAppBar(
            label: 'Офисы',
          ),
          body: controller.loaderRx.value
              ? LoadingView()
              : Column(
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
                        onTap: (value) => Get.until(
                            (route) => Get.currentRoute == '/contacts'),
                        // onTap: (value) => Navigator.popUntil(context, (route) => ),
                        indicatorColor: AppColors.primary,
                        labelColor: const Color(0xff373737),
                        unselectedLabelColor: const Color(0xff9A9A9A),
                        tabs: [
                          _buildTab('Список'),
                          _buildTab('Карта'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        ContactsOfficesList(
                          offices: controller.offices.value!.contacts!,
                        ),
                        ContactsMap(
                          offices: controller.offices.value!.contacts!,
                        ),
                      ]),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Padding _buildTab(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
