import 'dart:io';
import 'package:drift/native.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';
import 'package:mobile_nsk/models/policy/clients.dart';
import 'package:mobile_nsk/models/policy/client_converter.dart';
import 'package:mobile_nsk/models/policy/policy_converter.dart';
import 'package:mobile_nsk/models/policy/vehicle.dart';
import 'package:mobile_nsk/models/policy/vehicle_converter.dart';
import 'package:mobile_nsk/models/tourism/insured_list.dart';
import 'package:mobile_nsk/models/tourism/tourism.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path_provider/path_provider.dart';
part 'database.g.dart';

LazyDatabase _openConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'nsk.sqlite'));
      return NativeDatabase(file, logStatements: true);
    });

@DriftDatabase(
  tables: [
    Clients,
    Vehicles,
    PolicieEntrie,
    ClientPolicyEntries,
    VehiclePolicyEntries,
    TourismEntries,
    InsuredListEntries,
    InsuredListTourism,
  ],
)
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  Future getPolicy() => select(policieEntrie).get();
  Future<void> insertClientPolicy(int client, int policyEntries) =>
      into(clientPolicyEntries).insert(
          ClientPolicyEntriesCompanion(
              client: Value(client), policy: Value(policyEntries)),
          mode: InsertMode.insertOrReplace);
  Future<void> insertVehiclePolicy(int vehicle, Policy policy) =>
      into(vehiclePolicyEntries).insert(
          VehiclePolicyEntriesCompanion(
              vehicle: Value(vehicle), policy: Value(policy.id)),
          mode: InsertMode.insertOrReplace);
  Future<void> writeShoppingCart(Policy entry) {
    return transaction(() async {
      final cart = entry;
      // first, we write the shopping cart
      await into(policieEntrie).insert(cart, mode: InsertMode.replace);
      // we replace the entries of the cart, so first delete the old ones
      await (delete(clientPolicyEntries)
            ..where((entry) => entry.policy.equals(cart.id)))
          .go();
      // And write the new ones
      for (final drivers in entry.drivers) {
        await into(clientPolicyEntries).insert(
            ClientPolicyEntrie(client: drivers.id, policy: cart.id),
            mode: InsertMode.insertOrReplace);
      }
      for (final vehicle in entry.vehicles) {
        await into(vehiclePolicyEntries).insert(
            VehiclePolicyEntrie(vehicle: vehicle.id, policy: cart.id),
            mode: InsertMode.insertOrReplace);
      }
    });
  }

  Future<Policy> createEmptyPolicy() async {
    final id = await into(policieEntrie).insert(const PolicieEntrieCompanion());
    final policy = Policy(id, null, null, null, null, 0, 0, 0, null, null, 0, 0,
        null, 0, 0, 0, 0, null, 0, null, [], []);
    return policy;
  }

  Future updatePremium(Policy policyEntries, int premium, int discount) =>
      (update(policieEntrie)..where((tbl) => tbl.id.equals(policyEntries.id)))
          .write(
        PolicieEntrieCompanion(
            premium: Value(premium), discountedPremium: Value(discount)),
      );
  Stream<Policy> watchCart() {
    // load information about the cart
    final cartQuery = select(policieEntrie);
    // and also load information about the entries in cart cart
    final contentQuery = select(clientPolicyEntries).join(
      [
        innerJoin(
          clients,
          clients.id.equalsExp(clientPolicyEntries.client),
        ),
      ],
    )..where(clientPolicyEntries.policy.equals(1));
    final vehicleQuery = select(vehiclePolicyEntries).join(
      [
        innerJoin(
          vehicles,
          vehicles.id.equalsExp(vehiclePolicyEntries.vehicle),
        ),
      ],
    )..where(vehiclePolicyEntries.policy.equals(1));
    final cartStream = cartQuery.watchSingle();

    final contentStream = contentQuery.watch().map((rows) {
      return rows.map((row) => row.readTable(clients)).toList();
    });
    final vehicleStream = vehicleQuery.watch().map((rows) {
      return rows.map((row) => row.readTable(vehicles)).toList();
    });

    return Rx.combineLatest3(cartStream, contentStream, vehicleStream,
        (Policy policyEntries, List<Client> items, List<Vehicle> vehicle) {
      return Policy(
          policyEntries.id,
          policyEntries.number,
          policyEntries.signTime,
          policyEntries.validFrom,
          policyEntries.validTill,
          policyEntries.customerId,
          policyEntries.insuranceTypeId,
          policyEntries.contractTypeId,
          policyEntries.mobileNumber,
          policyEntries.email,
          policyEntries.notificationTypeId,
          policyEntries.promo,
          policyEntries.filialId,
          policyEntries.discountedPremium,
          policyEntries.discount,
          policyEntries.premium,
          policyEntries.paymentType,
          policyEntries.siteUserId,
          policyEntries.insuranceCoverSum,
          null,
          items,
          vehicle);
    });
  }

  // Stream<Tourism> watchTourism() {
  //   // load information about the cart
  //   final cartQuery = select(tourismEntries);

  //   // and also load information about the entries in cart cart
  //   final contentQuery = select(insuredListTourism).join(
  //     [
  //       innerJoin(
  //         insuredListEntries,
  //         insuredListEntries.id.equalsExp(insuredListTourism.insuredList),
  //       ),
  //     ],
  //   )..where(insuredListTourism.tourism.equals(0));

  //   final cartStream = cartQuery.watchSingle();

  //   final contentStream = contentQuery.watch().map((rows) {
  //     // we join the shoppingCartEntries with the buyableItems, but we
  //     // only care about the item here.
  //     return rows.map((row) => row.readTable(insuredListEntries)).toList();
  //   });

  //   // now, we can merge the two queries together in one stream
  //   return Rx.combineLatest2(cartStream, contentStream,
  //       (Tourism cart, List<InsuredList> insuredList) {
  //     return Tourism(
  //         id: cart.id,
  //         number: cart.number,
  //         signTime: cart.signTime,
  //         validFrom: cart.validFrom,
  //         validTill: cart.validTill,
  //         customerId: cart.customerId,
  //         insuranceTypeId: cart.insuranceTypeId,
  //         contractTypeId: cart.contractTypeId,
  //         mobileNumber: cart.mobileNumber,
  //         email: cart.email,
  //         notificationTypeId: cart.notificationTypeId,
  //         promo: cart.promo,
  //         filialId: cart.filialId,
  //         siteUserId: cart.siteUserId,
  //         discount: cart.discount,
  //         insuranceAmount: cart.insuranceAmount,
  //         premium: cart.premium,
  //         insuredCount: cart.insuredCount,
  //         isMultitrip: cart.isMultitrip,
  //         promoCode: cart.promoCode,
  //         purposeId: cart.purposeId,
  //         regionId: cart.regionId,
  //         franchiseId: cart.franchiseId,
  //         sportId: cart.sportId,
  //         sportCategoryId: cart.sportCategoryId,
  //         multitripProgrammeId: cart.multitripProgrammeId,
  //         insuranceAmountId: cart.insuranceAmountId,
  //         ageGroupId: cart.ageGroupId,
  //         insurantTravels: cart.insurantTravels,
  //         isCovid: cart.isCovid,
  //         covidLimit: cart.covidLimit,
  //         clientsBirthDate: cart.clientsBirthDate,
  //         insuredList: cart.insuredList,);
  //   });
  // }

  Future deletePolicy() => delete(policieEntrie).go();
  Future insertDate(String start, String end, int policy) =>
      (update(policieEntrie)..where((tbl) => tbl.id.equals(policy))).write(
        PolicieEntrieCompanion(validFrom: Value(start), validTill: Value(end)),
      );

  // Client side
  Future insertNewClient(
      Client client, int id, bool isDriver, bool isInsurer) async {
    await into(clients).insert(client, mode: InsertMode.insertOrReplace).then(
        (value) => update(clients)
          ..where((tbl) => tbl.id.equals(id))
          ..write(ClientsCompanion(
              isDriver: Value(isDriver), isInsurer: Value(isInsurer))));
  }

  Future clientIsDriver(Client client, bool isDriver) async {
    return (update(clients)..where((tbl) => tbl.id.equals(client.id)))
        .write(ClientsCompanion(isDriver: Value(isDriver)));
  }

  Future deleteAllClient() => delete(clients).go();
  Future updateClient(
    Client client,
    String phone,
    String address,
    String email,
    String documentIssue,
    String documentNumber,
    Policy policyEntries,
  ) async {
    return (update(clients)..where((tbl) => tbl.id.equals(client.id))).write(
        ClientsCompanion(
            phone: Value(phone),
            address: Value(address),
            email: Value(email),
            documentIssueDate: Value(documentIssue),
            documentNumber: Value(documentNumber)));
  }

  Stream<List<Client>> watchInsurer() => select(clients).watch();
  Future<Client> selectClientById(Client client) async {
    select(clients)
      ..where((tbl) => tbl.id.equals(client.id))
      ..get();
    return client;
  }

  Future updatePolicy(Policy policyEntries, String email) =>
      (update(policieEntrie)
            ..where(
              (tbl) => tbl.id.equals(policyEntries.id),
            ))
          .write(PolicieEntrieCompanion(email: Value(email)));
  // Для транспорта
  Future insertNewVehicle(Vehicle vehicle) =>
      into(vehicles).insert(vehicle, mode: InsertMode.insertOrReplace);
  Future deleteVehicle(Vehicle vehicle) => delete(vehicles).delete(vehicle);
  Future deleteAllVehicles() => delete(vehicles).go();

  // всегда инкрементить версию схему если что то добавил/убрал/изменил/нахуевертил
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
        return m.createAll();
      }, onUpgrade: (m, from, to) async {
        if (from == 1) {}
      }, beforeOpen: (details) async {
        if (details.wasCreated) {
          await customStatement('PRAGMA foreign_keys = ON');
        }
      });
}
