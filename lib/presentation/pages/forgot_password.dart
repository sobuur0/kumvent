import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/check_your_email_page.dart';
import 'package:kumvent/presentation/widgets/action_button.dart';
import 'package:kumvent/presentation/widgets/text_form_list_tile.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailAddressController = TextEditingController();

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
          const Padding(padding: EdgeInsets.only(top: 60.0)),
          Text(
            'Forgot Password?',
            style: TextStyles.bold(
              color: kTextPrimaryColor,
              fontSize: 24.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 11.0)),
          Text(
            'Don\'t worry it happens. Please enter the address \nassociated with your account.',
            textScaleFactor: 0.8,
            style: TextStyles.medium(
              color: kNeutralColor,
              fontSize: 16.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 75.0)),
          TextFormListTile(
            textController: _emailAddressController,
            text: 'Email Address',
          ),
          const Padding(padding: EdgeInsets.only(bottom: 48.0)),
          ActionButton(
            buttonWidth: size.width,
            buttonHeight: 56.0,
            onPressed: () {
              Navigator.of(context).push(
                // ignore: always_specify_types
                MaterialPageRoute(
                  builder: (BuildContext context) => const CheckEmailPage(),
                ),
              );
            },
            title: 'Submit',
          ),
        ],
      ),
    );
  }
}
