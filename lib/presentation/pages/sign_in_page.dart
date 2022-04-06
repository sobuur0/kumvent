import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailAddressController;
  late TextEditingController _passwordController;
  late bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 40.0),
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
                color: kNeutralColor,
                fontSize: 16.0,
              ),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: kTextViewBorderColor,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(5.0),
              )),
            ),
            Text(
              'Email Address',
              style: TextStyles.semiBold(
                color: kNeutralColor,
                fontSize: 16.0,
              ),
            ),
            TextFormField(
              controller: _emailAddressController,
            ),
            Text(
              'Password',
              style: TextStyles.semiBold(
                color: kNeutralColor,
                fontSize: 16.0,
              ),
            ),
            TextFormField(
              controller: _passwordController,
            ),
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
                            color: kNeutralColor,
                            fontSize: 14.0,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyles.medium(
                            color: kBlueShadeColor,
                            fontSize: 14.0,
                          ),
                        ),
                        TextSpan(
                          text: 'and',
                          style: TextStyles.regular(
                            color: kNeutralColor,
                            fontSize: 14.0,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyles.medium(
                            color: kBlueShadeColor,
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
