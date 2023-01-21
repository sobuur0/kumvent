import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/models/history.dart';
import 'package:kumvent/presentation/widgets/event_center_widget.dart';
import 'package:kumvent/models/history_data.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);
  static String routeName = '/fav_page';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final String image = 'images/atlantis_center.jpg';

  List<History> historyData = HistoryData.history;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'June 3, 2022',
              style: TextStyles.semiBold(
                color: kBlack2,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.85,
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: historyData.length,
              itemBuilder: (BuildContext context, int index) {
                return Slidable(
                  child: _eventCenterWidget(index),
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
              },
            ),
          ),
        ],
      ),
      // SlidableAutoCloseBehavior(
      //   child: SingleChildScrollView(
      //     physics: const BouncingScrollPhysics(),
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           // Text(
      //           //   'Recent Bookings',
      //           //   style: TextStyles.semiBold(
      //           //     color: kBlack2,
      //           //     fontSize: 16.0,
      //           //   ),
      //           // ),
      //           // const Padding(padding: EdgeInsets.only(bottom: 16.0)),
      //           // ...recentBookings,
      //           // const Padding(padding: EdgeInsets.only(top: 28.0)),
      //           Text(
      //             'June 3, 2022',
      //             style: TextStyles.semiBold(
      //               color: kBlack2,
      //               fontSize: 16.0,
      //             ),
      //           ),
      //           const Padding(padding: EdgeInsets.only(bottom: 16.0)),
      //           ...datedBookings,
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  removeRecentBookingsFromHistory(Widget widget) {
    setState(() {
      // recentBookings.removeAt(index);
    });
  }
  Widget _eventCenterWidget(int index) {
    return EventCenterWidget(
      image: historyData![index].imgurl,
      centerName: historyData![index].centerName,
      centerLocation: historyData![index].centerLocation,
      centerRating: historyData![index].centerRating,
      shadowColor: const Color(0xFF171717).withOpacity(0.25),
      centerStatus: historyData![index].centerStatus,
    );
  }
}
