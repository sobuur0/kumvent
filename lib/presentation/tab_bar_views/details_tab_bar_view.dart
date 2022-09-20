import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/booking_details_page.dart';
import 'package:kumvent/presentation/widgets/icon_container.dart';

class DetailsTabBarView extends StatefulWidget {
  final String eventCenterImage;
  final String eventCenterName;
  const DetailsTabBarView({Key? key, required this.eventCenterImage, required this.eventCenterName,}) : super(key: key);

  @override
  State<DetailsTabBarView> createState() => _DetailsTabBarViewState();
}

class _DetailsTabBarViewState extends State<DetailsTabBarView> {
  final String _eventCenterPrice = '\$250';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 4.0),
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
        const Padding(padding: EdgeInsets.only(bottom: 16.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconContainer(
              child: const Icon(
                Icons.access_time,
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
            const Padding(padding: EdgeInsets.only(right: 8.0)),
            Text(
              'Days Open',
              style: TextStyles.semiBold(
                color: kPrimaryColor,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 8.0)),
        _buildDaysOpenColumn(),
        const Divider(
          color: kTabBarTitleColor,
          thickness: 2.0,
          height: 0.5,
          indent: 0.0,
          endIndent: 0.0,
        ),
        const Padding(padding: EdgeInsets.only(bottom: 8.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _eventCenterPrice,
              style: TextStyles.bold(
                color: kNeutralColor,
                fontSize: 20.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  BookingDetailsPage(
                      eventCenterImageUrl: widget.eventCenterImage,
                      eventCenterName: widget.eventCenterName,
                    ),
                  ),
                );
              },
              child: Text(
                'Book Now',
                style: TextStyles.bold(
                  color: kPrimaryColor,
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 26.0),
                backgroundColor: const Color(0xFFC3CDF3),
                fixedSize: const Size.fromHeight(48.0),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDaysOpenColumn() {
    return Column(
      children: [
        _daysAndOpenedTime(dayOfTheWeek: 'Monday', timeOpened: '9am - 4pm'),
        _daysAndOpenedTime(dayOfTheWeek: 'Tuesday', timeOpened: '9am - 4pm'),
        _daysAndOpenedTime(dayOfTheWeek: 'Wednesday', timeOpened: '9am - 4pm'),
        _daysAndOpenedTime(dayOfTheWeek: 'Thursday', timeOpened: '9am - 4pm'),
        _daysAndOpenedTime(dayOfTheWeek: 'Friday', timeOpened: 'Closed'),
        _daysAndOpenedTime(
            dayOfTheWeek: 'Saturday/Sunday', timeOpened: '9am - 4pm'),
      ],
    );
  }

  Widget _daysAndOpenedTime({
    required String dayOfTheWeek,
    required String timeOpened,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dayOfTheWeek,
            style: TextStyles.medium(
              color: kNeutralColor,
              fontSize: 14.0,
            ),
          ),
          Text(
            timeOpened,
            style: TextStyles.medium(
              color: kNeutralColor,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
