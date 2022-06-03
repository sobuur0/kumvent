// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/constants/route_constants.dart';
// import 'package:kumvent/presentation/pages/home.dart';
import 'package:kumvent/presentation/pages/splash_page.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
          // home: const Home(),
          initialRoute: SplashPage.routeName,
          routes: routes,
        );
      },
    );
  }
}
