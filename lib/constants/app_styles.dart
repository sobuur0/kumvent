import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Utility class for all styles used in the app
class TextStyles {
  static TextStyle _defaultextStyle(
      Color color,
      double size,
      FontWeight fontWeight,
      ) {
    return GoogleFonts.quicksand(
      textStyle: TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: fontWeight,
      ),
    );
  }

  /// Returns a [TextStyle] that uses the default font Family (quicksand)
  /// with default 'fontWeight' of [FontWeight.w100].
  static TextStyle bold({
    required Color color,
    required double fontSize,
  }) =>
      _defaultextStyle(color, fontSize, FontWeight.w700);
}
