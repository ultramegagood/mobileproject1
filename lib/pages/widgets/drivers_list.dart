import 'package:flutter/material.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/pages/widgets/nsk_textfield.dart';

class DriverList extends StatelessWidget {
  final AsyncSnapshot<Policy> snapshot;
  
  const DriverList({ Key? key , required  this.snapshot}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
                  final driverSnap = snapshot.data?.drivers
                      .where((element) => element.isDriver == true);
    return SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                        final driver = snapshot.data!.drivers[index];
                        List<TextEditingController> _controller = List.generate(
                            driverSnap!.length, (i) => TextEditingController());
                        if (driver.isIndividual == 1) {
                          _controller[index].text = driver.lastName! +
                              " " +
                              driver.firstName! +
                              " " +
                              driver.middleName!;
                        } else {
                          _controller[index].text = driver.legalName!;
                        }
                        return NskTextField(
                          enabled: false,
                          label: driver.isIndividual == 1
                              ? "ФИО"
                              : "Наименования организаций",
                          controller: _controller[index],
                        );
                      }, childCount: driverSnap!.length));
  }
}