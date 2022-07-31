import 'package:flutter/material.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';

class NskCheckBox extends StatelessWidget {
  const NskCheckBox({
    Key? key,
    required this.text,
    required this.value,
    required this.onChanged,
    this.isTristate = false,
    this.textColor = AppColors.black,
  }) : super(key: key);
  final String text;
  final bool value;
  final Function(bool?) onChanged;
  final bool isTristate;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: GestureDetector(
        onTap: () => onChanged(!value),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                value: isTristate ? true : value,
                onChanged: onChanged,
                activeColor: AppColors.primary,
                tristate: isTristate,
                side: BorderSide(width: 1, color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            Expanded(
              child: NskText(
                text,
                textAlign: TextAlign.left,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
