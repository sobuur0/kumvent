// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/sign_in_page.dart';
import 'package:kumvent/presentation/widgets/action_button.dart';
import 'package:kumvent/presentation/widgets/icon_container.dart';
import 'package:kumvent/presentation/widgets/text_form_list_tile.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = '/signUpPage';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _isChecked = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 40.0)),
            Text(
              'Create a New Account',
              style: TextStyles.bold(
                color: kTextPrimaryColor,
                fontSize: 24.0,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30.0)),
            TextFormListTile(
              text: 'Name',
              textController: _nameController,
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            TextFormListTile(
              text: 'Email Address',
              textController: _emailAddressController,
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            TextFormListTile(
              text: 'Password',
              textController: _passwordController,
              trailing: Icon(
                Icons.visibility,
                color: const Color(0xFF991A2731).withOpacity(0.6),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20.0)),
            Row(
              children: <Widget>[
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                    value: _isChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isChecked = newValue!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        // ignore: todo
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
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 30.0)),
            ActionButton(
              onPressed: () {},
              buttonWidth: size.width,
              buttonHeight: 56.0,
              title: 'Create an Account',
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Divider(
                    thickness: 1.0,
                    color: Colors.black.withOpacity(0.7),
                    endIndent: 30.0,
                  ),
                ),
                const Text('Or'),
                Expanded(
                  child: Divider(
                    thickness: 1.0,
                    color: Colors.black.withOpacity(0.7),
                    indent: 30.0,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 25.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconContainer(
                  height: 56.0,
                  width: 56.0,
                  color: kIconContainerColor,
                  onTap: () {},
                  child: const Icon(
                    Icons.apple,
                    size: 35.0,
                  ),
                ),
                IconContainer(
                  height: 56.0,
                  width: 56.0,
                  color: kIconContainerColor,
                  onTap: () {},
                  child: const Icon(
                    Icons.facebook,
                    size: 35.0,
                    color: Color(0xFF039BE5),
                  ),
                ),
                IconContainer(
                  height: 56.0,
                  width: 56.0,
                  color: kIconContainerColor,
                  onTap: () {},
                  child: const Image(
                    image: AssetImage('images/google.png'),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Center(
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Have an account? ',
                      style: TextStyles.medium(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                              // ignore: always_specify_types
                              MaterialPageRoute(
                                builder: (BuildContext context) => const SignInPage(),
                              ),
                            ),
                      style: TextStyles.semiBold(
                        color: kBlueShadeColor,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
