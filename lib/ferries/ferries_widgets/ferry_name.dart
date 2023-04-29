import 'package:flutter/material.dart';

import '../../constants.dart/colors.dart';

class FerryName extends StatelessWidget {
  final String ferryName;
  final String companyName;

  const FerryName({
    Key? key,
    required this.ferryName,
    required this.companyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ferryName,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 36,
            color: kcPrimaryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          companyName,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: kcDarkGray,
          ),
        ),
      ],
    );
  }
}
