import 'package:flutter/material.dart';
import 'package:kumvent/constants/colours.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final IconData leadingIcon;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55.0,
        margin: const EdgeInsets.only(bottom: 24.0),
        decoration: BoxDecoration(
          color: kProfileCardColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
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
              fontSize: 16.0,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: Color(0xFF0D34BF),
          ),
        ),
      ),
    );
  }
}
