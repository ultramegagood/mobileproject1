import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:mobile_nsk/core/my_policy/my_policy_controller.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Archive extends GetView<MyPolicyController> {
  Archive({Key? key}) : super(key: key);

  final controller = Get.put(MyPolicyController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(20),
        horizontal: getProportionateScreenWidth(16),
      ),
      itemCount: controller.archive.value!.policies!.length,
      separatorBuilder: (_, __) => SizedBox(
        height: getProportionateScreenHeight(15),
      ),
      itemBuilder: (_, index) => GestureDetector(
        onTap: () => controller.openFile('File$index', index),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(16),
              horizontal: getProportionateScreenWidth(16)),
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(205, 218, 250, 1)),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NskText(
                    controller.archive.value!.policies![index].productName!,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  NskText(
                      controller.archive.value!.policies![index].productId!
                          .toString(),
                      fontSize: 16),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(12),
              ),
              // SizedBox(height: getProportionateScreenHeight(8)),
              // const NskText(
              //   'Стандартный договор',
              //   fontSize: 16,
              // ),
              // SizedBox(height: getProportionateScreenHeight(14)),
              NskText(
                controller.archive.value!.policies![index].fromDate! +
                    ' - ' +
                    controller.archive.value!.policies![index].tillDate!,
                fontSize: 16,
              ),
              SizedBox(height: getProportionateScreenHeight(4)),
              LinearPercentIndicator(
                padding: EdgeInsets.zero,
                width: MediaQuery.of(context).size.width * 0.48,
                lineHeight: 3.0,
                percent: 0,
                progressColor: Colors.red,
              ),
              SizedBox(height: getProportionateScreenHeight(4)),
              const NskText('Период закончился', fontSize: 13),
            ],
          ),
        ),
      ),
    );
  }
}
