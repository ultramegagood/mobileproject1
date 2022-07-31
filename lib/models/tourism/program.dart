class Programs {
  List<Data>? data;

  Programs({this.data});

  Programs.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? code;
  int? period;
  int? countryPeriod;
  int? abroadPeriod;

  Data(
      {this.id,
      this.name,
      this.code,
      this.period,
      this.countryPeriod,
      this.abroadPeriod});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    period = json['period'];
    countryPeriod = json['countryPeriod'];
    abroadPeriod = json['abroadPeriod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['period'] = period;
    data['countryPeriod'] = countryPeriod;
    data['abroadPeriod'] = abroadPeriod;
    return data;
  }
}

