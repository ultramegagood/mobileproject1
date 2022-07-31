import 'package:flutter/material.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';

class InsuredEvents extends StatelessWidget {
  const InsuredEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: NskText(
        'Страховые случаи',
        fontSize: 16,
      ),
    );
  }
}
