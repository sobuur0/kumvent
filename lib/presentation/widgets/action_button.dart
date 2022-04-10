import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class ActionButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;

  const ActionButton({
    required this.buttonWidth,
    required this.buttonHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        fixedSize: Size(
          buttonWidth,
          buttonHeight,
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
    );
  }
}
