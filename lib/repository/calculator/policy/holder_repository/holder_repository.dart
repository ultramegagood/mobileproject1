import 'package:mobile_nsk/database/database.dart';
import 'package:mobile_nsk/models/policy/clients.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'holder_provider.dart';

class HolderRepository {
  final MyDatabase database;
  final HolderProvider _usersProvider = HolderProvider();
  HolderRepository(
    this.database,
  );
  Future getFulllUser(String text, bool isDriver, bool isInsurer,
      Policy policyEntries) async {
    return _usersProvider.getHolder(
        text, database, isDriver, isInsurer, policyEntries, policyEntries);
  }

  Future<void> setFullClient(
    Client client,
    bool isInsurer,
    String phone,
    String address,
    String email,
    String documentNumber,
    String documentIssueDate,
      String toNamed
  ) async {
    await database.selectClientById(client);
    return _usersProvider.setClient(
      client,
      isInsurer,
      phone,
      address,
      email,
      documentNumber,
      documentIssueDate,
      toNamed
    );
  }
}
