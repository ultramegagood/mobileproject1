import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_nsk/pages/widgets/nsk_drawer.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';
import 'package:mobile_nsk/pages/widgets/nsk_title.dart';
import 'package:mobile_nsk/shared/size_config.dart';
import 'package:mobile_nsk/shared/theme.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      appBar: AppBar(
        backgroundColor: AppColors.defaultBackground,
        centerTitle: true,
        title: SvgPicture.asset(
          AppSvgImages.logo,
          height: 35,
        ),
        iconTheme: const IconThemeData(color: Color.fromRGBO(45, 96, 226, 1)),
        elevation: 0,
      ),
      drawer: NskDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NskTitle(title: "Акции и новости"),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width * 2.5,
              height: 200,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300,
                      height: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.asset(
                                'assets/images/med.png',
                                width: 300,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 300,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Медицинское страхование',
                                maxLines: 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 17,
                                  letterSpacing: 0.16,
                                  color: Color.fromRGBO(55, 55, 55, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            NskTitle(
              title: 'Оформить полис',
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            GridView.count(
              padding:
                  EdgeInsets.only(bottom: 20, left: 15, right: 15, top: 10),
              childAspectRatio: 1.2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 16,
              children: List.generate(
                4,
                (index) => GestureDetector(
                  onTap: () =>
                      Get.toNamed(routes[index]),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xffCDDAF9)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          policyIcons[index],
                          width: index == 3 ? 85 : 70,
                        ),
                        SizedBox(
                          height:
                              getProportionateScreenHeight(index == 2 ? 0 : 10),
                        ),
                        NskText(
                          policyTexts[index],
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color.fromRGBO(45, 96, 226, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                splashColor: AppColors.primary.withOpacity(0.3),
                highlightColor: AppColors.primary.withOpacity(0.1),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      NskText(
                        'Все продукты',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(width: 16),
                      Icon(
                        CupertinoIcons.forward,
                        color: AppColors.black,
                        size: 17,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
                bottom: 30,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              separatorBuilder: (context, _) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) => InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => log(index.toString()),
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        products[index],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 4,
                        child: NskText(
                          productTitles[index],
                          textAlign: TextAlign.left,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 50,
                        width: 4,
                        decoration: const BoxDecoration(
                          color: Color(0xff2E3A57),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static final List<String> policyIcons = [
    AppSvgImages.car,
    AppSvgImages.plane,
    AppSvgImages.carTime,
    AppSvgImages.carSettings,
  ];

  static final List<String> policyTexts = [
    'ОГПО ВТС',
    'Туризм',
    'Временный въезд\n(ОГПО ВТС)',
    'KASKO Express',
  ];

  static final List<String> routes = [
    "/policy",
    '/tourism/step1',
    '/main',
    '/kasko_express',
  ];
  static final List<String> products = [
    AppSvgImages.healthInsurance,
    AppSvgImages.accident,
    AppSvgImages.property,
    AppSvgImages.automed,
  ];

  static final List<String> productTitles = [
    'Доступное медицинское страхование',
    'Несчастный случай',
    'Имущество',
    'Автомед',
  ];
}
