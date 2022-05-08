import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/widgets/action_button.dart';

class EnableLocationDialog extends StatelessWidget {
  const EnableLocationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        height: size.height * 0.4,
        width: size.width * 0.8,
        padding: const EdgeInsets.only(top: 18.0, left: 7.0, right: 7.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Text(
              'Enable Location',
              style: TextStyles.regular(
                color: kNeutralColor,
                fontSize: 16.0,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 23.0)),
            const Icon(
              Icons.location_on_outlined,
              color: Color(0xFF0D34BF),
              size: 70.0,
            ),
            const Padding(padding: EdgeInsets.only(bottom: 23.0)),
            Text(
              'We need to know your location in order to\nsugest nearby Event centers',
              textAlign: TextAlign.center,
              style: TextStyles.medium(
                color: kNeutralColor,
                fontSize: 12.0,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 22.0)),
            Padding(
              padding: const EdgeInsets.only(
                left: 46.0,
                right: 46.0,
              ),
              child: ActionButton(
                buttonWidth: 174.0,
                buttonHeight: 32.0,
                onPressed: () {},
                title: 'Enable',
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 13.0)),
            TextButton(
              onPressed: () {},
              child: Text(
                'Not Now',
                style: TextStyles.semiBold(
                  color: const Color(0xFF728CE9),
                  fontSize: 12.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
