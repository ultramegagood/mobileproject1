import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';

class PolicyConverter extends TypeConverter<Policy, String>{
const PolicyConverter();
@override
Policy? mapToDart(String? fromDb) {
  if (fromDb == null) {
    return null;
  }
  return Policy.fromJson(json.decode(fromDb) as Map<String, dynamic>);
}

@override
String? mapToSql(Policy? value) {
  if (value == null) {
    return null;
  }

  return json.encode(value.toJson());
}
}
