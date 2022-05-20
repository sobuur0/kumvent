// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/forgot_password.dart';
import 'package:kumvent/presentation/pages/home.dart';
import 'package:kumvent/presentation/pages/sign_up_page.dart';
import 'package:kumvent/presentation/widgets/action_button.dart';
import 'package:kumvent/presentation/widgets/icon_container.dart';
import 'package:kumvent/presentation/widgets/text_form_list_tile.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
        padding: const EdgeInsets.all(
          16.0,
        ),
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 30.0)),
          Text(
            'Let\'s Sign you in.',
            style: TextStyles.bold(
              color: kTextPrimaryColor,
              fontSize: 24.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 14.0)),
          Text(
            'Welcome back. You\'ve been missed!',
            style: TextStyles.medium(
              color: kNeutralColor,
              fontSize: 16.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 75.0)),
          TextFormListTile(
            text: 'Email Address',
            textController: _emailAddressController,
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20.0)),
          TextFormListTile(
            text: 'Password',
            textController: _passwordController,
            trailing: Icon(
              Icons.visibility,
              color: const Color(0xFF991A2731).withOpacity(0.6),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 8.0)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                // ignore: always_specify_types
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const ForgotPasswordPage()),
              );
            },
            child: Text(
              'Forgot password?',
              textAlign: TextAlign.end,
              style: TextStyles.medium(
                color: const Color(0xFF636262),
                fontSize: 12.0,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 22.0)),
          ActionButton(
            buttonWidth: size.width,
            buttonHeight: 56.0,
            onPressed: () {
              Navigator.of(context).push(
                // ignore: always_specify_types
                MaterialPageRoute(
                  builder: (BuildContext context) => const Home(),
                ),
              );
            },
            title: 'Sign In',
          ),
          const Padding(padding: EdgeInsets.only(bottom: 46.0)),
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
                    text: 'Don\'t have an account? ',
                    style: TextStyles.medium(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                  TextSpan(
                    text: 'SignUp',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.of(context).push(
                            // ignore: always_specify_types
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignUpPage(),
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
    );
  }
}
