import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFEDECEC),
          hintText: 'Search Centres',
          hintStyle: TextStyles.regular(
            color: const Color(0xFFA6A4A4),
            fontSize: 14.0,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFFA6A4A4),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Color(0xFFEDECEC),
              width: 0.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: kPrimaryColor,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
