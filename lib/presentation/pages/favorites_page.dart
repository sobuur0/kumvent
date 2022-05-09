import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);
  static String routeName = '/fav_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: TextStyles.bold(color: kNeutralColor, fontSize: 24),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: kLeadingIconColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 27),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 96,
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(0.45, 0.5),
                      blurRadius: 20,
                      spreadRadius: 0.15),
                ],
              ),
              child: Row(
                children: [
                  Image.asset('images/favorite.png'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Atlantis Event Center',
                      ),
                      Text('Lekki, Logos'),
                      Text('4.9'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
