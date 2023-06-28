import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';
import '../widgets/admin_drawer.dart';
import 'ferry_easy_ship_details.dart';

class FerryTracker extends StatelessWidget {
  static const id = 'ferry_tracker';
  const FerryTracker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Active Ferries', style: TextStyle(fontFamily: 'Inter')),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      drawer: AdminDrawer(),
      backgroundColor: Colors.transparent,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: const [
                  FEShipDetails(
                    shipName: 'Princesa',
                    minutes: 24,
                  ),
                  FEDivider(),
                  FEShipDetails(
                    shipName: 'Carmen Uno',
                    minutes: 18,
                  ),
                  FEDivider(),
                  FEShipDetails(
                    shipName: 'Tommy 1',
                    minutes: 30,
                  ),
                  FEDivider(),
                  FEShipDetails(
                    shipName: 'Tommy 2',
                    minutes: 90,
                  ),
                  FEDivider(),
                  FEShipDetails(
                    shipName: 'Megg',
                    minutes: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
