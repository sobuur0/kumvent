import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
      body: SlidableAutoCloseBehavior(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                _historyWidget(
                  imgurl: 'images/atlantis_center.jpg',
                  centerName: 'Atlantis Event center',
                  centerLocation: 'Ita-Oniyan, Ondo',
                  centerRating: 4.9,
                  centerStatus: 'Center Available',
                ),
                _historyWidget(
                  imgurl: 'images/atlantis_center.jpg',
                  centerName: 'Atlantis Event center',
                  centerLocation: 'Ita-Oniyan, Ondo',
                  centerRating: 4.9,
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
                _historyWidget(
                  imgurl: 'images/atlantis_center.jpg',
                  centerName: 'Atlantis Event center',
                  centerLocation: 'Ita-Oniyan, Ondo',
                  centerRating: 4.9,
                  centerStatus: 'Not Available',
                ),
                _historyWidget(
                  imgurl: 'images/atlantis_center.jpg',
                  centerName: 'Atlantis Event center',
                  centerLocation: 'Ita-Oniyan, Ondo',
                  centerRating: 4.9,
                  centerStatus: 'Center Available',
                ),
                _historyWidget(
                  imgurl: 'images/atlantis_center.jpg',
                  centerName: 'Atlantis Event center',
                  centerLocation: 'Ita-Oniyan, Ondo',
                  centerRating: 4.9,
                  centerStatus: 'Not Available',
                ),
                _historyWidget(
                  imgurl: 'images/atlantis_center.jpg',
                  centerName: 'Atlantis Event center',
                  centerLocation: 'Ita-Oniyan, Ondo',
                  centerRating: 4.9,
                  centerStatus: 'Center Available',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _historyWidget({
    required String imgurl,
    required String centerName,
    required String centerLocation,
    required double centerRating,
    required String centerStatus,
  }) {
    return Slidable(
      child: EventCenterWidget(
          image: imgurl,
          centerName: centerName,
          centerLocation: centerLocation,
          centerRating: centerRating.toString(),
          shadowColor: const Color(0xFF171717).withOpacity(0.25),
          centerStatus: centerStatus),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: null,
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.bookmark_add,
            label: 'Save',
            borderRadius: BorderRadius.circular(8.0),
          ),
          SlidableAction(
            onPressed: null,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(8.0),
          ),
        ],
      ),
    );
  }
}
