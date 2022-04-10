import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/widgets/action_button.dart';
import 'package:kumvent/presentation/widgets/icon_container.dart';

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
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Padding(padding: EdgeInsets.only(top: 40.0)),
            Text(
              'Create a New Account',
              style: TextStyles.bold(
                color: kTextPrimaryColor,
                fontSize: 24.0,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30.0)),
            Text(
              'Name',
              style: TextStyles.semiBold(
                color: kNeutralColor,
                fontSize: 16.0,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 3.0)),
            TextFormField(
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
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Email Address',
              style: TextStyles.semiBold(
                color: kNeutralColor,
                fontSize: 16.0,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 3.0)),
            TextFormField(
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
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Password',
              style: TextStyles.semiBold(
                color: kNeutralColor,
                fontSize: 16.0,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 3.0)),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: kBackgroundFillColor,
                suffixIcon: Icon(
                  Icons.visibility,
                  color: const Color(0xFF991A2731).withOpacity(0.6),
                ),
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
            const Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Row(
              children: [
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
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 30.0)),
            ActionButton(
              buttonWidth: size.width,
              buttonHeight: 56.0,
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 1.0,
                    color: Colors.black,
                    endIndent: 30.0,
                  ),
                ),
                const Text('Or'),
                Expanded(
                  child: Divider(
                    thickness: 1.0,
                    color: const Color(0xFF000000B2).withOpacity(0.7),
                    indent: 30.0,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 25.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                IconContainer(
                  child: Icon(
                    Icons.apple,
                    size: 35.0,
                  ),
                ),
                IconContainer(
                  child: Icon(
                    Icons.facebook,
                    size: 35.0,
                    color: Color(0xFF039BE5),
                  ),
                ),
                IconContainer(
                  child: Image(
                    image: AssetImage('images/google.png'),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Have an account? ',
                      style: TextStyles.medium(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: 'Login',
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
