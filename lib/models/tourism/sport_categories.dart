import 'package:json_annotation/json_annotation.dart';

part 'sport_categories.g.dart';

@JsonSerializable()
class SportCategory{
  final int id;
  final String name;

  SportCategory(this.id, this.name);
}