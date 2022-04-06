import 'package:flutter/material.dart';
import 'package:kumvent/constants/colours.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;

  const IconContainer({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: kIconContainerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Icon(
        icon,
      ),
    );
  }
}
