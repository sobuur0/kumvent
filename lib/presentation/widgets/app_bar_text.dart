import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

appBarText({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyles.bold(
        color: kNeutralColor,
        fontSize: 24,
      ),
    ),
    centerTitle: true,
    leading: const Icon(
      Icons.arrow_back,
      color: kLeadingIconColor,
    ),
  );
}
