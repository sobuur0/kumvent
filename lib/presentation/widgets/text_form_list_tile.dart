import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class TextFormListTile extends StatefulWidget {
  final String text;
  final TextEditingController textController;
  final Widget? trailing;

  const TextFormListTile({
    required this.text,
    required this.textController,
    this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  State<TextFormListTile> createState() => _TextFormListTileState();
}

class _TextFormListTileState extends State<TextFormListTile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
