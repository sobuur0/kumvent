import 'package:flutter/material.dart';
import 'package:kumvent/presentation/pages/onboarding_page.dart';
import 'package:kumvent/presentation/pages/profille_page.dart';
import 'package:kumvent/presentation/pages/sign_up_page.dart';
import 'package:kumvent/presentation/pages/splash_page.dart';

Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => const SplashPage(),
  SignUpPage.routeName: (context) => const SignUpPage(),
  OnboardingPage.routeName: (context) => const OnboardingPage(),
  ProfilePage.routeName: (context) => const ProfilePage(),
};
