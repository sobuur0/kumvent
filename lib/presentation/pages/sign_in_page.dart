import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 0.0),
              child: Text(
                'Create a New Account',
                style: TextStyles.bold(
                  color: kTextPrimaryColor,
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 43.0, 16.0, 10.0),
              child: Text(
                'Name',
                style: TextStyles.semiBold(
                  color: kNeutralColor,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBackgroundFillColor,
                  constraints: BoxConstraints.tight(
                    Size(
                      size.width,
                      40.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kTextViewBorderColor,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
              child: Text(
                'Email Address',
                style: TextStyles.semiBold(
                  color: kNeutralColor,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                controller: _emailAddressController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBackgroundFillColor,
                  constraints: BoxConstraints.tight(
                    Size(
                      size.width,
                      40.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kTextViewBorderColor,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
              child: Text(
                'Password',
                style: TextStyles.semiBold(
                  color: kNeutralColor,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBackgroundFillColor,
                  constraints: BoxConstraints.tight(
                    Size(
                      size.width,
                      40.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kTextViewBorderColor,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = true;
                      });
                    },
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        //TODO: tell shina to give the correct fontFamily to these texts
                        TextSpan(
                          text: 'I agree to ',
                          style: TextStyles.regular(
                            color: kNeutralColor,
                            fontSize: 14.0,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Service ',
                          style: TextStyles.medium(
                            color: kBlueShadeColor,
                            fontSize: 14.0,
                          ),
                        ),
                        TextSpan(
                          text: 'and ',
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 15.0,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  fixedSize: Size(
                    size.width,
                    56.0,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Create an Account',
                  style: TextStyles.semiBold(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.black,
                      endIndent: 30.0,
                    ),
                  ),
                  Text('Or'),
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.black,
                      indent: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
