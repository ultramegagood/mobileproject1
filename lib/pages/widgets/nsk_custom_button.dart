import 'package:flutter/material.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/theme.dart';

class NskCustomButton extends StatelessWidget {
  const NskCustomButton(this.text,
      {Key? key,
      this.isButtonEnabled = false,
      this.onTap,
      this.backgroundColor = AppColors.defaultBackground,
      this.isEnabledButtonPrimaryColor = true})
      : super(key: key);
  final String text;
  final bool isButtonEnabled;
  final Function()? onTap;
  final Color backgroundColor;
  final bool isEnabledButtonPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: double.maxFinite,
            height: 50,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: isButtonEnabled
                  ? isEnabledButtonPrimaryColor
                      ? AppColors.primary
                      : AppColors.white
                  : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:
                    isButtonEnabled ? AppColors.primary : AppColors.lightGrey,
              ),
            ),
            child: NskText(
              text,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: isButtonEnabled
                  ? isEnabledButtonPrimaryColor
                      ? AppColors.white
                      : AppColors.primary
                  : AppColors.lightGrey,
            ),
          ),
        ),
      ),
    );
  }
}
