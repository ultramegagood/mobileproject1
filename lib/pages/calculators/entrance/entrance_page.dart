import 'package:flutter/material.dart';
import 'package:mobile_nsk/pages/widgets/nsk_appbar.dart';

class Entrance extends StatefulWidget {
  const Entrance({Key? key}) : super(key: key);

  @override
  _EntranceState createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NskAppBar(
        isUnderText: true,
        label: "Временный вьезд",
        underLabel: "шаг 1 из 2",
      ),
      body: StreamBuilder(
        builder: (context, snapshot) {
          return Container();
        },
      ),
    );
  }
}
