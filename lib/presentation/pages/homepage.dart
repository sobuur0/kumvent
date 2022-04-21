import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/explore_page.dart';
import 'package:kumvent/presentation/pages/success_page.dart';
import 'package:kumvent/presentation/widgets/enable_location_dialog.dart';
import 'package:kumvent/presentation/widgets/near_you_widget.dart';
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
        drawer: Drawer(
          backgroundColor: kPrimaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) => IconButton(
              icon: const Icon(Icons.menu),
              color: kTextPrimaryColor,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
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
            CircleAvatar(
              radius: 20.0,
              child: Image.asset('images/profile_pic.png'),
            ),
            const Padding(padding: EdgeInsets.only(right: 16.0)),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => const SuccessPage(),
                //   ),
                // );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const EnableLocationDialog();
                  },
                );
              },
              rightText: 'view all',
              rightOnpressed: () {},
            ),
            const Padding(padding: EdgeInsets.only(bottom: 14.0)),
            SizedBox(
              height: size.height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildPopularEventCenters(size),
                  _buildPopularEventCenters(size),
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
            NearYouWidget(
              image: 'images/atlantis_center.png',
              centerName: 'Atlantis Event center',
              centerLocation: 'Ita-Oniyan, Ondo',
              centerRating: '4.9',
              shadowColor: const Color(0xFF171717).withOpacity(0.25),
              centerStatus: 'Center Available',
            ),
            const NearYouWidget(
              image: 'images/orlando_hall.png',
              centerName: 'Orlando Conference Hall',
              centerLocation: 'Ita-Oniyan, Ondo',
              centerRating: '5.0',
              shadowColor: Color(0xFFF3F1F1),
              centerStatus: 'Not Available',
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10.0)),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularEventCenters(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11.0,
        vertical: 5.0,
      ),
      margin: const EdgeInsets.only(right: 32.0),
      height: size.height * 0.2,
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
              //TODO: replace with correct color
              color: Colors.grey,
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/event_center.png',
                  height: 120,
                  width: 182,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 4.0,
                    ),
                    child: _eventRating(),
                  ),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10.0)),
          Text(
            'JM Royal Event Center',
            style: TextStyles.bold(
              color: kTextPrimaryColor,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 5.0)),
          Expanded(
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.location_on,
                  color: kSecondaryColor,
                  size: 15.0,
                ),
                Text(
                  'Sagamu, Ogun',
                  style: TextStyles.medium(
                    color: kEventCenterLocationColor,
                    fontSize: 12.0,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$123',
                  style: TextStyles.bold(
                    color: kPrimaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextButtons(
      {required String leftText,
      required String rightText,
      required VoidCallback leftOnpressed,
      required VoidCallback rightOnpressed}) {
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

  Widget _eventRating() {
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
            '4.8',
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
