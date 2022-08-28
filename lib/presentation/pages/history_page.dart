import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/widgets/event_center_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
  static String routeName = '/fav_page';
  final String image = 'images/atlantis_center.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
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
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 8.0, 0.0),
              child: Text(
                'Clear all',
                style: TextStyles.regular(
                  color: kPrimaryColor,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent Bookings',
                style: TextStyles.semiBold(
                  color: kBlack2,
                  fontSize: 16.0,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16.0)),
              EventCenterWidget(
                image: 'images/atlantis_center.jpg',
                centerName: 'Atlantis Event center',
                centerLocation: 'Ita-Oniyan, Ondo',
                centerRating: '4.9',
                shadowColor: const Color(0xFF171717).withOpacity(0.25),
                centerStatus: 'Center Available',
              ),
              EventCenterWidget(
                image: 'images/atlantis_center.jpg',
                centerName: 'Atlantis Event center',
                centerLocation: 'Ita-Oniyan, Ondo',
                centerRating: '4.9',
                shadowColor: const Color(0xFF171717).withOpacity(0.25),
                centerStatus: 'Not Available',
              ),
              const Padding(padding: EdgeInsets.only(top: 28.0)),
              Text(
                'June 3, 2022',
                style: TextStyles.semiBold(
                  color: kBlack2,
                  fontSize: 16.0,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16.0)),
              EventCenterWidget(
                image: 'images/atlantis_center.jpg',
                centerName: 'Atlantis Event center',
                centerLocation: 'Ita-Oniyan, Ondo',
                centerRating: '4.9',
                shadowColor: const Color(0xFF171717).withOpacity(0.25),
                centerStatus: 'Not Available',
              ),
              EventCenterWidget(
                image: 'images/atlantis_center.jpg',
                centerName: 'Atlantis Event center',
                centerLocation: 'Ita-Oniyan, Ondo',
                centerRating: '4.9',
                shadowColor: const Color(0xFF171717).withOpacity(0.25),
                centerStatus: 'Center Available',
              ),
              EventCenterWidget(
                image: 'images/atlantis_center.jpg',
                centerName: 'Atlantis Event center',
                centerLocation: 'Ita-Oniyan, Ondo',
                centerRating: '4.9',
                shadowColor: const Color(0xFF171717).withOpacity(0.25),
                centerStatus: 'Not Available',
              ),
              EventCenterWidget(
                image: 'images/atlantis_center.jpg',
                centerName: 'Atlantis Event center',
                centerLocation: 'Ita-Oniyan, Ondo',
                centerRating: '4.9',
                shadowColor: const Color(0xFF171717).withOpacity(0.25),
                centerStatus: 'Center Available',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
