/// This class performs some integration tests for kumvent app
/// Inspired by the gSkinnerTeam
/// *author @ghost
/// *date Aug 1 2022

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kumvent/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Ghost Test',
    (WidgetTester tester) async {
      //Setup
      app.main();
      await tester.pumpAndSettle(); //wait to see if app is ready
      await tester.pump(const Duration(seconds: 2)); //wait for 2 seconds

      print('All States: ');
      for (var element in tester.allStates) {
        print(element);
      }

      //find signIn text fields
      final Finder emailAddress = find.byKey(const ValueKey('emailText'));
      final Finder password = find.byKey(const ValueKey('passwordText'));

      //Test
      //expect to find the text fields initialized above
      expect(emailAddress, findsOneWidget);
      expect(password, findsOneWidget);

      //Do
      await tester.enterText(emailAddress, 'isholasobuur@gmail.com');
      await tester.enterText(password, 'alutap001');
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));

      //tap on the signIn button
      final Finder signInBtn = find.byKey(const ValueKey('signInBtn'));
      await tester.tap(signInBtn, warnIfMissed: true);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 5));
    },
  );
}
