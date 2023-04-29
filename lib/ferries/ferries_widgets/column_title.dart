import 'package:flutter/material.dart';

import '../../constants.dart/colors.dart';

class ColumnTitle extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  final String title4;

  const ColumnTitle({
    Key? key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: kcHoverColor,
        child: SizedBox(
          width: 850.0,
          height: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(title1,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: kcPrimaryColor,
                            fontWeight: FontWeight.w700))),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(title2,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: kcPrimaryColor,
                            fontWeight: FontWeight.w700))),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(title3,
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: kcPrimaryColor,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(title4,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: kcPrimaryColor,
                            fontWeight: FontWeight.w700))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
