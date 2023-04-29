import 'package:ferry_easy_admin/ferries/ferries_widgets/column_title.dart';
import 'package:ferry_easy_admin/ferries/ferries_widgets/ferry_history_details.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';
import 'ferries_widgets/ferry_name.dart';

class FerryHistory extends StatelessWidget {
  const FerryHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Trip History', style: TextStyle(fontFamily: 'Inter')),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      drawer: const AdminDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome-screen-waves.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SizedBox(
              width: 958.0,
              height: 750.0,
              child: Column(
                children: [
                  Row(children: const [
                    SizedBox(height: 130, width: 50),
                    FerryName(
                        ferryName: 'MV Paz',
                        companyName: 'Cokaliong Lite Ferries')
                  ]),
                  const ColumnTitle(
                      title1: 'DATE',
                      title2: 'ROUTE',
                      title3: 'DEPARTURE',
                      title4: 'ARRIVAL'),
                  const SizedBox(height: 5),
                  const FerryHistoryDetails(
                      date: '12/14/2000',
                      route: 'LAPULAPU TO PIER3',
                      departure: '23:11:11',
                      arrival: '23:11:11'),
                  const SizedBox(height: 5),
                  const FerryHistoryDetails(
                      date: '12/14/2000',
                      route: 'LAPULAPU TO PIER3',
                      departure: '23:11:11',
                      arrival: '23:11:11'),
                  const SizedBox(height: 5),
                  const FerryHistoryDetails(
                      date: '12/14/2000',
                      route: 'LAPULAPU TO PIER3',
                      departure: '23:11:11',
                      arrival: '23:11:11'),
                  const SizedBox(height: 5),
                  const FerryHistoryDetails(
                      date: '12/14/2000',
                      route: 'LAPULAPU TO PIER3',
                      departure: '23:11:11',
                      arrival: '23:11:11'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
