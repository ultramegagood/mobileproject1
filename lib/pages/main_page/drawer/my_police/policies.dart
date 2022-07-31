import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:mobile_nsk/core/my_policy/my_policy_controller.dart';
import 'package:mobile_nsk/pages/widgets/loading_view.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Policies extends GetView<MyPolicyController> {
  Policies({Key? key}) : super(key: key);

  @override
  final controller = Get.put(MyPolicyController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        child: controller.loadRx.value
            ? const LoadingView()
            : controller.activePolicies.value == null
                ? Center(
                    child: NskText(
                      'Нет данных',
                      fontSize: 16,
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(20),
                      horizontal: getProportionateScreenWidth(16),
                    ),
                    itemCount: controller.items.value.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(height: getProportionateScreenHeight(15)),
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () => controller.setSelected(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(16),
                            horizontal: getProportionateScreenWidth(16)),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(205, 218, 250, 1)),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const NskText(
                                    'ОС ГПО ВТС',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                  Visibility(
                                    visible: controller.items.value[index],
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical:
                                            getProportionateScreenHeight(6),
                                        horizontal:
                                            getProportionateScreenWidth(10),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  45, 96, 226, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          NskText(
                                            'PDF',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color:
                                                Color.fromRGBO(45, 96, 226, 1),
                                          ),
                                          Icon(
                                            CupertinoIcons.arrow_down_to_line,
                                            size: 18,
                                            color:
                                                Color.fromRGBO(45, 96, 226, 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const NskText('197863029', fontSize: 16),
                            SizedBox(height: getProportionateScreenHeight(8)),
                            const NskText(
                              'Стандартный договор',
                              fontSize: 16,
                            ),
                            SizedBox(height: getProportionateScreenHeight(14)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const NskText(
                                        '16 мая 2019 - 15 мая 2020',
                                        fontSize: 16,
                                      ),
                                      SizedBox(
                                          height:
                                              getProportionateScreenHeight(4)),
                                      LinearPercentIndicator(
                                        padding: EdgeInsets.zero,
                                        lineHeight: 3.0,
                                        percent: 0.75,
                                        progressColor: Colors.red,
                                      ),
                                      SizedBox(
                                          height:
                                              getProportionateScreenHeight(4)),
                                      const NskText('Остался месяц',
                                          fontSize: 13),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: controller.items.value[index],
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(10),
                                      vertical:
                                          getProportionateScreenHeight(10),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.primary,
                                    ),
                                    child: const NskText(
                                      'Продлить',
                                      color: AppColors.white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
