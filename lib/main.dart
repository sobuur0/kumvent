import 'package:flutter/material.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
      ),
      home: const SignInPage(),
    );
  }
}
