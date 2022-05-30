import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/homepage.dart';
import 'package:kumvent/presentation/widgets/action_button.dart';
import 'package:kumvent/presentation/widgets/success_widget.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: SuccessWidget()),
            const Padding(padding: EdgeInsets.only(bottom: 26.0)),
            Text(
              'Success!',
              textAlign: TextAlign.center,
              style: TextStyles.bold(
                color: kTextPrimaryColor,
                fontSize: 32.0,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 34.0)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'You\'ve successfully reserved ',
                    style: TextStyles.semiBold(
                      color: kTextPrimaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                  TextSpan(
                    text: '“Jim Ovia\nEvent Centre”. ',
                    style: TextStyles.semiBold(
                      color: kBlueShadeColor,
                      fontSize: 16.0,
                    ),
                  ),
                  TextSpan(
                    text: 'Kindly check your email\nfor further instructions.',
                    style: TextStyles.semiBold(
                      color: kTextPrimaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.only(bottom: size.height * 0.096)),
            ActionButton(
              buttonWidth: double.infinity,
              buttonHeight: 48.0,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              title: 'Payment Completed',
            ),
            Padding(padding: EdgeInsets.only(bottom: size.height * 0.073)),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 22.0, horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFFEDECEC),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Need help?',
                    style: TextStyles.bold(
                      color: kPrimaryColor,
                      fontSize: 14.0,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 8.0)),
                  Text(
                    'Your order ID is: #77062967CG. Please contact us with this ID in case you encounter any problem',
                    style: TextStyles.semiBold(
                      color: kNeutralColor,
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
