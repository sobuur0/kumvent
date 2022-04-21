import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(top: 120.0)),
          const SuccessWidget(),
          const Padding(padding: EdgeInsets.only(bottom: 26.0)),
          Text(
            'Success!',
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 96.0),
            child: ActionButton(
              buttonWidth: 320,
              buttonHeight: 48.0,
              onPressed: () {},
              title: 'Done',
            ),
          ),
        ],
      ),
    );
  }
}
