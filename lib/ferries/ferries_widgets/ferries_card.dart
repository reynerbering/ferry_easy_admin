import 'package:flutter/material.dart';

import '../../constants.dart/colors.dart';

class FerryCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const FerryCard({required this.title, required this.icon, this.onTap});

  @override
  _FerryCardState createState() => _FerryCardState();
}

class _FerryCardState extends State<FerryCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovering = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovering = false;
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: _isHovering ? kcHoverColor : null,
          elevation: 10,
          shadowColor: Colors.black.withOpacity(0.3),
          child: Container(
            width: 320,
            height: 207,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  widget.icon,
                  size: 113,
                  color: kcPrimaryColor,
                ),
                SizedBox(width: 20),
                Text(widget.title,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kcPrimaryColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
