import 'package:flutter/material.dart';
import 'package:kumvent/presentation/pages/checkout_page.dart';
import 'package:kumvent/presentation/pages/favorites_page.dart';
import 'package:kumvent/presentation/pages/notification_page.dart';
import 'package:kumvent/presentation/pages/onboarding_page.dart';
import 'package:kumvent/presentation/pages/profille_page.dart';
import 'package:kumvent/presentation/pages/sign_up_page.dart';
import 'package:kumvent/presentation/pages/splash_page.dart';

Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => const SplashPage(),
  SignUpPage.routeName: (context) => const SignUpPage(),
  OnboardingPage.routeName: (context) => const OnboardingPage(),
  ProfilePage.routeName: (context) => const ProfilePage(),
  NotificationsPage.routeName: (context) => const NotificationsPage(),
  FavoritesPage.routeName: (context) => const FavoritesPage(),
  CheckoutPage.routeName: (context) => const CheckoutPage(),
};
