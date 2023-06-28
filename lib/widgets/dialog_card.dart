import 'package:ferry_easy_admin/mainbutton.dart';
import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';

class DialogCard extends StatefulWidget {
  final IconData icon;
  final String text;
  final void Function()? onButtonPressed1;
  final void Function()? onButtonPressed2;
  final String buttonText1;
  final String buttonText2;

  const DialogCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.onButtonPressed1,
    required this.onButtonPressed2,
    required this.buttonText1,
    required this.buttonText2,
  }) : super(key: key);

  @override
  DialogCardState createState() => DialogCardState();
}

class DialogCardState extends State<DialogCard> {
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
                const SizedBox(height: 40),
                Text(widget.text,
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kcDarkGray)),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainButton(
                        onPressed: widget.onButtonPressed1,
                        buttonText: widget.buttonText1),
                    const SizedBox(width: 40),
                    MainButton(
                      onPressed: widget.onButtonPressed2,
                      buttonText: widget.buttonText2,
                    ),
                  ],
                ),
              ],
            )));
  }
}
