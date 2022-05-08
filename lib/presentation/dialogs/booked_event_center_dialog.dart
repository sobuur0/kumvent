import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/presentation/widgets/action_button.dart';

class BookedEventCenterDialog extends StatelessWidget {
  const BookedEventCenterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.8,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 13.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Book the Event Center',
              textAlign: TextAlign.center,
              style: TextStyles.bold(
                color: const Color(0xFF87898B),
                fontSize: 16.0,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bookedCenterDurationDetails(),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D34BF),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(
                    Icons.forward,
                    size: const Size(26.0, 13.0).width,
                    color: Colors.white,
                  ),
                ),
                _bookedCenterDurationDetails(),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 42.0)),
            Padding(
              padding: const EdgeInsets.only(left: 13.0, right: 13.0),
              child: ActionButton(
                buttonWidth: double.infinity,
                buttonHeight: 48.0,
                onPressed: () {},
                title: 'Done',
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 11.0)),
          ],
        ),
      ),
    );
  }

  Widget _bookedCenterDurationDetails() {
    return Column(children: [
      Text(
        'CHECK IN',
        style: TextStyles.bold(
          color: const Color(0xFF87898B),
          fontSize: 12.0,
        ),
      ),
      const Padding(padding: EdgeInsets.only(bottom: 5.0)),
      Text(
        'Apr 20',
        style: TextStyles.bold(
          color: const Color(0xFF1A2731),
          fontSize: 16.0,
        ),
      ),
      const Padding(padding: EdgeInsets.only(bottom: 5.0)),
      Text(
        'Wednesday',
        style: TextStyles.bold(
          color: const Color(0xFF87898B),
          fontSize: 12.0,
        ),
      ),
    ]);
  }
}
