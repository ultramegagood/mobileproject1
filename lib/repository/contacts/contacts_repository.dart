import 'package:mobile_nsk/models/contacts/contacts_model.dart';
import 'package:mobile_nsk/repository/contacts/contacts_provider.dart';

class ContactsRepository {
  ContactsProvider _provider = ContactsProvider();

  Future<ContactsModel> getOfficesList() async => _provider.getOfficesList();
}
