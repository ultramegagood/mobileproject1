import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_nsk/database/database.dart';
import 'package:mobile_nsk/routes.dart';
import 'package:mobile_nsk/shared/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Provider<MyDatabase>(
      create: (context) => MyDatabase(),
      child: const MyApp(),
      dispose: (context, db) => db.close(),
    ),
  );
}

final box = GetStorage();

final database = MyDatabase();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: AppRoutes.init(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                backgroundColor: AppColors.defaultBackground,
                primarySwatch: Colors.blue,
                textTheme: GoogleFonts.montserratTextTheme(
                    Theme.of(context).textTheme),
              ),
              initialRoute: snapshot.data!,
              getPages: AppRoutes.routes,
            );
          } else {
            return Container(
              width: 10000,
              height: 10000,
              color: AppColors.defaultBackground,
              child: Center(
                child: SvgPicture.asset(AppSvgImages.logo),
              ),
            );
          }
        });
  }
}
