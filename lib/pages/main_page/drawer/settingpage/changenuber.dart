import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeNumberPage extends StatefulWidget {
  const ChangeNumberPage({Key? key}) : super(key: key);

  @override
  _ChangeNumberPageState createState() => _ChangeNumberPageState();
}

class _ChangeNumberPageState extends State<ChangeNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                color:  Color.fromRGBO(45, 96, 226, 1)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            margin: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Изменить номер телефона',
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
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(top: 130, bottom: 24, left: 20, right: 20),
          width: 300,
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color.fromRGBO(45, 96, 226, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // <-- Radius
              ),
            ),
            child: Text('Продолжить',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    letterSpacing: 0.16,
                    color: const Color.fromRGBO(255, 255, 255, 1))),
            onPressed: () {},
          ),
        ),
        body: Container(

            margin: const EdgeInsets.only(top: 24, left: 15, right: 15),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Новый номер телефона',
                  labelStyle: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: const Color.fromRGBO(83, 83, 83, 1)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(205, 218, 249, 1), width: 2))),
            )));
  }
}
