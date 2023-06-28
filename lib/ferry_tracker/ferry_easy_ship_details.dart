import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart/colors.dart';
import 'fake_timer.dart';

class FEShipDetails extends StatelessWidget {
  final String shipName;
  final int minutes;

  const FEShipDetails({
    super.key,
    required this.shipName,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'MV $shipName',
                style: const TextStyle(
                  color: kcPrimaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: kcPrimaryColor,
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'To: Cebu City',
                    style: TextStyle(
                      color: kcPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'From: Lapu-lapu City',
                    style: TextStyle(
                      color: kcPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffe5e5e5),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: FakeCountdownTimer(
                        minutes: minutes,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FEDivider extends StatelessWidget {
  const FEDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: kcPrimaryColor,
      height: 15,
    );
  }
}
