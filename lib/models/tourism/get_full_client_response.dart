class GetFullClientResponse {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? firstNameEng;
  String? lastNameEng;
  String? legalName;
  int? isIndividual;
  String? iin;
  int? isResident;
  int? countryId;
  int? sexId;
  int? economicsSectorId;
  int? activityKindId;
  int? documentTypeId;
  String? documentNumber;
  String? documentIssueDate;
  int? classs;
  String? birthDate;
  bool? isExperienced;
  bool? isPrivileged;
  int? priveledges;
  bool? recaptcha;

  GetFullClientResponse(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.firstNameEng,
      this.lastNameEng,
      this.legalName,
      this.isIndividual,
      this.iin,
      this.isResident,
      this.countryId,
      this.sexId,
      this.economicsSectorId,
      this.activityKindId,
      this.documentTypeId,
      this.documentNumber,
      this.documentIssueDate,
      this.classs,
      this.birthDate,
      this.isExperienced,
      this.isPrivileged,
      this.priveledges,
      this.recaptcha});

  GetFullClientResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    firstNameEng = json['firstNameEng'];
    lastNameEng = json['lastNameEng'];
    legalName = json['legalName'];
    isIndividual = json['isIndividual'];
    iin = json['iin'];
    isResident = json['isResident'];
    countryId = json['countryId'];
    sexId = json['sexId'];
    economicsSectorId = json['economicsSectorId'];
    activityKindId = json['activityKindId'];
    documentTypeId = json['documentTypeId'];
    documentNumber = json['documentNumber'];
    documentIssueDate = json['documentIssueDate'];
    classs = json['class'];
    birthDate = json['birthDate'];
    isExperienced = json['isExperienced'];
    isPrivileged = json['isPrivileged'];
    priveledges = json['priveledges'];
    recaptcha = json['recaptcha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['firstNameEng'] = this.firstNameEng;
    data['lastNameEng'] = this.lastNameEng;
    data['legalName'] = this.legalName;
    data['isIndividual'] = this.isIndividual;
    data['iin'] = this.iin;
    data['isResident'] = this.isResident;
    data['countryId'] = this.countryId;
    data['sexId'] = this.sexId;
    data['economicsSectorId'] = this.economicsSectorId;
    data['activityKindId'] = this.activityKindId;
    data['documentTypeId'] = this.documentTypeId;
    data['documentNumber'] = this.documentNumber;
    data['documentIssueDate'] = this.documentIssueDate;
    data['class'] = this.classs;
    data['birthDate'] = this.birthDate;
    data['isExperienced'] = this.isExperienced;
    data['isPrivileged'] = this.isPrivileged;
    data['priveledges'] = this.priveledges;
    data['recaptcha'] = this.recaptcha;
    return data;
  }
}
