import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/first.png',
        ),
        Positioned(
          right: 0.0,
          bottom: 8.0,
          child: Image.asset('images/second.png'),
        ),
        Positioned(
          right: 8.0,
          bottom: 16.0,
          child: Image.asset(
            'images/third.png',
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: 24.0,
          child: Image.asset(
            'images/fourth.png',
          ),
        ),
        const Positioned(
          right: 40.0,
          bottom: 48.0,
          child: Icon(
            Icons.check,
            size: 35.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
