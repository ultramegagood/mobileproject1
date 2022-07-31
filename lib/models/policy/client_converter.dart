import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:mobile_nsk/models/policy/clients.dart';
class ClientConverter extends TypeConverter<Client, String>{
  const ClientConverter();
  @override
  Client? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Client.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String? mapToSql(Client? value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}
