import 'package:flutter/material.dart';

import '../../constants.dart/colors.dart';

class FerryHistoryOutline extends StatelessWidget {
  final String date;
  final String route;
  final String departure;
  final String arrival;

  const FerryHistoryOutline({
    Key? key,
    required this.date,
    required this.route,
    required this.departure,
    required this.arrival,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            date,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: kcPrimaryColor,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            route,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: kcPrimaryColor,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            arrival,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: kcPrimaryColor,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            departure,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: kcPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
