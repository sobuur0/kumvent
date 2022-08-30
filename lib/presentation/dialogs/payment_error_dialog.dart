import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class PaymentError extends StatefulWidget {
  final double size;
  const PaymentError({Key? key, required this.size}) : super(key: key);

  @override
  State<PaymentError> createState() => _PaymentErrorState();
}

class _PaymentErrorState extends State<PaymentError> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: widget.size,
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.highlight_off,
              color: kSecondaryColor,
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              'You have Insufficient Funds to proceed with this booking',
              textAlign: TextAlign.center,
              style: TextStyles.semiBold(
                color: kBlack3,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
