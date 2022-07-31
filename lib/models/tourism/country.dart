
// import 'package:json_annotation/json_annotation.dart';
// part 'country.g.dart';

// @JsonSerializable()
// class Country{
//     final int id;
//     final String name;
//     final int region;

//   Country(this.id, this.name, this.region);

//   factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

// }

class Country {
  List<Countires>? countries;

  Country({this.countries});

  Country.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      countries = <Countires>[];
      json['data'].forEach((v) {
        countries!.add(Countires.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countries != null) {
      data['data'] = countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countires {
  int? id;
  String? name;
  int? regionId;

  Countires({this.id, this.name, this.regionId});

  Countires.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    regionId = json['regionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['regionId'] = regionId;
    return data;
  }
}

