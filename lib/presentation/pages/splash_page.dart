import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/sign_up_page.dart';

class SplashPage extends StatefulWidget {
  static String routeName = '/splashScren';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //The solash screen method
  void splash() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, SignUpPage.routeName);
    });
  }

  @override
  void initState() {
    super.initState();
    splash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Column(
        children: [
          const Spacer(),
          Image.asset(
            'images/splash_logo.png',
            height: MediaQuery.of(context).size.height * 0.2,
            width: 100,
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              //The font family for the texts has not been given
              "KUMVENT",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      )),
    );
  }
}
