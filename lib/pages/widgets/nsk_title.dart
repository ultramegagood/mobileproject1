import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NskTitle extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final double letterSpacing;
  const NskTitle({
    Key? key,
    required this.title,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 20,
    this.letterSpacing = 0.16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 15),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontWeight: fontWeight,
          fontStyle: FontStyle.normal,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          color: const Color.fromRGBO(55, 55, 55, 1),
        ),
      ),
    );
  }
}
