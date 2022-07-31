import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StockPage extends StatefulWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(45, 96, 226, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          margin: const EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Акции и новости',
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
          child: Container(
            margin: const EdgeInsets.only(left: 10, top: 15),
            width: MediaQuery.of(context).size.width * 2.5,
            height: MediaQuery.of(context).size.height * 2.5,
            child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    width: 300,
                    height: 190,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/icon.jpg',
                            width: 370,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: 300,
                            padding: const EdgeInsets.all(10),
                            child: Text('People Like Meghan\nMcCain Are Why',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 17,
                                    letterSpacing: 0.16,
                                    color: const Color.fromRGBO(55, 55, 55, 1))),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
