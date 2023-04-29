import 'package:flutter/material.dart';

import '../../constants.dart/colors.dart';

class UserInfo extends StatelessWidget {
  final String title;
  final IconData icon;

  UserInfo({
    Key? key, // Use Key? instead of super.key
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align children to start of row
              children: [
                Icon(icon, size: 24, color: kcDarkGray),
                SizedBox(width: 20),
                Text(title,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: kcDarkGray,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
