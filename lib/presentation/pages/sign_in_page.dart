import 'dart:ffi';

import 'package:flutter/material.dart';

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
          children: [
            const Text(
              'Create a new Account',
            ),
            const Text(
              'Name'
            ),
            TextFormField(),
            const Text(
              'Email Address'
            ),
            TextFormField(),
            const Text(
              'Password'
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
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'I agree to'),
                      TextSpan(text: 'Terms of Service'),
                      TextSpan(text: 'and'),
                      TextSpan(text: 'Privacy Policy'),
                    ],
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
