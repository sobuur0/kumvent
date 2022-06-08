import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class AuthenticationButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onPressed;

  const AuthenticationButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        fixedSize: Size(
          size.width,
          56.0,
        ),
      ),
      onPressed: onPressed,
      label: Text(
        label,
        style: TextStyles.semiBold(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      icon: icon,
    );
  }
}
