import 'package:flutter/material.dart';
import 'package:mobile_nsk/models/tourism/get_full_client_response.dart';

class Insurer {
  int id;
  int isResident;
  TextEditingController? iin;
  TextEditingController? surname;
  TextEditingController? name;
  TextEditingController? dadsName;
  TextEditingController? surnameEng;
  TextEditingController? nameEng;
  TextEditingController? birthDate;
  int? sexId;
  TextEditingController? phone;
  TextEditingController? address;
  TextEditingController? docnum;
  TextEditingController? whenGiven;
  String? whoGave;
  int? isIndividual;
  int? countryId;
  int? economicsSectorId;
  int? activityKindId;
  int? documentTypeId;
  int? classs;
  bool? isExperienced;
  bool? isPrivileged;
  int? priveledges;
  bool? recaptcha;
  bool? isBeneficiary;
  Insurer({
    this.id = 0,
    this.isResident = 1,
    this.iin,
    this.surname,
    this.name,
    this.dadsName,
    this.nameEng,
    this.surnameEng,
    this.birthDate,
    this.sexId,
    this.phone,
    this.address,
    this.docnum,
    this.whenGiven,
    this.whoGave,
    this.countryId,
    this.documentTypeId,
    this.isIndividual,
    this.activityKindId,
    this.classs,
    this.economicsSectorId,
    this.isExperienced,
    this.isPrivileged,
    this.priveledges,
    this.recaptcha,
    this.isBeneficiary,
  });
  static Insurer empty() => Insurer(
        iin: TextEditingController(),
        surname: TextEditingController(),
        name: TextEditingController(),
        dadsName: TextEditingController(),
        nameEng: TextEditingController(),
        surnameEng: TextEditingController(),
        birthDate: TextEditingController(),
        sexId: null,
        phone: TextEditingController(),
        address: TextEditingController(),
        docnum: TextEditingController(),
        whenGiven: TextEditingController(),
        whoGave: 'МинЮст РК',
      );

  static Insurer to(GetFullClientResponse success) {
    return Insurer(
      iin: TextEditingController(text: success.iin),
      phone: TextEditingController(text: '+7(708)897-43-31'),
      address: TextEditingController(text: 'Q'),
      docnum: TextEditingController(text: 'N12514942'),
      whenGiven: TextEditingController(text: '03.09.2019'),
      whoGave: 'МинЮст РК',
      surname: TextEditingController(text: success.lastName),
      name: TextEditingController(text: success.firstName),
      dadsName: TextEditingController(text: success.middleName),
      surnameEng:
          TextEditingController(text: success.lastNameEng ?? 'AKHMETOVA'),
      nameEng: TextEditingController(text: success.firstNameEng ?? 'AYAGUL'),
      birthDate: TextEditingController(text: success.birthDate),
      isIndividual: success.isIndividual,
      sexId: success.sexId!,
      countryId: success.countryId,
      economicsSectorId: success.economicsSectorId,
      activityKindId: success.activityKindId,
      documentTypeId: 2,
      classs: success.classs,
      isExperienced: success.isExperienced,
      isPrivileged: success.isPrivileged,
      priveledges: success.priveledges,
      recaptcha: success.recaptcha,
    );
  }
}