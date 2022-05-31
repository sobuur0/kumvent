import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/checkout_page.dart';
import 'package:kumvent/presentation/widgets/action_button.dart';

class BookingDetailsPage extends StatefulWidget {
  final String eventCenterImageUrl;
  final String eventCenterName;

  const BookingDetailsPage({
    Key? key,
    required this.eventCenterImageUrl,
    required this.eventCenterName,
  }) : super(key: key);

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kTextPrimaryColor,
          ),
        ),
        title: Text(
          'Booking Details',
          style: TextStyles.bold(
            color: Colors.black,
            fontSize: 24.0,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16.0, 46.0, 16.0, 60.0),
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  widget.eventCenterImageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 72.0,
                margin:
                    const EdgeInsets.only(right: 38.0, left: 38.0, top: 120.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2, Church Street Ayetoro - Akure',
                          style: TextStyles.medium(
                            color: const Color(0xFF87898B),
                            fontSize: 12.0,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 8.0)),
                        Text(
                          widget.eventCenterName,
                          style: TextStyles.bold(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(right: 8.0)),
                    const Icon(
                      Icons.edit,
                      color: kEditIconColor,
                      size: 15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 40.0)),
          Text(
            'Facilities',
            style: TextStyles.bold(
              color: kNeutralColor.withOpacity(0.6),
              fontSize: 12.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 13.0)),
          Column(
            children: [
              _facilityRow(
                icon1: Icons.wifi,
                icon2: Icons.wc,
                icon3: Icons.ac_unit,
                faclityName1: 'Free Wi-fi',
                faclityName2: 'Restroom',
                faclityName3: 'Air Conditioner',
              ),
              const Padding(padding: EdgeInsets.only(bottom: 8.0)),
              _facilityRow(
                icon1: Icons.pool,
                icon2: Icons.liquor,
                icon3: Icons.smoking_rooms,
                faclityName1: 'Pool',
                faclityName2: 'Bar',
                faclityName3: 'Smoking Arena',
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
          const Divider(
            color: kDividerColor,
            thickness: 1.0,
            height: 0.5,
          ),
          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _checkInAndOutColumn(
                  action: 'Check In', actionDate: 'Wed, 20 Apr 2022'),
              _checkInAndOutColumn(
                  action: 'Check Out', actionDate: 'Sat, 23 Apr 2022'),
            ],
          ),
          const Divider(
            color: kDividerColor,
            thickness: 1.0,
            height: 0.5,
          ),
          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
          Text(
            'Guest Name',
            style: TextStyles.semiBold(
              color: kGreyShadeColor,
              fontSize: 12.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 6.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MISS SULAIMON AMINAT',
                style: TextStyles.bold(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
              const Icon(
                Icons.edit,
                color: kEditIconColor,
                size: 15.0,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
          const Divider(
            color: kDividerColor,
            thickness: 1.0,
            height: 0.5,
          ),
          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
          Text(
            'Total Price',
            style: TextStyles.semiBold(
              color: kGreyShadeColor,
              fontSize: 12.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 4.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Full Package',
                style: TextStyles.bold(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
              Text(
                '\$250',
                style: TextStyles.bold(
                  color: kNotificationIconColor,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ActionButton(
            buttonWidth: double.infinity,
            buttonHeight: 48,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CheckoutPage(),
                ),
              );
            },
            title: 'Continue to Payment',
          ),
        ],
      ),
    );
  }

  Widget _checkInAndOutColumn({
    required String action,
    required String actionDate,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                action,
                style: TextStyles.semiBold(
                  color: const Color(0xFF87898B),
                  fontSize: 12.0,
                ),
              ),
              const Padding(padding: EdgeInsets.only(right: 6.0)),
              const Icon(
                Icons.edit,
                color: kEditIconColor,
                size: 15.0,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 3.0)),
          Text(
            actionDate,
            style: TextStyles.bold(
              color: Colors.black,
              fontSize: 14.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _facilityRow({
    required IconData icon1,
    icon2,
    icon3,
    required String faclityName1,
    faclityName2,
    faclityName3,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _facility(icon: icon1, faclityName: faclityName1),
        _facility(icon: icon2, faclityName: faclityName2),
        _facility(icon: icon3, faclityName: faclityName3),
      ],
    );
  }

  Widget _facility({
    required IconData icon,
    required String faclityName,
  }) {
    return Row(
      children: [
        Icon(icon),
        const Padding(padding: EdgeInsets.only(right: 6.0)),
        Text(
          faclityName,
          style: TextStyles.semiBold(
            color: kNeutralColor,
            fontSize: 14.0,
          ),
        )
      ],
    );
  }
}
