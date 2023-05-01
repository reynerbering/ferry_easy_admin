import 'package:ferry_easy_admin/announcement/announcement.dart';
import 'package:ferry_easy_admin/ferries/ferries.dart';
import 'package:ferry_easy_admin/loginpage.dart';
import 'package:ferry_easy_admin/users/users.dart';
import 'package:ferry_easy_admin/widgets/dialog_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';

class AdminDrawer extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  AdminDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250,
        child: Drawer(
            child: Column(children: <Widget>[
          const SizedBox(height: 20.0),
          SizedBox(
            width: 198.44,
            height: 49.42,
            child: Image.asset(
                'assets/logos/ferryeasy-logo.png'), // Replace with your image asset path
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Users',
                      style: (TextStyle(
                          fontFamily: 'Inter', fontWeight: FontWeight.w500))),
                  hoverColor: kcHoverColor,
                  onTap: () {
                    Navigator.pushNamed(context, Users.id);
                  },
                ),
                const SizedBox(height: 8.0),
                ListTile(
                  leading: const Icon(Icons.directions_boat),
                  title: const Text('Ferries',
                      style: (TextStyle(
                          fontFamily: 'Inter', fontWeight: FontWeight.w500))),
                  hoverColor: kcHoverColor,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Ferries()),
                    );
                  },
                ),
                const SizedBox(height: 8.0),
                ListTile(
                  leading: const Icon(Icons.announcement),
                  title: const Text('Announcement',
                      style: (TextStyle(
                          fontFamily: 'Inter', fontWeight: FontWeight.w500))),
                  hoverColor: kcHoverColor,
                  onTap: () {
                    Navigator.pushNamed(context, Announcement.id);
                  },
                ),
                const SizedBox(height: 8.0),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout',
                      style: (TextStyle(
                          fontFamily: 'Inter', fontWeight: FontWeight.w500))),
                  hoverColor: kcHoverColor,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: DialogCard(
                          icon: Icons.logout_rounded,
                          text: 'Are you sure you want to logout?',
                          onButtonPressed1: () {
                            Navigator.pop(context);
                            Navigator.pop(context); // Close the dialog
                          },
                          onButtonPressed2: () async {
                            await auth.signOut().then(
                              (value) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, LoginPage.id, (route) => false);
                              },
                            );
                          },
                          buttonText1: 'No, Cancel',
                          buttonText2: 'Yes, Logout',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ])));
  }
}
