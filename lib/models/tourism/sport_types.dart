import 'package:json_annotation/json_annotation.dart';

part 'sport_types.g.dart';

@JsonSerializable()
class SportTypes{
    final int id;
  final String name;

  SportTypes(this.id, this.name);
}