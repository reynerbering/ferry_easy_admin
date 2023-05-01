import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';

class FEBackButton extends StatelessWidget {
  const FEBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16.0,
      top: 16.0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kcPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: const [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              SizedBox(width: 15),
              Text(
                'Back',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
