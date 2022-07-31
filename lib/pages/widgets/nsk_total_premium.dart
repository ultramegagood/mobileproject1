import 'package:flutter/material.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';

class NskTotalPremium extends StatelessWidget {
  final AsyncSnapshot<Policy> snapshot;
  const NskTotalPremium({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17, left: 16, top: 26, ),
      child: Container(
        padding: const EdgeInsets.only(right: 15, left: 15),
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xff2D60E2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Text(
              "Итоговая сумма:",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              snapshot.data?.discountedPremium.toString() ?? "null",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
