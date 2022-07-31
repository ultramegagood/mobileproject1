import 'package:get/get.dart';
import 'package:mobile_nsk/models/contacts/contacts_model.dart';
import 'package:mobile_nsk/repository/contacts/contacts_repository.dart';

class ContactsMainController extends GetxController {
  var loaderRx = false.obs;
  var offices = Rxn<ContactsModel>();
  // var isShowLabel = Rxn<List<bool>>();

  @override
  void onInit() async {
    loaderRx(true);
    offices(await ContactsRepository().getOfficesList());
    // isShowLabel(
    //     List.generate(offices.value!.contacts!.length, (index) => false));
    loaderRx(false);
    super.onInit();
  }

  
}
