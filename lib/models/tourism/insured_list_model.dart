import 'package:mobile_nsk/models/tourism/insurer_model.dart';

class InsuredListModel {
  int? id;
  int? isResident;
  String? iin;
  String? firstName;
  String? lastName;
  String? middleName;
  String? birthDate;
  String? phone;
  int? sportCategoryId;
  int? sportId;
  String? address;
  bool? isBeneficiary;
  int? sexId;
  String? firstNameEng;
  String? lastNameEng;
  String? documentNumber;
  String? documentGivenBy;
  String? documentIssueDate;
  int? documentTypeId;
  String? documentPassport;
  bool? isic;
  String? isicPhoto;
  String? error;
  int? isIndividual;
  int? countryId;
  String? legalName;
  int? economicsSectorId;
  int? activityKindId;
  int? classs;
  bool? isExperienced;
  bool? isPrivileged;
  int? priveledges;
  bool? recaptcha;

  InsuredListModel({
    this.id,
    this.isResident,
    this.iin,
    this.firstName,
    this.lastName,
    this.middleName,
    this.birthDate,
    this.phone,
    this.sportCategoryId,
    this.sportId,
    this.address,
    this.isBeneficiary,
    this.sexId,
    this.firstNameEng,
    this.lastNameEng,
    this.documentNumber,
    this.documentGivenBy,
    this.documentIssueDate,
    this.documentTypeId,
    this.documentPassport,
    this.isic,
    this.isicPhoto,
    this.error,
    this.isIndividual,
    this.countryId,
    this.legalName,
    this.economicsSectorId,
    this.activityKindId,
    this.classs,
    this.isExperienced,
    this.isPrivileged,
    this.priveledges,
    this.recaptcha,
  });

  InsuredListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isResident = json['isResident'];
    iin = json['iin'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    birthDate = json['birthDate'];
    phone = json['phone'];
    sportCategoryId = json['sportCategoryId'];
    sportId = json['sportId'];
    address = json['address'];
    isBeneficiary = json['isBeneficiary'];
    sexId = json['sexId'];
    firstNameEng = json['firstNameEng'];
    lastNameEng = json['lastNameEng'];
    documentNumber = json['documentNumber'];
    documentGivenBy = json['documentGivenBy'];
    documentIssueDate = json['documentIssueDate'];
    documentTypeId = json['documentTypeId'];
    documentPassport = json['documentPassport'];
    isic = json['isic'];
    isicPhoto = json['isicPhoto'];
    error = json['error'];
    isIndividual = json['isIndividual'];
    countryId = json['countryId'];
    legalName = json['legalName'];
    economicsSectorId = json['economicsSectorId'];
    activityKindId = json['activityKindId'];
    classs = json['class'];
    isExperienced = json['isExperienced'];
    isPrivileged = json['isPrivileged'];
    priveledges = json['priveledges'];
    recaptcha = json['recaptcha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isResident'] = this.isResident;
    data['iin'] = this.iin;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['middleName'] = this.middleName;
    data['birthDate'] = this.birthDate;
    data['phone'] = this.phone;
    data['sportCategoryId'] = this.sportCategoryId;
    data['sportId'] = this.sportId;
    data['address'] = this.address;
    data['isBeneficiary'] = this.isBeneficiary;
    data['sexId'] = this.sexId;
    data['firstNameEng'] = this.firstNameEng;
    data['lastNameEng'] = this.lastNameEng;
    data['documentNumber'] = this.documentNumber;
    data['documentGivenBy'] = this.documentGivenBy;
    data['documentIssueDate'] = this.documentIssueDate;
    data['documentTypeId'] = this.documentTypeId;
    data['documentPassport'] = this.documentPassport;
    data['isic'] = this.isic;
    data['isicPhoto'] = this.isicPhoto;
    data['error'] = this.error;
    data['isIndividual'] = this.isIndividual;
    data['countryId'] = this.countryId;
    data['legalName'] = this.legalName;
    data['economicsSectorId'] = this.economicsSectorId;
    data['activityKindId'] = this.activityKindId;
    data['class'] = this.classs;
    data['isExperienced'] = this.isExperienced;
    data['isPrivileged'] = this.isPrivileged;
    data['priveledges'] = this.priveledges;
    data['recaptcha'] = this.recaptcha;
    data['sportyCategoryId'] = 0;
    return data;
  }

  static List<InsuredListModel> toList(List<Insurer> insurers) {
    final List<InsuredListModel> list = [];
    for (var i = 0; i < insurers.length; i++) {
      list.add(
        InsuredListModel(
          id: insurers[i].id,
          isResident: insurers[i].isResident,
          iin: insurers[i].iin!.text,
          firstName: insurers[i].name!.text,
          lastName: insurers[i].surname!.text,
          middleName: insurers[i].dadsName?.text,
          birthDate: insurers[i].birthDate!.text,
          phone: insurers[i].phone!.text,
          sportCategoryId: 0,
          sportId: 0,
          address: insurers[i].address!.text,
          isBeneficiary: insurers[i].isBeneficiary,
          sexId: insurers[i].sexId,
          firstNameEng: insurers[i].nameEng!.text,
          lastNameEng: insurers[i].surnameEng!.text,
          documentNumber: insurers[i].docnum!.text,
          documentGivenBy: insurers[i].whoGave,
          documentIssueDate: insurers[i].whenGiven!.text,
          documentTypeId: insurers[i].documentTypeId,
          documentPassport: null,
          isic: true,
          isicPhoto: null,
          error: '',
          isIndividual: insurers[i].isIndividual,
          countryId: insurers[i].countryId,
          legalName: '',
          economicsSectorId: insurers[i].economicsSectorId,
          activityKindId: insurers[i].activityKindId,
          classs: insurers[i].classs,
          isExperienced: insurers[i].isExperienced,
          isPrivileged: insurers[i].isPrivileged,
          priveledges: insurers[i].priveledges,
          recaptcha: insurers[i].recaptcha,
        ),
      );
    }
    return list;
  }
}
