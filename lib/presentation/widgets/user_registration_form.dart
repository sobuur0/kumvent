import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class UserRegistratioForm extends StatefulWidget {
  final String text;
  final TextEditingController textController;
  final Widget? trailing;

  const UserRegistratioForm({
    required this.text,
    required this.textController,
    this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  State<UserRegistratioForm> createState() => _UserRegistratioFormState();
}

class _UserRegistratioFormState extends State<UserRegistratioForm> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyles.semiBold(
            color: kNeutralColor,
            fontSize: 16.0,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10.0)),
        TextFormField(
          controller: widget.textController,
          decoration: InputDecoration(
            filled: true,
            fillColor: kBackgroundFillColor,
            suffixIcon: widget.trailing,
            constraints: BoxConstraints.tight(
              Size(
                size.width,
                40.0,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: kTextViewBorderColor,
                width: 1.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
