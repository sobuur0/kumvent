import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/explore_page.dart';
import 'package:kumvent/presentation/pages/homepage.dart';
import 'package:kumvent/presentation/pages/notification_page.dart';
import 'package:kumvent/presentation/pages/profille_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? _selectedIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void _jumpToPage(int page) {
    _pageController!.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
        children: const [
          HomePage(),
          ExplorePage(),
          NotificationsPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kNeutralColor,
        selectedLabelStyle: TextStyles.bold(
          color: kPrimaryColor,
          fontSize: 12.0,
        ),
        unselectedLabelStyle: TextStyles.semiBold(
          color: kNeutralColor,
          fontSize: 12.0,
        ),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex!,
        onTap: _jumpToPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
