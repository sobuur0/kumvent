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
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
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
              height: size.height * 0.37,
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
              height: _getTabBarIndex() == 2
                  ? size.height * 0.43
                  : size.height * 0.5,
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
        bottomNavigationBar: Visibility(
          visible: _getTabBarIndex() == 2 ? true : false,
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 17.0, horizontal: 22.0),
            decoration: const BoxDecoration(
              color: kTabBarTitleColor,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16.0,
                  child: Image.asset('images/profile_pic.png'),
                ),
                const Padding(padding: EdgeInsets.only(right: 18.0)),
                Expanded(
                  child: SizedBox(
                    height: 36.0,
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        suffix: const Icon(
                          Icons.emoji_emotions,
                          color: kNeutralColor,
                        ),
                        suffixIcon: const Icon(
                          Icons.emoji_emotions,
                          color: kNeutralColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
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
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 18.0)),
                const Icon(
                  Icons.send,
                  color: kNeutralColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  int _getTabBarIndex() {
    _tabController.addListener(
      () {
        if (_tabController.indexIsChanging) {
          setState(() {
            _activeIndex = _tabController.index;
          });
        }
      },
    );
    return _activeIndex;
  }
}
