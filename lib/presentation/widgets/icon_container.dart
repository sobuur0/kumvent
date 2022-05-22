import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final Color color;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;

  const IconContainer({
    required this.child,
    this.onTap,
    required this.height,
    required this.width,
    required this.color,
    required this.borderRadius,
    this.boxShadow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
