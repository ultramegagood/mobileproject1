import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:mobile_nsk/models/contacts/contacts_model.dart';


class ContactsProvider {

  Future<ContactsModel> getOfficesList() async {

    String releaseBaseUrl =
        'https://www.nsk.kz/ru/contacts/default/get-contacts/?latitude=76.890900497437&longitude=43.237781845365';
    final response = await get(Uri.parse(releaseBaseUrl));
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      final contacts = ContactsModel.fromJson({
        'contacts': jsonDecode(response.body),
      });
      return contacts;
    } else {
      return ContactsModel();
    }
  }
}
