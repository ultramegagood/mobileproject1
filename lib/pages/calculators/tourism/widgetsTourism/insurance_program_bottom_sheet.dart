import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/models/tourism/program.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';

class InsuranceProgramBottomSheet extends StatelessWidget {
  InsuranceProgramBottomSheet({Key? key, required this.programs})
      : super(key: key);
  final Rx<Programs> programs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(16)),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const NskTitle(
                  title: 'Программа страхования',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, bottom: 10, right: 16),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      CupertinoIcons.xmark,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: List.generate(
                      tableTitles.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(16),
                        child: NskText(
                          tableTitles[index],
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  ...List.generate(
                    programs.value.data!.length,
                    (pindex) => TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: NskText(
                            programs.value.data![pindex].name!
                                .replaceAll(RegExp(r'[^0-9]'), ''),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _chooseProgram(
                              programs.value.data![pindex].id!,
                              programs.value.data![pindex].name!,
                              programs.value.data![pindex].period!),
                          child: NskText(
                            programs.value.data![pindex].period!.toString(),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _chooseProgram(
                              programs.value.data![pindex].id!,
                              programs.value.data![pindex].name!,
                              programs.value.data![pindex].period!),
                          child: NskText(
                            programs.value.data![pindex].countryPeriod!
                                .toString(),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _chooseProgram(
                              programs.value.data![pindex].id!,
                              programs.value.data![pindex].name!,
                              programs.value.data![pindex].period!),
                          child: NskText(
                            programs.value.data![pindex].abroadPeriod!
                                .toString(),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> tableTitles = [
    'Программа',
    'Срок действия договора (дней)',
    'Кол-во дней за одну поездку',
    'Общее кол-во дней за границей',
  ];

  _chooseProgram(int id, String name, int days) {
    log("ID: " + id.toString());
    log('Days: ' + days.toString());
    Get.back(result: {
      id: [name, days]
    });
  }
}
