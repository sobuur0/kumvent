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
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: kLeadingIconColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 23),
            child: Text(
              'Notifications',
              style: TextStyles.bold(
                color: kLeadingIconColor,
                fontSize: 24,
              ),
            ),
          ),
          _buiildNotificationCard(),
          _buildMiddleNotificationCard(),
          _buiildNotificationCard(),
        ],
      ),
    );
  }

  Widget _buildMiddleNotificationCard() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(0.45, 0.5),
              blurRadius: 10,
              spreadRadius: 0.15),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 91,
                  height: 96,
                  child: Image.asset('images/notification.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Center Point Holiday inn',
                        style: TextStyles.bold(
                            color: kLeadingIconColor, fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wed, 20 Apr 2022',
                            style: TextStyles.regular(
                              color: kNotificationCheckText,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Sat, 23 Apr 2022',
                            style: TextStyles.semiBold(
                                color: kNotificationCheckText, fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Check In',
                            style: TextStyles.medium(
                                color: kNotificationCheckText, fontSize: 12),
                          ),
                          Text(
                            'Check Out',
                            style: TextStyles.medium(
                                color: kNotificationCheckText, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
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
      ),
    );
  }

  Widget _buiildNotificationCard() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 163,
      decoration: const BoxDecoration(
        color: kIconContainerColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.notifications_outlined,
              color: kNotificationIconColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, left: 20),
                  child: Text(
                    'Ramadhan Greetings Promo!',
                    style:
                        TextStyles.bold(color: kLeadingIconColor, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 13),
                  child: Text(
                    '28 Mar',
                    style: TextStyles.medium(
                        color: kLeadingIconColor, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Welcoming the holy month of Ramadhan a discount for\nyou up to #2,200 that you can use for all payment\nmethod',
                    maxLines: 3,
                    textScaleFactor: 0.8,
                    style: TextStyles.semiBold(
                      color: kLeadingIconColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
