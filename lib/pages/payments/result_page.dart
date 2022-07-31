import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/pages/widgets/nsk_custom_button.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/shared/theme.dart';

class PaymentResultPage extends StatelessWidget {
  const PaymentResultPage(
      {Key? key, required this.isSuccess, this.errorMessage})
      : super(key: key);
  final bool isSuccess;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      bottomSheet: NskCustomButton(
        'На главную',
        isButtonEnabled: true,
        isEnabledButtonPrimaryColor: false,
        onTap: () => Get.offAllNamed('/main'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 114,
              height: 114,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: isSuccess ? Color(0xff00A02D) : Colors.red,
                borderRadius: BorderRadius.circular(200),
              ),
              child: Icon(
                isSuccess ? Icons.check_outlined : CupertinoIcons.xmark,
                color: AppColors.white,
                size: 50,
              ),
            ),
            NskText(
              'Уважаемый клиент!',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 8,
            ),
            NskText(
              isSuccess ? 'Ваша заявка принята!' : 'Ваша заявка отклонена',
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: isSuccess,
              child: NskText(
                'Спасибо, что выбираете\nнашу компанию :)))',
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Visibility(
              visible: !isSuccess,
              child: NskText(
                errorMessage ?? '',
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
