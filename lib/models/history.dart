import 'package:meta/meta.dart';

class History {
  final String imgurl;
  final String centerName;
  final String centerLocation;
  final double centerRating;
  final String centerStatus;

  const History({
    required this.imgurl,
    required this.centerName,
    required this.centerLocation,
    required this.centerRating,
    required this.centerStatus,
  });
}
