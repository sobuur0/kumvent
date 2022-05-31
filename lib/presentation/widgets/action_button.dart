import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class ActionButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final VoidCallback onPressed;
  final String title;

  const ActionButton({
    required this.buttonWidth,
    required this.buttonHeight,
    required this.onPressed,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        fixedSize: Size(
          buttonWidth,
          buttonHeight,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyles.semiBold(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
