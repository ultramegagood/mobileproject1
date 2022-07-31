import 'package:flutter/material.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';

class VehicleList extends StatelessWidget {
  final AsyncSnapshot<Policy> snapshot;

  const VehicleList({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vehicle = snapshot.data!.vehicles;

    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      List<TextEditingController> _controller =
          List.generate(vehicle.length, (i) => TextEditingController());
      final vehicles = snapshot.data!.vehicles[index];
      _controller[index].text = vehicles.brand! +
          " " +
          vehicles.model! +
          " " +
          vehicles.licensePlate!.toUpperCase();
      return NskTextField(
        enabled: false,
        controller: _controller[index],
      );
    }, childCount: vehicle.length));
  }
}
