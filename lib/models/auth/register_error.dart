class RegisterError {
  bool? error;
  Data? data;

  RegisterError({this.error, this.data});

  RegisterError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? iin;
  List<String>? phone;
  List<String>? password;

  Data({this.iin, this.phone, this.password});

  Data.fromJson(Map<String, dynamic> json) {
    iin = json['iin'].cast<String>();
    phone = json['phone'].cast<String>();
    password = json['password'] != null ? json['password'].cast<String>() : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iin'] = iin;
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
