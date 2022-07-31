import 'dart:core';

class ArchivePolicy {
  List<Policies>? policies;

  ArchivePolicy({this.policies});

  ArchivePolicy.fromJson(Map<String, dynamic> json) {
    if (json['policies'] != null) {
      policies = <Policies>[];
      json['policies'].forEach((v) {
        policies!.add(new Policies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.policies != null) {
      data['policies'] = this.policies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Policies {
  int? id;
  String? esbdId;
  Insurer? insurer;
  Holder? holder;
  Agent? agent;
  int? productId;
  String? productName;
  bool? isActive;
  bool? commission;
  String? isPaymentCheck;
  String? signDate;
  String? fromDate;
  String? tillDate;
  int? premium;
  int? insuranceAmount;
  String? paymentType;
  String? paymentScheduleType;
  String? paymentDescription;
  List<PaymentSchedule>? paymentSchedule;
  List<Insured>? insured;
  List<Extras>? extras;
  List<Objects>? objects;
  List<Franchises>? franchises;
  InsuranceCase? insuranceCase;
  String? objectsDescription;
  String? legalInformation;

  Policies(
      {this.id,
      this.esbdId,
      this.insurer,
      this.holder,
      this.agent,
      this.productId,
      this.productName,
      this.isActive,
      this.commission,
      this.isPaymentCheck,
      this.signDate,
      this.fromDate,
      this.tillDate,
      this.premium,
      this.insuranceAmount,
      this.paymentType,
      this.paymentScheduleType,
      this.paymentDescription,
      this.paymentSchedule,
      this.insured,
      this.extras,
      this.objects,
      this.franchises,
      this.insuranceCase,
      this.objectsDescription,
      this.legalInformation});

  Policies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    esbdId = json['esbdId'];
    insurer =
        json['insurer'] != null ? new Insurer.fromJson(json['insurer']) : null;
    holder =
        json['holder'] != null ? new Holder.fromJson(json['holder']) : null;
    agent = json['agent'] != null ? new Agent.fromJson(json['agent']) : null;
    productId = json['productId'];
    productName = json['productName'];
    isActive = json['isActive'];
    commission = json['commission'];
    isPaymentCheck = json['isPaymentCheck'];
    signDate = json['signDate'];
    fromDate = json['fromDate'];
    tillDate = json['tillDate'];
    premium = json['premium'];
    insuranceAmount = json['insuranceAmount'];
    paymentType = json['paymentType'];
    paymentScheduleType = json['paymentScheduleType'];
    paymentDescription = json['paymentDescription'];
    if (json['paymentSchedule'] != null) {
      paymentSchedule = <PaymentSchedule>[];
      json['paymentSchedule'].forEach((v) {
        paymentSchedule!.add(new PaymentSchedule.fromJson(v));
      });
    }
    if (json['insured'] != null) {
      insured = <Insured>[];
      json['insured'].forEach((v) {
        insured!.add(new Insured.fromJson(v));
      });
    }
    if (json['extras'] != null) {
      extras = <Extras>[];
      json['extras'].forEach((v) {
        extras!.add(new Extras.fromJson(v));
      });
    }
    if (json['objects'] != null) {
      objects = <Objects>[];
      json['objects'].forEach((v) {
        objects!.add(new Objects.fromJson(v));
      });
    }
    if (json['franchises'] != null) {
      franchises = <Franchises>[];
      json['franchises'].forEach((v) {
        franchises!.add(new Franchises.fromJson(v));
      });
    }
    insuranceCase = json['insuranceCase'] != null
        ? new InsuranceCase.fromJson(json['insuranceCase'])
        : null;
    objectsDescription = json['objectsDescription'];
    legalInformation = json['legalInformation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['esbdId'] = this.esbdId;
    if (this.insurer != null) {
      data['insurer'] = this.insurer!.toJson();
    }
    if (this.holder != null) {
      data['holder'] = this.holder!.toJson();
    }
    if (this.agent != null) {
      data['agent'] = this.agent!.toJson();
    }
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['isActive'] = this.isActive;
    data['commission'] = this.commission;
    data['isPaymentCheck'] = this.isPaymentCheck;
    data['signDate'] = this.signDate;
    data['fromDate'] = this.fromDate;
    data['tillDate'] = this.tillDate;
    data['premium'] = this.premium;
    data['insuranceAmount'] = this.insuranceAmount;
    data['paymentType'] = this.paymentType;
    data['paymentScheduleType'] = this.paymentScheduleType;
    data['paymentDescription'] = this.paymentDescription;
    if (this.paymentSchedule != null) {
      data['paymentSchedule'] =
          this.paymentSchedule!.map((v) => v.toJson()).toList();
    }
    if (this.insured != null) {
      data['insured'] = this.insured!.map((v) => v.toJson()).toList();
    }
    if (this.extras != null) {
      data['extras'] = this.extras!.map((v) => v.toJson()).toList();
    }
    if (this.objects != null) {
      data['objects'] = this.objects!.map((v) => v.toJson()).toList();
    }
    if (this.franchises != null) {
      data['franchises'] = this.franchises!.map((v) => v.toJson()).toList();
    }
    if (this.insuranceCase != null) {
      data['insuranceCase'] = this.insuranceCase!.toJson();
    }
    data['objectsDescription'] = this.objectsDescription;
    data['legalInformation'] = this.legalInformation;
    return data;
  }
}

class Insurer {
  String? name;
  String? address;
  String? bank;

  Insurer({this.name, this.address, this.bank});

  Insurer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    bank = json['bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['bank'] = this.bank;
    return data;
  }
}

class Holder {
  int? id;
  String? name;
  String? iin;
  String? phone;
  String? residence;
  String? activityKind;
  String? economicSector;
  String? address;
  String? birthDate;
  bool? isLegal;
  String? bank;

  Holder(
      {this.id,
      this.name,
      this.iin,
      this.phone,
      this.residence,
      this.activityKind,
      this.economicSector,
      this.address,
      this.birthDate,
      this.isLegal,
      this.bank});

  Holder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iin = json['iin'];
    phone = json['phone'];
    residence = json['residence'];
    activityKind = json['activityKind'];
    economicSector = json['economicSector'];
    address = json['address'];
    birthDate = json['birthDate'];
    isLegal = json['isLegal'];
    bank = json['bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['iin'] = this.iin;
    data['phone'] = this.phone;
    data['residence'] = this.residence;
    data['activityKind'] = this.activityKind;
    data['economicSector'] = this.economicSector;
    data['address'] = this.address;
    data['birthDate'] = this.birthDate;
    data['isLegal'] = this.isLegal;
    data['bank'] = this.bank;
    return data;
  }
}

class Agent {
  int? id;
  String? name;
  String? iin;
  String? phone;
  Null? residence;
  Null? activityKind;
  Null? economicSector;
  Null? address;
  Null? birthDate;
  bool? isLegal;
  Null? bank;

  Agent(
      {this.id,
      this.name,
      this.iin,
      this.phone,
      this.residence,
      this.activityKind,
      this.economicSector,
      this.address,
      this.birthDate,
      this.isLegal,
      this.bank});

  Agent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iin = json['iin'];
    phone = json['phone'];
    residence = json['residence'];
    activityKind = json['activityKind'];
    economicSector = json['economicSector'];
    address = json['address'];
    birthDate = json['birthDate'];
    isLegal = json['isLegal'];
    bank = json['bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['iin'] = this.iin;
    data['phone'] = this.phone;
    data['residence'] = this.residence;
    data['activityKind'] = this.activityKind;
    data['economicSector'] = this.economicSector;
    data['address'] = this.address;
    data['birthDate'] = this.birthDate;
    data['isLegal'] = this.isLegal;
    data['bank'] = this.bank;
    return data;
  }
}

class PaymentSchedule {
  String? date;
  int? sum;

  PaymentSchedule({this.date, this.sum});

  PaymentSchedule.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['sum'] = this.sum;
    return data;
  }
}

class Objects {
  String? name;
  String? value;

  Objects({this.name, this.value});

  Objects.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class InsuranceCase {
  String? event;
  String? description;

  InsuranceCase({this.event, this.description});

  InsuranceCase.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event'] = this.event;
    data['description'] = this.description;
    return data;
  }
}

class Insured {
  int? id;
  String? name;
  String? iin;
  String? phone;
  String? residence;
  String? activityKind;
  String? economicSector;
  String? address;
  String? birthDate;
  bool? isLegal;
  String? bank;

  Insured(
      {this.id,
      this.name,
      this.iin,
      this.phone,
      this.residence,
      this.activityKind,
      this.economicSector,
      this.address,
      this.birthDate,
      this.isLegal,
      this.bank});

  Insured.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iin = json['iin'];
    phone = json['phone'];
    residence = json['residence'];
    activityKind = json['activityKind'];
    economicSector = json['economicSector'];
    address = json['address'];
    birthDate = json['birthDate'];
    isLegal = json['isLegal'];
    bank = json['bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['iin'] = this.iin;
    data['phone'] = this.phone;
    data['residence'] = this.residence;
    data['activityKind'] = this.activityKind;
    data['economicSector'] = this.economicSector;
    data['address'] = this.address;
    data['birthDate'] = this.birthDate;
    data['isLegal'] = this.isLegal;
    data['bank'] = this.bank;
    return data;
  }
}

class Extras {
  Extras.fromJson(Map<String, dynamic> json) {}
  Map<String, dynamic> toJson() {
    return Map<String, dynamic>();
  }
}

class Franchises {
  Franchises.fromJson(Map<String, dynamic> json) {}
  Map<String, dynamic> toJson() {
    return Map<String, dynamic>();
  }
}
