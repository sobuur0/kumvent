
import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/widgets/action_button.dart';
import 'package:kumvent/presentation/widgets/app_bar_text.dart';
import 'package:kumvent/presentation/widgets/text_form_list_tile.dart';

import '../widgets/build_card_widget.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);
  static String routeName = '/checkout';

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardExpiryDateController =
      TextEditingController();
  final TextEditingController _cardCvvCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarText(title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BuildCardWidget(
                    cardHolderName: 'Abiona Kazeem',
                    cardNumber: '****  ****  **** 2354',
                    cardType: 'Master Card',
                    expDate: '12/2022',
                    bgColor: kcardBackgroundColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  BuildCardWidget(
                    cardHolderName: 'Abiona Kazeem',
                    cardNumber: '****  ****  **** 2354',
                    cardType: 'Visa Card',
                    expDate: '12/2022',
                    bgColor: const Color(0XFF1105A6),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 64)),
            Text(
              'Payment Method',
              style:
                  TextStyles.bold(color: const Color(0xff000000), fontSize: 20),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 16),
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color(0xFFF3F1F1),
                    blurRadius: 32.0,
                    spreadRadius: 12,
                    offset: Offset(0.0, 8.0),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/mastercard-logo.png',
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Mastercard',
                        style: TextStyles.bold(
                            color: kLeadingIconColor, fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    'Debit Card',
                    style:
                        TextStyles.bold(color: kGreyShadeColor, fontSize: 14),
                  ),
                  Text(
                    'Paypal',
                    style:
                        TextStyles.bold(color: kGreyShadeColor, fontSize: 14),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
            ),
            TextFormListTile(
              text: 'Card Number',
              textController: _cardNumberController,
              trailing: Image.asset(
                'images/mastercard-logo.png',
                height: 24,
                width: 24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
            ),
            TextFormListTile(
                text: 'Card Holder Name',
                textController: _cardHolderNameController),
            const Padding(
              padding: EdgeInsets.only(top: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ExpiryDateAndCvvWidget(
                    text: 'Expiration Date',
                    textController: _cardExpiryDateController),
                ExpiryDateAndCvvWidget(
                    text: 'CVV Code', textController: _cardCvvCodeController),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 24)),
            ActionButton(
                buttonWidth: double.infinity,
                buttonHeight: 48,
                onPressed: () {},
                title: 'Confirm Payment'),
          ],
        ),
      ),
    );
  }
}
