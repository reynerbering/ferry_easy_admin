import 'package:flutter/material.dart';

import '../../constants.dart/colors.dart';

class TransactionsInfo extends StatefulWidget {
  final String transactionType;
  final int amount;
  final String date;
  final String user;

  const TransactionsInfo({
    super.key,
    required this.transactionType,
    required this.amount,
    required this.date,
    required this.user,
  });

  @override
  TransactionsInfoState createState() => TransactionsInfoState();
}

class TransactionsInfoState extends State<TransactionsInfo> {
  bool _isHovering = false;

  void _onEnter(PointerEvent details) {
    setState(() {
      _isHovering = true;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _isHovering = false;
    });
  }

  Color _getBackgroundColor() {
    return _isHovering ? kcPrimaryColor : kcSecondaryColor;
  }

  Color _getTextColor() {
    return _isHovering ? Colors.white : kcPrimaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: Container(
        width: 850,
        height: 40,
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.transactionType,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _getTextColor()),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'PHP ${widget.amount.toString()}',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: _getTextColor()),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.date.toString(),
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: _getTextColor()),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.user,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: _getTextColor()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
