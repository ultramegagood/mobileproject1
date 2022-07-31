import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_nsk/models/contacts/contacts_model.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/theme.dart';

class ContactsOfficesList extends StatelessWidget {
  ContactsOfficesList({Key? key, required this.offices}) : super(key: key);
  final List<Contacts> offices;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 10, left: 16, right: 16),
        itemCount: offices.length,
        separatorBuilder: (_, __) => SizedBox(
          height: 10,
        ),
        itemBuilder: (_, index) {
          final workHours = offices[index].workHours!
              .split('<br>');
          final phones =offices[index].phones!.split('<br>');
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xffCDDAF9), width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NskText(
                  offices[index].title!,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    NskText(
                      offices[index].address!
                          .trimLeft(),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ...List.generate(
                  workHours.length,
                  (i) => NskText(
                    workHours[i].trimLeft(),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.mail_outline,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    NskText(offices[index].email!),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      CupertinoIcons.phone,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Column(
                      children: List.generate(
                        phones.length,
                        (i) => NskText(
                          phones[i].trimLeft(),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
  }
}
