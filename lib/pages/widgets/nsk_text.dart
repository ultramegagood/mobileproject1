import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_nsk/shared/theme.dart';

class NskText extends StatelessWidget {
  const NskText(
    this.text, {
    Key? key,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.black,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
    this.textOverFlow,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final TextOverflow? textOverFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverFlow,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
        color: color,
      ),
    );
  }
}
