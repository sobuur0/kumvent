import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/tab_bar_views/details_tab_bar_view.dart';
import 'package:kumvent/presentation/tab_bar_views/overview_tab_bar_view.dart';
import 'package:kumvent/presentation/tab_bar_views/review_tab_bar_view.dart';

class EventCenterOverviewPage extends StatefulWidget {
  const EventCenterOverviewPage({Key? key}) : super(key: key);

  @override
  State<EventCenterOverviewPage> createState() =>
      _EventCenterOverviewPageState();
}

class _EventCenterOverviewPageState extends State<EventCenterOverviewPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
              child: Stack(
                children: [
                  Image.asset('images/event_center.png'),
                  Positioned(
                    top: size.height * 0.27,
                    left: 15.0,
                    child: Text(
                      'Maple Hotel Conference Room',
                      style: TextStyles.bold(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.32,
                    left: 15.0,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        const Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        const Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        const Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        const Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        const Padding(padding: EdgeInsets.only(right: 12.0)),
                        Text(
                          '4.9',
                          style: TextStyles.bold(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              controller: _tabController,
              indicatorWeight: 3.0,
              indicatorColor: kPrimaryColor,
              labelColor: kPrimaryColor,
              labelStyle: TextStyles.bold(
                color: kPrimaryColor,
                fontSize: 16.0,
              ),
              unselectedLabelColor: kTabBarTitleColor,
              unselectedLabelStyle: TextStyles.medium(
                color: kTabBarTitleColor,
                fontSize: 16.0,
              ),
              tabs: const <Widget>[
                Tab(
                  text: 'Overview',
                ),
                Tab(
                  text: 'Details',
                ),
                Tab(
                  text: 'Review',
                )
              ],
            ),
            const Divider(
              color: kTabBarTitleColor,
              height: 0.5,
              thickness: 1.0,
              indent: 16.0,
              endIndent: 16.0,
            ),
            SizedBox(
              height: size.height * 0.48,
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const <Widget>[
                  OverviewTabBarView(),
                  DetailsTabBarView(),
                  ReviewTabBarView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
