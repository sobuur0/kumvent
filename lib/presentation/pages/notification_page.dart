import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class NotificationsPage extends StatelessWidget {
  static String routeName = '/notification';
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 0.0,
        ),
        children: [
          Text(
            'Notifications',
            style: TextStyles.bold(
              color: kLeadingIconColor,
              fontSize: 24,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 23.0),
          ),
          _buiildNotificationCard(),
          _buildMiddleNotificationCard(),
          _buiildNotificationCard(),
        ],
      ),
    );
  }

  _buildMiddleNotificationCard() {
    return Container(
      margin: const EdgeInsets.only(top: 40.0, bottom: 40.0),
      padding: const EdgeInsets.fromLTRB(16.0, 22.0, 20.0, 23.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(0.45, 0.5),
            blurRadius: 10,
            spreadRadius: 0.15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/event_center.png',
                height: 91.0,
                width: 96.0,
                filterQuality: FilterQuality.high,
              ),
              const Padding(padding: EdgeInsets.only(right: 11.0)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 13.0)),
                  Text(
                    'Center Point Holiday inn',
                    textScaleFactor: 0.85,
                    style: TextStyles.bold(
                      color: kTextPrimaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _checkInAndOutTime(
                        subtitle: 'Wed, 20 Apr 2022',
                        title: 'Check In',
                      ),
                      const Padding(padding: EdgeInsets.only(right: 35.0)),
                      _checkInAndOutTime(
                        subtitle: 'Sat, 23 Apr 2022',
                        title: 'Check Out',
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20.0)),
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Check In Now',
                style: TextStyles.semiBold(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buiildNotificationCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24.0, 28.0, 7.0, 23.0),
      decoration: const BoxDecoration(
        color: kIconContainerColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Icon(
              Icons.notifications_outlined,
              color: kNotificationIconColor,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 26.0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ramadhan Greetings Promo!',
                style: TextStyles.bold(
                  color: kLeadingIconColor,
                  fontSize: 16,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 4.0)),
              Text(
                '28 Mar',
                style: TextStyles.medium(
                  color: kLeadingIconColor,
                  fontSize: 12,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 13.0)),
              Text(
                'Welcoming the holy month of Ramadhan a discount for\nyou up to #2,200 that you can use for all payment\nmethod',
                maxLines: 3,
                textScaleFactor: 0.75,
                style: TextStyles.semiBold(
                  color: kLeadingIconColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _checkInAndOutTime({
    required String subtitle,
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtitle,
          textScaleFactor: 0.75,
          style: TextStyles.regular(
            color: kNotificationCheckText,
            fontSize: 12.0,
          ),
        ),
        Text(
          title,
          textScaleFactor: 0.8,
          style: TextStyles.medium(
            color: kNotificationCheckText,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
