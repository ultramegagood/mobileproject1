import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:mobile_nsk/core/drawer_controller.dart';
import 'package:mobile_nsk/pages/widgets/custom_icons_icons.dart';
import 'package:mobile_nsk/shared/theme.dart';

class NskDrawer extends GetView<MainDrawerController> {
  NskDrawer({Key? key}) : super(key: key);

  final controller = Get.put(MainDrawerController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 50),
          InkWell(
            onTap: () => Get.toNamed('/settings'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Icon(
                          Icons.person,
                          color: AppColors.black,
                        ),
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            controller.userName.value,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              letterSpacing: 0.16,
                              color: Color.fromRGBO(10, 10, 10, 1),
                            ),
                          ),
                        ),
                        const Text(
                          'Настройки',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            letterSpacing: 0.16,
                            color: Color.fromRGBO(104, 104, 104, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          const Divider(
            color: Color.fromRGBO(187, 187, 187, 1),
            thickness: 1,
            height: 20,
          ),
          ListTile(
            onTap: () => Get.toNamed('/contacts'),
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: Icon(
              CustomIcons.mapMarker,
              size: 30,
              color: Color.fromRGBO(45, 96, 226, 1),
            ),
            title: Text(
              'Алматы',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                letterSpacing: 1.2,
                color: Color.fromRGBO(10, 10, 10, 1),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const Divider(
            color: Color.fromRGBO(187, 187, 187, 1),
            thickness: 1,
            height: 20,
          ),
          ListTile(
            onTap: () => Get.toNamed('/mypolicy_main'),
            contentPadding: const EdgeInsets.only(left: 4),
            dense: true,
            title: const Text(
              'Мои полисы',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                letterSpacing: 0.5,
                color: Color.fromRGBO(10, 10, 10, 1),
              ),
            ),
          ),
          const Divider(
            color: Color.fromRGBO(187, 187, 187, 1),
            thickness: 1,
          ),
          // ListTile(
          //   contentPadding: const EdgeInsets.only(left: 4),
          //   dense: true,
          //   title: const Text(
          //     'Купить полис',
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //       fontStyle: FontStyle.normal,
          //       fontSize: 16,
          //       letterSpacing: 0.5,
          //       color: Color.fromRGBO(10, 10, 10, 1),
          //     ),
          //   ),
          //   onTap: () {
          //     // Get.toNamed("/mypolicy");
          //   },
          // ),
          // const Divider(
          //   color: Color.fromRGBO(187, 187, 187, 1),
          //   thickness: 1,
          // ),
          // ListTile(
          //   contentPadding: const EdgeInsets.only(left: 4),
          //   dense: true,
          //   title: const Text(
          //     'Страховой случай',
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //       fontStyle: FontStyle.normal,
          //       fontSize: 16,
          //       letterSpacing: 0.5,
          //       color: Color.fromRGBO(10, 10, 10, 1),
          //     ),
          //   ),
          //   onTap: () {},
          // ),
          // const Divider(
          //   color: Color.fromRGBO(187, 187, 187, 1),
          //   thickness: 1,
          //   height: 20,
          // ),
          // ListTile(
          //   contentPadding: const EdgeInsets.only(left: 4),
          //   dense: true,
          //   title: const Text(
          //     'Акции',
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //       fontStyle: FontStyle.normal,
          //       fontSize: 16,
          //       letterSpacing: 0.5,
          //       color: Color.fromRGBO(10, 10, 10, 1),
          //     ),
          //   ),
          //   onTap: () {},
          // ),
          // const Divider(
          //   color: Color.fromRGBO(187, 187, 187, 1),
          //   thickness: 1,
          //   height: 20,
          // ),
          // ListTile(
          //   contentPadding: const EdgeInsets.only(left: 4),
          //   dense: true,
          //   title: const Text(
          //     'Офисы',
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //       fontStyle: FontStyle.normal,
          //       fontSize: 16,
          //       letterSpacing: 0.5,
          //       color: Color.fromRGBO(10, 10, 10, 1),
          //     ),
          //   ),
          //   onTap: () {},
          // ),
          // const Divider(
          //   color: Color.fromRGBO(187, 187, 187, 1),
          //   thickness: 1,
          //   height: 20,
          // ),
          // ListTile(
          //   contentPadding: const EdgeInsets.only(left: 4),
          //   dense: true,
          //   title: const Text(
          //     'Чат',
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //       fontStyle: FontStyle.normal,
          //       fontSize: 16,
          //       letterSpacing: 0.5,
          //       color: Color.fromRGBO(10, 10, 10, 1),
          //     ),
          //   ),
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
