import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_nsk/database/database.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/policy/clients.dart';
import 'package:drift/drift.dart' as drift;
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/repository/calculator/policy/holder_repository/holder_repository.dart';
import 'package:mobile_nsk/repository/calculator/policy/policy_repository/policy_repository.dart';
import 'package:mobile_nsk/repository/calculator/policy/vehicle_repository/vehicle_repository.dart';

class PolicyController extends GetxController with StateMixin<Policy> {
  var loaderRx = RxBool(false);
  final policyRepository = PolicyRepository();

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    database.deleteAllClient();
    database.deletePolicy();
    database.deleteAllVehicles();
    database.createEmptyPolicy();
    super.onInit();
  }

  void getInsuranceAmount() async {
    loaderRx(true);
    await PolicyRepository().getInsuranceAmount();
    loaderRx(false);
  }

  void insertInsuranceSum(int amountId, Policy policyEntries) => (database
          .update(database.policieEntrie)
        ..where((tbl) => tbl.id.equals(policyEntries.id)))
      .write(PolicieEntrieCompanion(insuranceCoverSum: drift.Value(amountId)));

  void updateClient(
    Client client,
    String phone,
    String address,
    String email,
    String documentIssue,
    String documentNumber,
    bool isInsurer,
    Policy policieEntries,
  ) async {
    await (database.update(database.clients)
          ..where((tbl) => tbl.id.equals(client.id)))
        .write(ClientsCompanion(
            id: drift.Value(client.id),
            phone: drift.Value(phone),
            address: drift.Value(address),
            email: drift.Value(email),
            documentIssueDate: drift.Value(documentIssue),
            documentNumber: drift.Value(documentNumber)));
    await database.select(database.clientPolicyEntries).get();
    await database.select(database.clients).get();
    await database.updatePolicy(policieEntries, email);
  }

  Future policyCalculate(
      Policy policy, String validFrom, String validTill) async {
    loaderRx(true);
    await PolicyRepository().ogpoCalculate(policy, validFrom, validTill);
    await Future.delayed(const Duration(seconds: 1));
    loaderRx(false);
  }

  Future kaskoCalculate(Policy policy, int amountId) async {
    loaderRx(true);
    await Future.delayed(const Duration(seconds: 3));
    await PolicyRepository().kaskoExpressWrite(policy, amountId);
    await Future.delayed(const Duration(seconds: 2));
    loaderRx(false);
  }

  Future<void> setFullCLient(
      Client client,
      bool isInsurer,
      String phone,
      String address,
      String email,
      String documentNumber,
      String documentIssueDate,
      String toNamed) async {
    loaderRx(true);
    await HolderRepository(database).setFullClient(client, isInsurer, phone,
        address, email, documentNumber, documentIssueDate, toNamed);
    loaderRx(false);
  }

  void policyWrite(Policy policyEntries) async {
    loaderRx(true);
    await policyRepository.policyWrite(policyEntries);
    await Future.delayed(const Duration(seconds: 1));
    loaderRx(false);
  }

  Future<void> getVehicle(String licensePlate, Policy policyEntrie) async {
    loaderRx(true);
    await VehicleRepository(database)
        .getOgpoVehicle(licensePlate, policyEntrie);
    await Future.delayed(const Duration(seconds: 1));
    loaderRx(false);
  }

  void getHolder(
      String text, bool isDriver, bool isInsurer, Policy policyEntries) async {
    loaderRx(true);

    await HolderRepository(database)
        .getFulllUser(text, isDriver, isInsurer, policyEntries);
    await Future.delayed(const Duration(seconds: 4));
    loaderRx(false);
  }
}
