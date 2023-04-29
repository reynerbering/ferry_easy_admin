import 'package:flutter/material.dart';

import '../../constants.dart/colors.dart';

class FerryPassengerDetails extends StatefulWidget {
  final String lastName;
  final String firstName;
  final String middleInitial;
  final String address;

  const FerryPassengerDetails({
    Key? key,
    required this.lastName,
    required this.firstName,
    required this.middleInitial,
    required this.address,
  }) : super(key: key);

  @override
  _FerryHistoryDetailsState createState() => _FerryHistoryDetailsState();
}

class _FerryHistoryDetailsState extends State<FerryPassengerDetails> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _isHovered ? kcPrimaryColor : kcTabColor,
      child: SizedBox(
        width: 850.0,
        height: 30.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.lastName,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: _isHovered ? Colors.white : kcDarkGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.firstName,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: _isHovered ? Colors.white : kcDarkGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.middleInitial,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: _isHovered ? Colors.white : kcDarkGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.address,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: _isHovered ? Colors.white : kcDarkGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
