import 'package:ferry_easy_admin/mainbutton.dart';
import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';

class ConfirmationCard extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onButtonPressed;
  final String buttonText;

  const ConfirmationCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.onButtonPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  _ConfirmationCardState createState() => _ConfirmationCardState();
}

class _ConfirmationCardState extends State<ConfirmationCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
            width: 500,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 80,
                  color: kcPrimaryColor,
                ),
                SizedBox(height: 40),
                Text(widget.text,
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kcDarkGray)),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainButton(
                        onPressed: widget.onButtonPressed,
                        buttonText: widget.buttonText),
                  ],
                ),
              ],
            )));
  }
}
