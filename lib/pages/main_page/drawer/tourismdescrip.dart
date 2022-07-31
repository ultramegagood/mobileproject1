import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TourismDescripPage extends StatefulWidget {
  const TourismDescripPage({Key? key}) : super(key: key);

  @override
  _TourismDescripPageState createState() => _TourismDescripPageState();
}

class _TourismDescripPageState extends State<TourismDescripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios, color:  Color.fromRGBO(45, 96, 226, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Туризм',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        letterSpacing: 0.16,
                        color: const Color.fromRGBO(10, 10, 10, 1))),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Многократная поездка для Туризм',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        letterSpacing: 0.16,
                        color: const Color.fromRGBO(109, 109, 109, 1))),
              ),
            ),
          ],
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 22),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Данные договора',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          letterSpacing: 0.16,
                          color: const Color.fromRGBO(55, 55, 55, 1))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 238, 238, 1),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(209, 209, 209, 1))),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('ФИО Страхователя',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(103, 103, 103, 1))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Михаил Михайлыч Аркесов',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(55, 55, 55, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 238, 238, 1),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(209, 209, 209, 1))),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('ID договора',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(103, 103, 103, 1))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('12412412412',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(55, 55, 55, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 238, 238, 1),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(209, 209, 209, 1))),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Срок действия',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(103, 103, 103, 1))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('12.12.21',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(55, 55, 55, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 238, 238, 1),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(209, 209, 209, 1))),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Страна пребывания',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(103, 103, 103, 1))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Италия',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(55, 55, 55, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 238, 238, 1),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(209, 209, 209, 1))),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Цель',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(103, 103, 103, 1))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('по работе',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(55, 55, 55, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 238, 238, 1),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(209, 209, 209, 1))),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Застрахованные',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(103, 103, 103, 1))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Мария Черкасова Александровна',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(55, 55, 55, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 238, 238, 1),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(209, 209, 209, 1))),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Сумма страхования',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(103, 103, 103, 1))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('15 000 тг.',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(55, 55, 55, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 238, 238, 1),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(209, 209, 209, 1))),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Премия',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(103, 103, 103, 1))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, top: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('3 000 тг.',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                letterSpacing: 0.16,
                                color: const Color.fromRGBO(55, 55, 55, 1))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
