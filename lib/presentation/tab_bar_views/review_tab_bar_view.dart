import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/widgets/star_ratings.dart';

class ReviewTabBarView extends StatefulWidget {
  const ReviewTabBarView({Key? key}) : super(key: key);

  @override
  State<ReviewTabBarView> createState() => _ReviewTabBarViewState();
}

class _ReviewTabBarViewState extends State<ReviewTabBarView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
      children: [
        Text(
          'Review summary',
          style: TextStyles.bold(
            color: const Color(0xFF121212),
            fontSize: 14.0,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 18.0)),
        Padding(
          padding: const EdgeInsets.only(right: 18.0, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4.9',
                    style: TextStyles.medium(
                      color: kNeutralColor,
                      fontSize: 40.0,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 5.0)),
                  const StarRatings(
                    color: kReviewStarRatingsColor,
                    size: 14.0,
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                  Text(
                    '1,234',
                    style: TextStyles.medium(
                      color: kNeutralColor,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  _reviewProgressBar(size, starRating: '5', value: 0.8),
                  _reviewProgressBar(size, starRating: '4', value: 0.6),
                  _reviewProgressBar(size, starRating: '3', value: 0.4),
                  _reviewProgressBar(size, starRating: '2', value: 0.3),
                  _reviewProgressBar(size, starRating: '1', value: 0.2),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommended Reviews',
              style: TextStyles.bold(
                color: kNeutralColor,
                fontSize: 14.0,
              ),
            ),
            Text(
              'Most recent',
              style: TextStyles.medium(
                color: kNeutralColor,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 24.0)),
        _userReview(),
        _userReview(),
      ],
    );
  }

  Widget _reviewProgressBar(
    Size size, {
    required String starRating,
    required double value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            starRating,
            style: TextStyles.medium(
              color: kNeutralColor,
              fontSize: 12.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 11.0)),
          SizedBox(
            width: size.width * 0.45,
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: kTabBarTitleColor,
              color: kPrimaryColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _userReview() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 21.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16.0,
            child: Image.asset(
              'images/profile_pic.png',
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 14.0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fada John',
                style: TextStyles.semiBold(
                  color: kNeutralColor,
                  fontSize: 16.0,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 6.0)),
              Text(
                '17th May, 2022',
                style: TextStyles.medium(
                  color: kNeutralColor,
                  fontSize: 12.0,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 7.0)),
              const StarRatings(
                color: kReviewStarRatingsColor,
                size: 14.0,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 7.0)),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text:
                          'I have actually used this application and it actually wasn\'t\nthat bad'
                          ' and that\'s why i gave it 4 stars, they should make it\nperfect next time...',
                    ),
                    TextSpan(
                      text: 'Read more',
                      style: TextStyles.bold(
                        color: kSecondaryColor,
                        fontSize: 12.0,
                      ),
                    )
                  ],
                ),
                textScaleFactor: 0.82,
                style: TextStyles.medium(
                  color: kNeutralColor,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
