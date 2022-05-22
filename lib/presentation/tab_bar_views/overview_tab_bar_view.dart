import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class OverviewTabBarView extends StatefulWidget {
  const OverviewTabBarView({Key? key}) : super(key: key);

  @override
  State<OverviewTabBarView> createState() => _OverviewTabBarViewState();
}

class _OverviewTabBarViewState extends State<OverviewTabBarView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 0.0),
      children: [
        Text(
          'Our conference room serves as an ideal setting for a\nconference, seminar,'
          'a company meeting, a product launch\nand cocktail. Also, serves as an ideal setting '
          'for a\nconference, seminar, a company meeting, a product launch\nand cocktail.',
          textScaleFactor: 0.9,
          style: TextStyles.medium(
            color: kNeutralColor,
            fontSize: 14.0,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 8.0)),
        const Divider(
          color: kTabBarTitleColor,
          thickness: 2.0,
          height: 0.5,
          indent: 0.0,
          endIndent: 0.0,
        ),
        
      ],
    );
  }
}
