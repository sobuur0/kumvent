import 'package:flutter/material.dart';

class StarRatings extends StatelessWidget {
  final double? size;
  final Color? color;

  const StarRatings({
    Key? key,
    this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 5; i++) ...[
          Icon(
            Icons.star,
            color: color,
            size: size,
          ),
        ],
      ],
    );
  }
}
