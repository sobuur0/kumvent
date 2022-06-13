import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/constants/pref_key.dart';
import 'package:kumvent/presentation/pages/onboarding_page.dart';
import 'package:kumvent/presentation/pages/sign_in_page.dart';
import 'package:kumvent/services/shared_prefs.dart';
//import 'package:kumvent/presentation/pages/sign_up_page.dart';

class SplashPage extends StatefulWidget {
  static String routeName = '/splashScren';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _prefs = SharedPrefs();

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/splash_logo.png',
              height: MediaQuery.of(context).size.height * 0.2,
              width: 100,
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20.0)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "KUMVENT",
                style: TextStyles.bold(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //The splash screen method
  void splash() {
    Timer(const Duration(milliseconds: 800), () {
      _readUserPrefs();
    });
  }

  // void _navigate(String isUserOnboarded) {
  //   _readUserPrefs() 
  // }

  Future<void> _readUserPrefs() async {
    final userOnboardedPref = await _prefs.getBool(PrefKey.kOnboardingKey);
    bool isUserOnboarded = userOnboardedPref ?? false;

    isUserOnboarded
        ? Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SignInPage()))
        : Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardingPage()));
  }
}
