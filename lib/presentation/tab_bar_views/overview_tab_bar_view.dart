import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/widgets/icon_container.dart';

class OverviewTabBarView extends StatefulWidget {
  const OverviewTabBarView({Key? key}) : super(key: key);

  @override
  State<OverviewTabBarView> createState() => _OverviewTabBarViewState();
}

class _OverviewTabBarViewState extends State<OverviewTabBarView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconsColumn(iconTitle: 'Call', iconData: Icons.local_phone),
              _buildIconsColumn(iconTitle: 'Map', iconData: Icons.map_outlined),
              _buildIconsColumn(iconTitle: 'Website', iconData: Icons.language),
            ],
          ),
        ),
        const Divider(
          color: kTabBarTitleColor,
          thickness: 2.0,
          height: 0.5,
          indent: 0.0,
          endIndent: 0.0,
        ),
        const Padding(padding: EdgeInsets.only(bottom: 24.0)),
        Text(
          'Facilities',
          style: TextStyles.bold(
            color: kPrimaryColor,
            fontSize: 18.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildFacilitiesRow(iconData: Icons.people),
              _buildFacilitiesRow(iconData: Icons.ac_unit),
              _buildFacilitiesRow(iconData: Icons.pool),
              _buildFacilitiesRow(iconData: Icons.wifi),
            ],
          ),
        ),
        const Divider(
          color: kTabBarTitleColor,
          thickness: 2.0,
          height: 0.5,
          indent: 0.0,
          endIndent: 0.0,
        ),
        const Padding(padding: EdgeInsets.only(bottom: 24.0)),
        Text(
          'More Photos',
          style: TextStyles.bold(
            color: kPrimaryColor,
            fontSize: 18.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: SizedBox(
            height: size.height * 0.17,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _morePhotosContainer(assetName: 'images/event_center.png'),
                _morePhotosContainer(assetName: 'images/event_center.png'),
                _morePhotosContainer(assetName: 'images/event_center.png'),
                _morePhotosContainer(assetName: 'images/event_center.png'),
              ],
            ),
          ),
        ),
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

  Widget _buildIconsColumn({
    required String iconTitle,
    required IconData iconData,
  }) {
    return Column(
      children: [
        IconContainer(
          child: Icon(
            iconData,
            color: kPrimaryColor,
          ),
          height: 40.0,
          width: 40.0,
          color: Colors.white,
          borderRadius: 20.0,
          borderColor: Colors.white,
          borderWidth: 0.0,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: const Color(0xFF0E3EE5).withOpacity(0.1),
              offset: const Offset(0.0, 2.0),
            )
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 9.0)),
        Text(
          iconTitle,
          style: TextStyles.semiBold(
            color: kPrimaryColor,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  Widget _buildFacilitiesRow({
    required IconData iconData,
  }) {
    return IconContainer(
      child: Icon(
        iconData,
        color: Colors.black,
      ),
      height: 53,
      width: 56,
      color: Colors.white,
      borderRadius: 8.0,
      borderColor: kLightBlueColor,
      borderWidth: 1.0,
    );
  }

  Widget _morePhotosContainer({
    required String assetName,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: 136.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blue,
        border: Border.all(
          color: Colors.red,
          width: 2.0,
        ),
      ),
      child: Image.asset(
        assetName,
        filterQuality: FilterQuality.high,
        fit: BoxFit.fill,
      ),
    );
  }
}
