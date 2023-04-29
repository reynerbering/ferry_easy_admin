import 'package:ferry_easy_admin/ferries/ferries_widgets/column_title.dart';
import 'package:ferry_easy_admin/ferries/ferries_widgets/ferry_history_outline.dart';
import 'package:ferry_easy_admin/ferries/ferries_widgets/ferry_passenger_details.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';
import '../constants.dart/colors.dart';
import 'ferries_widgets/ferry_name.dart';

class FerryPassengerHistory extends StatelessWidget {
  const FerryPassengerHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Passenger Manifest',
              style: TextStyle(fontFamily: 'Inter')),
          centerTitle: true,
          backgroundColor: kcPrimaryColor,
        ),
        drawer: const AdminDrawer(),
        body: Container(
          decoration: const BoxDecoration(
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
                    child: Column(children: [
                      Row(children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(51, 35, 20, 10),
                          child: FerryName(
                              ferryName: 'MV Paz',
                              companyName: 'Cokaliong Lite Ferries'),
                        )
                      ]),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: FerryHistoryOutline(
                            date: '12/14/2000',
                            route: 'LAPULAPU-PIER3',
                            departure: '23:11:00',
                            arrival: '23:11:00'),
                      ),
                      const ColumnTitle(
                          title1: 'LAST NAME',
                          title2: 'FIRST NAME',
                          title3: 'MIDDLE INITIAL',
                          title4: 'ADDRESS'),
                      const SizedBox(height: 5),
                      const FerryPassengerDetails(
                          lastName: 'BERING',
                          firstName: 'Reyner Paul',
                          middleInitial: 'U',
                          address: 'Lapu-Lapu City'),
                      const SizedBox(height: 5),
                      const FerryPassengerDetails(
                          lastName: 'BERING',
                          firstName: 'Reyner Paul',
                          middleInitial: 'U',
                          address: 'Lapu-Lapu City'),
                      const SizedBox(height: 5),
                      const FerryPassengerDetails(
                          lastName: 'BERING',
                          firstName: 'Reyner Paul',
                          middleInitial: 'U',
                          address: 'Lapu-Lapu City'),
                      const SizedBox(height: 5),
                    ]))),
          ),
        ));
  }
}
