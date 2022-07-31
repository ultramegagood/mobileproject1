class CountryInsuranceAmounts {
  List<Amounts>? amounts;

  CountryInsuranceAmounts({this.amounts});

  CountryInsuranceAmounts.fromJson(Map<String, dynamic> json) {
    if (json['amounts'] != null) {
      amounts = <Amounts>[];
      json['amounts'].forEach((v) {
        amounts!.add(new Amounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amounts != null) {
      data['amounts'] = this.amounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Amounts {
  int? id;
  int? euro;
  int? tenge;

  Amounts({this.id, this.euro, this.tenge});

  Amounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    euro = json['euro'];
    tenge = json['tenge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['euro'] = this.euro;
    data['tenge'] = this.tenge;
    return data;
  }
}

