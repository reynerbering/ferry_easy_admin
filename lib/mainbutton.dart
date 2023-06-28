import 'package:flutter/material.dart';

import 'constants.dart/colors.dart';

class MainButton extends StatefulWidget {
  final void Function()? onPressed;
  final String buttonText;

  const MainButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  MainButtonState createState() => MainButtonState();
}

class MainButtonState extends State<MainButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isHovering ? kcSecondaryColor : kcPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          minimumSize: const Size(160, 60),
        ),
        child: Text(
          widget.buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
            color: isHovering ? kcPrimaryColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
