import 'package:flutter/material.dart';
import 'package:kumvent/constants/colours.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {Key? key,
      required this.leadingIcon,
      required this.trailingIcon,
      required this.title,
      required this.onPressed})
      : super(key: key);

  final IconData leadingIcon, trailingIcon;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffE7E7F9),
      elevation: 0.0,
      child: ListTile(
        leading: Icon(
          leadingIcon,
          color: kPrimaryColor,
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: Color(0xff1A2731),
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
        ),
        trailing: Icon(
          trailingIcon,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
