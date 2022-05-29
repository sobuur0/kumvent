import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class BookingDetailsPage extends StatefulWidget {
  final String eventCenterImageUrl;

  const BookingDetailsPage({
    Key? key,
    required this.eventCenterImageUrl,
  }) : super(key: key);

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
                          'Center Point Hotel, Auditorium',
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
                      color: Color(0xFFA6A4A4),
                      size: 15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 40.0)),
          Text('Facilities', style: TextStyles.,)
        ],
      ),
    );
  }
}
