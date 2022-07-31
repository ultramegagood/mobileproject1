import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

bool value = false;

class _SettingPageState extends State<SettingPage> {
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
        title: Container(
          margin: const EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Настройки',
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
        reverse: false,
        // physics: NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    const CircleAvatar(
                      backgroundImage:  AssetImage("assets/images/icon.jpg"),
                    ),
                    Positioned(
                        bottom: 0,
                        right: -25,
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: const Color(0xFFF5F6F9),
                          child: const Icon(
                            Icons.linked_camera_outlined,
                            color: Colors.blue,
                          ),
                          padding: const EdgeInsets.all(5.0),
                          shape: const CircleBorder(),
                        )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Мария Атрисова',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          letterSpacing: 0.16,
                          color: const Color.fromRGBO(10, 10, 10, 1))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('maria.atrisova@gmail.com',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          letterSpacing: 0.16,
                          color: const Color.fromRGBO(95, 95, 95, 1))),
                ),
              ),
              const Divider(
                thickness: 1.5,
                indent: 19,
                endIndent: 19,
                color: Color.fromRGBO(187, 187, 187, 1),
              ),
              Container(
                  margin: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Push уведомления',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(83, 83, 83, 1))),
                        ),
                      ),
                      CupertinoSwitch(
                          value: false,
                          activeColor: const Color.fromRGBO(45, 96, 226, 1),
                          trackColor: Colors.red,
                          onChanged: (value) {})
                    ],
                  )),
              const Divider(
                thickness: 1.5,
                indent: 19,
                endIndent: 19,
                color: Color.fromRGBO(187, 187, 187, 1),
              ),
              Container(
                  margin: const EdgeInsets.only(
                    left: 18,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Изменить пароль',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(83, 83, 83, 1))),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                           
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color:  Color.fromRGBO(104, 104, 104, 1),
                          ))
                    ],
                  )),
              const Divider(
                thickness: 1.5,
                indent: 19,
                endIndent: 19,
                color: Color.fromRGBO(187, 187, 187, 1),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 18, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Изменить код быстрого доступа',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(83, 83, 83, 1))),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color:  Color.fromRGBO(104, 104, 104, 1),
                          ))
                    ],
                  )),
              const Divider(
                thickness: 1.5,
                indent: 19,
                endIndent: 19,
                color: Color.fromRGBO(187, 187, 187, 1),
              ),
              Container(
                  margin: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Вход c Face/Touch ID',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(83, 83, 83, 1))),
                        ),
                      ),
                      CupertinoSwitch(
                          value: true,
                          activeColor: const Color.fromRGBO(45, 96, 226, 1),
                          trackColor: Colors.red,
                          onChanged: (value) {})
                    ],
                  )),
              const Divider(
                thickness: 1.5,
                indent: 19,
                endIndent: 19,
                color:  Color.fromRGBO(187, 187, 187, 1),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 18, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Изменить номер телефона',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.16,
                                  color: const Color.fromRGBO(83, 83, 83, 1))),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color:  Color.fromRGBO(104, 104, 104, 1),
                          ))
                    ],
                  )),
              const Divider(
                thickness: 1.5,
                indent: 19,
                endIndent: 19,
                color: Color.fromRGBO(187, 187, 187, 1),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15, left: 18),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Выход',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          letterSpacing: 0.16,
                          color: const Color.fromRGBO(255, 81, 81, 1))),
                ),
              ),
              const Divider(
                thickness: 1.5,
                indent: 19,
                endIndent: 19,
                color:  Color.fromRGBO(187, 187, 187, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
