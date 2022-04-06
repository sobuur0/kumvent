import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/sign_in_page.dart';

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
          theme: ThemeData(
            scaffoldBackgroundColor: kScaffoldBackgroundColor,
          ),
          home: const SignInPage(),
        );
      },
    );
  }
}
