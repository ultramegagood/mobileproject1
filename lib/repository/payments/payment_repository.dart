import 'package:mobile_nsk/models/policy/agreement_info.dart';
import 'package:mobile_nsk/repository/payments/payment_provider.dart';

class PaymentRepository {
  final PaymentProvider _paymentProvider = PaymentProvider();
  Future makePayment(
   String cardNumber, String cardDate, String cardCVC,
      String cardholder, AgreementInfo agreementInfo, 
  ) async {
    return _paymentProvider.makePayment(cardNumber, cardDate, cardCVC,cardholder,agreementInfo,);
  }
}
