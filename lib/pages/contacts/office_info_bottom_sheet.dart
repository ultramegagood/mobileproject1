import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_nsk/models/contacts/contacts_model.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class OfficeInfoBottomSheet extends StatelessWidget {
  const OfficeInfoBottomSheet({Key? key, required this.office})
      : super(key: key);
  final Contacts office;

  @override
  Widget build(BuildContext context) {
    final workHours = office.workHours!.split('<br>');
    final phones = office.phones!.split('<br>');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: NskText(
                                office.title!,
                                fontSize: 16,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        NskText(
                          office.address!.trimLeft(),
                          textAlign: TextAlign.start,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      workHours.length,
                      (i) => NskText(
                        workHours[i].trimLeft(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NskText(office.email!),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      phones.length,
                      (i) => GestureDetector(
                        onTap: () async {
                          log('Phone: ' +
                              phones[i].replaceAll(RegExp(r'[^0-9, +]'), ''));
                          await launchUrl(
                            Uri(
                              scheme: 'tel',
                              path: phones[i].replaceAll(RegExp(r'[^0-9]'), ''),
                            ),
                          );
                        },
                        child: NskText(
                          phones[i].trimLeft(),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
