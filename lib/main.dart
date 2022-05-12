import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/constants/route_constants.dart';
<<<<<<< HEAD
import 'package:kumvent/presentation/pages/checkout_page.dart';
import 'package:kumvent/presentation/pages/splash_page.dart';
//import 'package:kumvent/presentation/pages/notification_page.dart';
//import 'package:kumvent/presentation/pages/splash_page.dart';
//import 'package:kumvent/presentation/pages/sign_in_page.dart';
//import 'package:kumvent/presentation/pages/splash_page.dart';
=======
import 'package:kumvent/presentation/pages/splash_page.dart';
>>>>>>> main

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
              elevation: 0.0,
              color: Colors.white,
            ),
            sliderTheme: const SliderThemeData(
              thumbColor: kPrimaryColor,
              trackHeight: 3.0,
            ),
          ),
<<<<<<< HEAD
          initialRoute: CheckoutPage.routeName,
=======
          initialRoute: SplashPage.routeName,
>>>>>>> main
          routes: routes,
        );
      },
    );
  }
}
