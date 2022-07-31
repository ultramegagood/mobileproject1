import 'package:get/get.dart';
import 'package:mobile_nsk/repository/payments/payment_repository.dart';
import 'package:mobile_nsk/models/policy/agreement_info.dart';
class PaymentController extends GetxController with StateMixin{
  var loaderRx = RxBool(false);
  Future makePayments(
      String cardNumber, String cardDate, String cardCVC,
      String cardholder, AgreementInfo agreementInfo, )async{
  await  loaderRx(true);
   await PaymentRepository().makePayment(
      cardNumber,
      cardDate,
      cardCVC,
      cardholder,
      agreementInfo,
    );
   await loaderRx(false);
  }
}