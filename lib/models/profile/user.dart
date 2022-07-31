class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? iin;
  String? phone;
  String? phoneVerifiedAt;
  String? docNum;
  int? nskClientId;
  String? role;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.iin,
      this.phone,
      this.phoneVerifiedAt,
      this.docNum,
      this.nskClientId,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iin = json['iin'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    docNum = json['doc_num'];
    nskClientId = json['nsk_client_id'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['iin'] = this.iin;
    data['phone'] = this.phone;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['doc_num'] = this.docNum;
    data['nsk_client_id'] = this.nskClientId;
    data['role'] = this.role;
    return data;
  }
}
