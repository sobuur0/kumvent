// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/widgets/action_button.dart';

class CheckEmailPage extends StatefulWidget {
  const CheckEmailPage({Key? key}) : super(key: key);

  @override
  State<CheckEmailPage> createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: kLeadingIconColor,
              ),
            );
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 46.0)),
          Text(
            'Yay! Check your email',
            style: TextStyles.bold(
              color: kTextPrimaryColor,
              fontSize: 24.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 15.0)),
          Text(
            'We\'ve sent a password reset link to your email. Kindly check to continue.',
            style: TextStyles.medium(
              color: kTextPrimaryColor,
              fontSize: 16.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 32.0)),
          Image.asset(
            'images/check_email.png',
            height: 200.0,
          ),
          const Padding(padding: EdgeInsets.only(bottom: 60.0)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ActionButton(
              buttonWidth: size.width,
              buttonHeight: 56.0,
              onPressed: () {},
              title: 'Check inbox now',
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 17.0)),
          Text(
            'Skip, I\'ll confirm later',
            textAlign: TextAlign.center,
            style: TextStyles.medium(
              color: const Color(0xFFCC1A2731),
              fontSize: 16.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 80.0)),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text:
                      'Did not receive the email? Check your spam filter\nor ',
                  style: TextStyles.bold(
                    color: kTextPrimaryColor,
                    fontSize: 16.0,
                  ),
                ),
                TextSpan(
                  text: 'try another email address',
                  style: TextStyles.bold(
                    color: kBlueShadeColor,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            textScaleFactor: 0.8,
          ),
        ],
      ),
    );
  }
}
