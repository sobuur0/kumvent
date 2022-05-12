import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';

import '../../constants/colours.dart';

class BuildCardWidget extends StatelessWidget {
  BuildCardWidget({
    required this.cardType,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expDate,
    this.bgColor,
    Key? key,
  }) : super(key: key);

  String cardType = '';
  String cardNumber = '';
  String cardHolderName = '';
  String expDate = '';
  Color? bgColor = kcardBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          Container(
            height: 168,
            width: 330,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 50,
                  child: Text(
                    cardType,
                    style:
                        TextStyles.bold(color: kWhiteShadeColor, fontSize: 16),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 79,
                  child: Text(
                    cardNumber,
                    style:
                        TextStyles.bold(color: kWhiteShadeColor, fontSize: 14),
                  ),
                ),
                Positioned(
                  top: 132,
                  left: 50,
                  child: Text(
                    cardHolderName,
                    style:
                        TextStyles.bold(color: kGreyShadeColor, fontSize: 12),
                  ),
                ),
                const Positioned(
                  top: 15,
                  right: 60,
                  child: Image(
                    image: AssetImage(
                      'images/mastercard-logo.png',
                    ),
                    height: 48,
                    width: 48,
                  ),
                ),
                Positioned(
                  bottom: 21,
                  right: 60,
                  child: Text(
                    expDate,
                    style:
                        TextStyles.bold(color: kGreyShadeColor, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
