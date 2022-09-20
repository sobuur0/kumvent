import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class ExpiryDateAndCvvTextField extends StatelessWidget {
  final String text;
  final TextEditingController textController;
  final Widget? trailing;
  
  const ExpiryDateAndCvvTextField({
    Key? key,
    required this.text,
    required this.textController,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyles.semiBold(
            color: kNeutralColor,
            fontSize: 16.0,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10.0)),
        TextFormField(
          controller: textController,
          decoration: InputDecoration(
            filled: true,
            fillColor: kBackgroundFillColor,
            suffixIcon: trailing,
            constraints: BoxConstraints.tight(
              Size(
                size.width / 2.5,
                40.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: kTextViewBorderColor,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: kPrimaryColor,
                width: 1.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: kErrorColor,
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
