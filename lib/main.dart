import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kumvent/constants/route_constants.dart';
import 'package:kumvent/presentation/pages/onboarding_page.dart';
import 'package:kumvent/presentation/pages/profille_page.dart';
//import 'package:kumvent/presentation/pages/onboarding_page.dart';
//import 'package:kumvent/presentation/pages/profille_page.dart';
//import 'package:kumvent/presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              color: Colors.white,
            ),
          ),
          initialRoute: ProfilePage.routeName,
          routes: routes,
        );
      },
    );
  }
}
