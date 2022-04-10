import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class ActionButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final VoidCallback onPressed;

  const ActionButton({
    required this.buttonWidth,
    required this.buttonHeight,
    required this.onPressed,
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
      onPressed: onPressed,
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
