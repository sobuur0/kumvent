import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/event_center_overview_page.dart';

class EventCenterWidget extends StatelessWidget {
  final String image;
  final String centerName;
  final String centerLocation;
  final String centerRating;
  final Color shadowColor;
  final String centerStatus;

  const EventCenterWidget({
    Key? key,
    required this.image,
    required this.centerName,
    required this.centerLocation,
    required this.centerRating,
    required this.shadowColor,
    required this.centerStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (centerStatus == 'Center Available') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventCenterOverviewPage(
                imgUrl: image,
                eventCenterName: centerName,
                rating: centerRating,
              ),
            ),
          );
        } else {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('My Honourable User'),
              content: const Text(
                'As you can see, that event center is unfortunately, \'Not Available\'',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('MY BAD'),
                ),
              ],
            ),
          );
        }
      },
      child: Container(
        height: 96.0,
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: shadowColor,
              blurRadius: 32.0,
              offset: const Offset(0.0, 8.0),
            )
          ],
        ),
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 12.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(image),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(top: 14.0)),
                    Row(
                      children: <Widget>[
                        Text(
                          centerName,
                          style: TextStyles.bold(
                            color: kNeutralColor,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      centerLocation,
                      style: TextStyles.medium(
                        color: kNeutralColor,
                        fontSize: 14.0,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        Text(
                          centerRating,
                          style: TextStyles.bold(
                            color: kTextPrimaryColor,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 26.0,
                width: 106.0,
                padding: const EdgeInsets.only(top: 5.0),
                margin: const EdgeInsets.only(
                  right: 9.0,
                  bottom: 8.0,
                ),
                decoration: BoxDecoration(
                  color: centerStatus == 'Center Available'
                      ? kCenterAvailableIndicatorColor
                      : kCenterNotAvailableIndicatorColor,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Text(
                  centerStatus,
                  textAlign: TextAlign.center,
                  style: TextStyles.semiBold(
                    color: centerStatus == 'Center Available'
                        ? kCenterAvailableTextColor
                        : kCenterNotAvailableTextColor,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
