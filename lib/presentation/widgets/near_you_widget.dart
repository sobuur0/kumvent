import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class NearYouWidget extends StatelessWidget {
  final String image;
  final String centerName;
  final String centerLocation;
  final String centerRating;
  final Color shadowColor;
  final String centerStatus;

  const NearYouWidget({
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
    return Container(
      height: 96.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 32.0,
            offset: const Offset(0.0, 8.0),
          )
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 12.0, 14.0, 12.0),
                child: Image.asset(image),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 14.0)),
                  Row(
                    children: [
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
                    children: [
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              centerStatus == 'Center Available'
                  ? const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 16.0,
                          right: 12.0,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xFF0D34BF),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 26.0,
                  width: 106.0,
                  padding: const EdgeInsets.only(top: 5.0),
                  margin: const EdgeInsets.only(
                    right: 9.0,
                    bottom: 16.0,
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
        ],
      ),
    );
  }
}
