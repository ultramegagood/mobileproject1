import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon:const Icon(Icons.arrow_back_ios,
                color: Color.fromRGBO(45, 96, 226, 1)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            margin: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Изменить пароль',
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
            child: Text('Сохранить',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    letterSpacing: 0.16,
                    color: const Color.fromRGBO(255, 255, 255, 1))),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 16, left: 15, right: 15),
                    child: TextField(
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromRGBO(83, 83, 83, 1),
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          labelText: 'Текущий пароль',
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
                                  color: Color.fromRGBO(205, 218, 249, 1),
                                  width: 2))),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 16, left: 15, right: 15),
                    child: TextField(
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromRGBO(83, 83, 83, 1),
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          labelText: 'Введите новый пароль',
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
                                  color:  Color.fromRGBO(205, 218, 249, 1),
                                  width: 2))),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 16, left: 15, right: 15),
                    child: TextField(
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromRGBO(83, 83, 83, 1),
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          labelText: 'Повторить новый пароль',
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
                                  color:  Color.fromRGBO(205, 218, 249, 1),
                                  width: 2))),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: Text(
                    'Забыли пароль ?',
                    style: GoogleFonts.montserrat(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        letterSpacing: 0.17,
                        color: const Color.fromRGBO(58, 58, 58, 1)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
