import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/event_center_overview_page.dart';
import 'package:kumvent/presentation/pages/profille_page.dart';
import 'package:kumvent/presentation/widgets/event_center_widget.dart';
import 'package:kumvent/presentation/widgets/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              const Icon(
                Icons.location_on,
                color: kErrorColor,
              ),
              const Padding(padding: EdgeInsets.only(right: 10.0)),
              Text(
                'Ita Oniyan, Ondo',
                style: TextStyles.bold(
                  color: kPrimaryColor,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, ProfilePage.routeName);
              },
              child: CircleAvatar(
                radius: 20.0,
                child: Image.asset('images/profile_pic.png'),
              ),
            ),
            const Padding(padding: EdgeInsets.only(right: 16.0)),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Let\'s help you find your\nperfect ',
                        style: TextStyles.semiBold(
                          color: kTextPrimaryColor,
                          fontSize: 20.0,
                        ),
                      ),
                      TextSpan(
                        text: 'Event Center',
                        style: TextStyles.bold(
                          color: kTextPrimaryColor,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 23.0)),
                const SearchField(),
                const Padding(padding: EdgeInsets.only(bottom: 34.0)),
                _buildTextButtons(
                  leftText: 'Most Popular',
                  leftOnpressed: () {
                    //This is temporarily used to check for progress on the explore page
                  },
                  rightText: 'view all',
                  rightOnpressed: () {},
                ),
                const Padding(padding: EdgeInsets.only(bottom: 14.0)),
                SizedBox(
                  height: size.height * 0.24,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      _buildPopularEventCenters(
                        size,
                        imgUrl: 'images/jmroyal_main.jpg',
                        eventCenterName: 'JM Royal Event Center',
                        rating: 4.8,
                        location: 'Sagamu, Ogun',
                        price: '\$250',
                      ),
                      _buildPopularEventCenters(
                        size,
                        imgUrl: 'images/living_spring_main.jpg',
                        eventCenterName: 'Living Spring Homes',
                        rating: 4.9,
                        location: 'Oshogbo, Osun',
                        price: '\$123',
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 22.0)),
                _buildTextButtons(
                  leftText: 'Near you',
                  leftOnpressed: () {},
                  rightText: 'view all',
                  rightOnpressed: () {},
                ),
                const Padding(padding: EdgeInsets.only(bottom: 14.0)),
                EventCenterWidget(
                  image: 'images/atlantis_center.jpg',
                  centerName: 'Atlantis Event center',
                  centerLocation: 'Ita-Oniyan, Ondo',
                  centerRating: 4.9,
                  shadowColor: const Color(0xFF171717).withOpacity(0.25),
                  centerStatus: 'Center Available',
                ),
                const EventCenterWidget(
                  image: 'images/orlando.jpg',
                  centerName: 'Orlando Conference Hall',
                  centerLocation: 'Ita-Oniyan, Ondo',
                  centerRating: 5.0,
                  shadowColor: Color(0xFFFFFFFF),
                  centerStatus: 'Not Available',
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularEventCenters(
    Size size, {
    required String imgUrl,
    required String eventCenterName,
    required double rating,
    required String location,
    required String price,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventCenterOverviewPage(
              imgUrl: imgUrl,
              eventCenterName: eventCenterName,
              rating: rating,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 11.0,
          vertical: 5.0,
        ),
        margin: const EdgeInsets.only(right: 32.0),
        height: size.height * 0.24,
        width: 204,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color(0xFFF3F1F1),
              blurRadius: 32.0,
              offset: Offset(0.0, 8.0),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 4.0,
                      ),
                      child: _eventRating(rating: rating),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10.0)),
            Text(
              eventCenterName,
              style: TextStyles.bold(
                color: kTextPrimaryColor,
                fontSize: 14.0,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5.0)),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.location_on,
                  color: kSecondaryColor,
                  size: 15.0,
                ),
                Text(
                  location,
                  style: TextStyles.medium(
                    color: kEventCenterLocationColor,
                    fontSize: 12.0,
                  ),
                ),
                const Spacer(),
                Text(
                  price,
                  style: TextStyles.bold(
                    color: kPrimaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextButtons({
    required String leftText,
    required String rightText,
    required VoidCallback leftOnpressed,
    required VoidCallback rightOnpressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: leftOnpressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          child: Text(
            leftText,
            style: TextStyles.bold(
              color: kPrimaryColor,
              fontSize: 20.0,
            ),
          ),
        ),
        TextButton(
          onPressed: rightOnpressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          child: Text(
            rightText,
            style: TextStyles.regular(
              color: kPrimaryColor,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _eventRating({
    required double rating,
  }) {
    return Container(
      height: 30.0,
      width: 48.0,
      decoration: BoxDecoration(
        color: const Color(0xFFEDECEC).withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.star,
            color: kSecondaryColor,
          ),
          Text(
            rating.toString(),
            style: TextStyles.bold(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
