import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: kPrimaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: kTextPrimaryColor,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 20.0)),
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
            const Spacer(),
            CircleAvatar(
              radius: 20.0,
              child: Image.asset('images/profile_pic.png'),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Padding(padding: EdgeInsets.only(top: 14.0)),
          Text.rich(
            TextSpan(
              children: [
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
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFEDECEC),
              hintText: 'Search Centres',
              hintStyle: TextStyles.regular(
                color: const Color(0xFFA6A4A4),
                fontSize: 14.0,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xFFA6A4A4),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: Color(0xFFEDECEC),
                  width: 0.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 34.0)),
          _buildTextButtons(
            leftText: 'Most Popular',
            rightText: 'view all',
          ),
          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
          SizedBox(
            height: size.height * 0.235,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildPopularEventCenters(size),
                _buildPopularEventCenters(size),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
          _buildTextButtons(
            leftText: 'Near you',
            rightText: 'view all',
          ),
        ],
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
      height: size.height * 0.22,
      width: 204,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFF3F1F1),
              blurRadius: 32.0,
              offset: Offset(0.0, 8.0),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            child: Stack(
              children: [
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
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: kSecondaryColor,
              ),
              Text(
                'Sagamu, Ogun',
                style: TextStyles.medium(
                  color: kEventLocationColor,
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
          )
        ],
      ),
    );
  }

  Widget _buildTextButtons({
    required String leftText,
    required String rightText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
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
          onPressed: () {},
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
      child: Row(children: [
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
      ]),
    );
  }
}
