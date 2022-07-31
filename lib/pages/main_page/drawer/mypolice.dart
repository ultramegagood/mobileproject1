import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyPolicePage extends StatefulWidget {
  const MyPolicePage({Key? key}) : super(key: key);

  @override
  _MyPolicePageState createState() => _MyPolicePageState();
}

class _MyPolicePageState extends State<MyPolicePage> {
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("Item 1"),
    1: Text("Item 2")
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color.fromRGBO(45, 96, 226, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          margin: const EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Мои полисы',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    letterSpacing: 0.16,
                    color: const Color.fromRGBO(10, 10, 10, 1))),
          ),
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Полисы',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          letterSpacing: 0.16,
                          color: const Color.fromRGBO(10, 10, 10, 1))),
                  Text('Страховые случаи',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          letterSpacing: 0.16,
                          color: const Color.fromRGBO(10, 10, 10, 1))),
                  Text('Архив',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          letterSpacing: 0.16,
                          color: const Color.fromRGBO(10, 10, 10, 1))),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 170,
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(205, 218, 250, 1)),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white70),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 16),
                            child: Text('ОС ГПО ВТС',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    letterSpacing: 0.16,
                                    color:
                                        const Color.fromRGBO(55, 55, 55, 1))),
                          ),
                          Container(
                            width: 80,
                            height: 35,
                            margin: const EdgeInsets.only(top: 10, right: 16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(45, 96, 226, 1)),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('PDF',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18,
                                        letterSpacing: 0.16,
                                        color: const Color.fromRGBO(
                                            45, 96, 226, 1))),
                                const Icon(Icons.download_rounded,
                                    color: Color.fromRGBO(45, 96, 226, 1)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('197863029',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(83, 83, 83, 1))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16, top: 7),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Стандартный договор',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(83, 83, 83, 1))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16, top: 7),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('16 мая 2019 - 15 мая 2020',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(83, 83, 83, 1))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 7, top: 8),
                        child: LinearPercentIndicator(
                          width: 220.0,
                          lineHeight: 3.0,
                          percent: 0.2,
                          progressColor: Colors.red,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16, top: 7),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Остался месяц',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  letterSpacing: 0.16,
                                  color:
                                      const Color.fromRGBO(149, 149, 149, 1))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 170,
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(205, 218, 250, 1)),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white70),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 10, left: 16, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Туризм',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(55, 55, 55, 1))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('197863029',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(83, 83, 83, 1))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16, top: 7),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Многократная поездка для Туризм',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(83, 83, 83, 1))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16, top: 7),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('16 мая 2019 - 15 мая 2020',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(83, 83, 83, 1))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 7, top: 8),
                        child: LinearPercentIndicator(
                          width: 220.0,
                          lineHeight: 3.0,
                          percent: 0.2,
                          progressColor: Colors.green,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16, top: 7),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Осталось 5 месяцев 14 дней',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  letterSpacing: 0.16,
                                  color:
                                      const Color.fromRGBO(149, 149, 149, 1))),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
