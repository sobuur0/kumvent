import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/widgets/icon_container.dart';
import 'package:kumvent/presentation/widgets/search_field.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: const Icon(Icons.arrow_back),
            color: kNeutralColor,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          'Search',
          style: TextStyles.bold(
            color: kTextPrimaryColor,
            fontSize: 24.0,
          ),
        ),
        actions: <Widget> [
          CircleAvatar(
            radius: 20.0,
            child: Image.asset('images/profile_pic.png'),
          ),
          const Padding(padding: EdgeInsets.only(right: 16.0)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 20.0,
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Expanded(child: SearchField()),
              const SizedBox(
                width: 19.0,
              ),
              IconContainer(
                child: const ImageIcon(
                  AssetImage('images/filter.png'),
                  color: Colors.white,
                ),
                onTap: () {},
                height: 48.0,
                width: 48.0,
                color: kPrimaryColor,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 21.0)),
          Text(
            'Popular search',
            style: TextStyles.bold(
              color: kPrimaryColor,
              fontSize: 20.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 11.0)),
          SizedBox(
            height: 144.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildPopularSearch(),
                _buildPopularSearch(),
                _buildPopularSearch(),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 41.0)),
          Text(
            'Trending',
            style: TextStyles.bold(
              color: kPrimaryColor,
              fontSize: 20.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 11.0)),
          SizedBox(
            height: size.height * 0.37,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: _buildTrendingCenters(
                    size,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 24.0)),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: _buildTrendingCenters(
                          size,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 24.0)),
                      Expanded(
                        flex: 4,
                        child: _buildTrendingCenters(
                          size,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
        ],
      ),
    );
  }

  Widget _buildPopularSearch() {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(right: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: const AlignmentDirectional(1.0, -1.0),
          end: const AlignmentDirectional(1.0, 1.0),
          colors: <Color>[
            const Color(0xFF3E282880).withOpacity(0.50),
            const Color(0xFF000000).withOpacity(1),
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Image.asset('images/event_center.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 84.0)),
              Text(
                'Living Spring  Hotel',
                style: TextStyles.bold(
                  color: kWhiteShadeColor,
                  fontSize: 16.0,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Lekki, Lagos',
                    style: TextStyles.medium(
                      color: kWhiteShadeColor,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const Icon(
                    Icons.star,
                    size: 15.0,
                    color: kSecondaryColor,
                  ),
                  Text(
                    '5.0',
                    style: TextStyles.bold(
                      color: kWhiteShadeColor,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingCenters(Size size) {
    return Container(
      height: size.height * 0.37,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: const AlignmentDirectional(1.0, -1.0),
          end: const AlignmentDirectional(1.0, 1.0),
          colors: <Color>[
            const Color(0xFF3E282880).withOpacity(0.50),
            const Color(0xFF000000).withOpacity(1),
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'images/event_center.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Living Spring  Hotel',
                    style: TextStyles.bold(
                      color: kWhiteShadeColor,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Lekki, Lagos',
                      textScaleFactor: 0.9,
                      style: TextStyles.medium(
                        color: kWhiteShadeColor,
                        fontSize: 14.0,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.star,
                      size: 15.0,
                      color: kSecondaryColor,
                    ),
                    Text(
                      '5.0',
                      style: TextStyles.bold(
                        color: kWhiteShadeColor,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
