import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/shared/theme.dart';

class NskAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool? isUnderText;
  final String? label;
  final String? underLabel;
  final bool disableLeading;
  final Function()? onBack;
  const NskAppBar({
    Key? key,
    this.isUnderText,
    this.label,
    this.underLabel,
    this.disableLeading = false,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.defaultBackground,
      automaticallyImplyLeading: false,
      leading: disableLeading
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  color: Color.fromRGBO(45, 96, 226, 1)),
              onPressed: () {
                onBack == null ? Get.back() : onBack!();
                // Get.back();
              },
            ),
      title: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  letterSpacing: 0.16,
                  color: Color.fromRGBO(10, 10, 10, 1),
                ),
              ),
            ),
          ),
          if (isUnderText == true)
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(underLabel!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        letterSpacing: 0.16,
                        color: Color.fromRGBO(109, 109, 109, 1))),
              ),
            )
        ],
      ),
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
