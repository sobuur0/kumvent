import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/widgets/favorite_widget.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);
  static String routeName = '/fav_page';
  final String image = 'images/atlantis_center.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: TextStyles.bold(color: kNeutralColor, fontSize: 24),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kLeadingIconColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FavoriteWidget(
                image: image,
                centerName: 'Atlantis Event Center',
                centerLocation: 'Lekki, Lagos',
                centerRating: '4.9',
                shadowColor: const Color(0xFF171717).withOpacity(0.25),
                centerStatus: 'Payment Completed',
              ),
              const Padding(padding: EdgeInsets.only(top: 28.0)),
              Text(
                'History',
                style:
                    TextStyles.bold(color: kLeadingIconColor, fontSize: 20.0),
              ),
              FavoriteWidget(
                image: image,
                centerName: 'WOCDIF Event center',
                centerLocation: '2, Oke Onitea Area, Osogbo',
                centerRating: '4.9',
                shadowColor: const Color(0xFFF3F1F1),
                centerStatus: '',
              ),
              FavoriteWidget(
                image: image,
                centerName: '02 Arena',
                centerLocation: '5, Gwagwalada Province, FCT, Abuja',
                centerRating: '4.9',
                shadowColor: const Color(0xFFF3F1F1),
                centerStatus: '',
              ),
              FavoriteWidget(
                image: image,
                centerName: 'Stateline Event Center',
                centerLocation: '2, Stateline Junction FUTA',
                centerRating: '4.9',
                shadowColor: const Color(0xFFF3F1F1),
                centerStatus: '',
              ),
              FavoriteWidget(
                image: image,
                centerName: 'Babalayepe Event center',
                centerLocation: '435, Arowosaye Str. Lekki',
                centerRating: '4.9',
                shadowColor: const Color(0xFFF3F1F1),
                centerStatus: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
