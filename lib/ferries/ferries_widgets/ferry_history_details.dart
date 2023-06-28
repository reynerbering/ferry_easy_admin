import 'package:ferry_easy_admin/ferries/ferry_passenger_history.dart';
import 'package:flutter/material.dart';

import '../../constants.dart/colors.dart';

class FerryHistoryDetails extends StatefulWidget {
  final String date;
  final String route;
  final String departure;
  final String arrival;

  const FerryHistoryDetails({
    Key? key,
    required this.date,
    required this.route,
    required this.departure,
    required this.arrival,
  }) : super(key: key);

  @override
  FerryHistoryDetailsState createState() => FerryHistoryDetailsState();
}

class FerryHistoryDetailsState extends State<FerryHistoryDetails> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, FerryPassengerHistory.id);
      },
      onHover: (isHovered) {
        setState(() {
          _isHovered = isHovered;
        });
      },
      child: Card(
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
                    widget.date,
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
                    widget.route,
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
                    widget.departure,
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
                    widget.arrival,
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
      ),
    );
  }
}
