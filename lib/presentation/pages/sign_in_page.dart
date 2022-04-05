import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 40.0,
              ),
              child: Text(
                'Create a new Account',
                style: TextStyles.bold(
                  color: kTextPrimaryColor,
                  fontSize: 24.0,
                ),
              ),
            ),
            Text(
              'Name',
              style: TextStyles.semiBold(
                color: kHeaderTextColor,
                fontSize: 16.0,
              ),
            ),
            TextFormField(),
            Text(
              'Email Address',
              style: TextStyles.semiBold(
                color: kHeaderTextColor,
                fontSize: 16.0,
              ),
            ),
            TextFormField(),
            Text(
              'Password',
              style: TextStyles.semiBold(
                color: kHeaderTextColor,
                fontSize: 16.0,
              ),
            ),
            TextFormField(),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = true;
                    });
                  },
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        //TODO: tell shina to give the correct fontFamily to these texts
                        TextSpan(
                          text: 'I agree to',
                          style: TextStyles.regular(
                            color: kHeaderTextColor,
                            fontSize: 14.0,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyles.medium(
                            color: kLightActionButton,
                            fontSize: 14.0,
                          ),
                        ),
                        TextSpan(
                          text: 'and',
                          style: TextStyles.regular(
                            color: kHeaderTextColor,
                            fontSize: 14.0,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyles.medium(
                            color: kLightActionButton,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
