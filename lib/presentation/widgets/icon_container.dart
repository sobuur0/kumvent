import 'package:flutter/material.dart';
import 'package:kumvent/constants/colours.dart';

class IconContainer extends StatelessWidget {
  final Widget child;

  const IconContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: 56.0,
      decoration: ShapeDecoration(
        color: kIconContainerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: child,
    );
  }
}
