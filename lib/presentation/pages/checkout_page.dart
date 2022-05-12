import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/widgets/app_bar_text.dart';

import '../widgets/build_card_widget.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);
  static String routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarText(title: 'Checkout'),
      body: ListView(
        padding: const EdgeInsets.only(top: 40),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BuildCardWidget(
              cardHolderName: 'Abiona Kazeem',
              cardNumber: '****  ****  **** 2354',
              cardType: 'Master Card',
              expDate: '12/2022',
              bgColor: kcardBackgroundColor,
            ),
          )
        ],
      ),
    );
  }
}
