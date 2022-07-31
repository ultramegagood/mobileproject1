class ContactsModel {
  List<Contacts>? contacts;

  ContactsModel({this.contacts});

  ContactsModel.fromJson(Map<String, dynamic> json) {
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(new Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contacts {
  String? id;
  String? cityId;
  String? title;
  String? phones;
  String? email;
  String? address;
  String? longitude;
  String? latitude;
  String? workHours;
  String? contacts;
  String? isPaymentCenter;
  DefaultTranslation? defaultTranslation;

  Contacts(
      {this.id,
      this.cityId,
      this.title,
      this.phones,
      this.email,
      this.address,
      this.longitude,
      this.latitude,
      this.workHours,
      this.contacts,
      this.isPaymentCenter,
      this.defaultTranslation});

  Contacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    title = json['title'];
    phones = json['phones'];
    email = json['email'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    workHours = json['work_hours'];
    contacts = json['contacts'];
    isPaymentCenter = json['is_payment_center'];
    defaultTranslation = json['defaultTranslation'] != null
        ? new DefaultTranslation.fromJson(json['defaultTranslation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_id'] = this.cityId;
    data['title'] = this.title;
    data['phones'] = this.phones;
    data['email'] = this.email;
    data['address'] = this.address;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['work_hours'] = this.workHours;
    data['contacts'] = this.contacts;
    data['is_payment_center'] = this.isPaymentCenter;
    if (this.defaultTranslation != null) {
      data['defaultTranslation'] = this.defaultTranslation!.toJson();
    }
    return data;
  }
}

class DefaultTranslation {
  String? contactId;
  String? langId;
  String? title;
  String? address;
  String? workHours;
  String? director;

  DefaultTranslation(
      {this.contactId,
      this.langId,
      this.title,
      this.address,
      this.workHours,
      this.director});

  DefaultTranslation.fromJson(Map<String, dynamic> json) {
    contactId = json['contact_id'];
    langId = json['lang_id'];
    title = json['title'];
    address = json['address'];
    workHours = json['work_hours'];
    director = json['director'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_id'] = this.contactId;
    data['lang_id'] = this.langId;
    data['title'] = this.title;
    data['address'] = this.address;
    data['work_hours'] = this.workHours;
    data['director'] = this.director;
    return data;
  }
}

