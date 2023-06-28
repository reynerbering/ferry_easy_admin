import 'package:flutter/material.dart';

import '../../constants.dart/colors.dart';

class UsersInfo extends StatefulWidget {
  final String lastName;
  final String firstName;
  final String city;
  final String email;

  const UsersInfo({
    super.key,
    required this.lastName,
    required this.firstName,
    required this.city,
    required this.email,
  });

  @override
  UsersInfoState createState() => UsersInfoState();
}

class UsersInfoState extends State<UsersInfo> {
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
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${widget.lastName}, ${widget.firstName}',
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
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  widget.email,
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
                  widget.city,
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
