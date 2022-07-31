class Purpose {
  List<Purposes>? purposes;

  Purpose({this.purposes});

  Purpose.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      purposes = <Purposes>[];
      json['data'].forEach((v) {
        purposes!.add(Purposes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (purposes != null) {
      data['data'] = purposes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Purposes {
  int? id;
  String? name;

  Purposes({this.id, this.name});

  Purposes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

