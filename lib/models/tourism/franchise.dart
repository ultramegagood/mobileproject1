// import 'package:json_annotation/json_annotation.dart';

// part 'franchise.g.dart';

// @JsonSerializable()
// class Franchise{
//   final int id;
//   final String name;

//   Franchise(this.id, this.name);
// }

class FranchisesResponse {
  List<Franchises>? franchises;

  FranchisesResponse({this.franchises});

  FranchisesResponse.fromJson(Map<String, dynamic> json) {
    if (json['franchises'] != null) {
      franchises = <Franchises>[];
      json['franchises'].forEach((v) {
        franchises!.add(new Franchises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.franchises != null) {
      data['franchises'] = this.franchises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Franchises {
  int? franchiseId;
  int? premium;

  Franchises({this.franchiseId, this.premium});

  Franchises.fromJson(Map<String, dynamic> json) {
    franchiseId = json['franchiseId'];
    premium = json['premium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['franchiseId'] = this.franchiseId;
    data['premium'] = this.premium;
    return data;
  }
}

