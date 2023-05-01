import 'package:ferry_easy_admin/ferries/ferries_widgets/ferries_card.dart';
import 'package:ferry_easy_admin/ferries/ferry_history.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';
import '../constants.dart/colors.dart';

class Ferries extends StatelessWidget {
  static const id = 'ferries';
  const Ferries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ferries', style: (TextStyle(fontFamily: 'Inter'))),
          centerTitle: true,
          backgroundColor: kcPrimaryColor,
        ),
        drawer: AdminDrawer(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/welcome-screen-waves.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 80.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FerryCard(
                        title: 'MV PAZ',
                        icon: Icons.directions_ferry_rounded,
                        onTap: () {
                          Navigator.pushNamed(context, FerryHistory.id);
                        }),
                    const SizedBox(width: 50),
                    FerryCard(
                        title: 'MV CARMEN 1',
                        icon: Icons.directions_ferry_rounded,
                        onTap: () {}),
                    const SizedBox(width: 50),
                    FerryCard(
                        title: 'MV TOMMY',
                        icon: Icons.directions_ferry_rounded,
                        onTap: () {}),
                    const SizedBox(width: 50),
                    FerryCard(
                        title: 'MV FURANZU',
                        icon: Icons.directions_ferry_rounded,
                        onTap: () {}),
                  ]),
            ),
          ),
        ));
  }
}
