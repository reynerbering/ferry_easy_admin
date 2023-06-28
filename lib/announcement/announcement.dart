import 'package:ferry_easy_admin/announcement/create_announcement.dart';
import 'package:ferry_easy_admin/mainbutton.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';
import 'announcement_list.dart';

class Announcement extends StatelessWidget {
  static const id = 'announcement';
  const Announcement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Announcement', style: TextStyle(fontFamily: 'Inter')),
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
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SizedBox(
              width: 958.0,
              height: 750.0,
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 30),
                  Row(
                    children: const [
                      SizedBox(width: 90),
                      Text('Title',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: kcDarkGray)),
                      SizedBox(width: 325),
                      Text('Date Published',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: kcDarkGray)),
                      SizedBox(width: 155),
                      Text('Status',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: kcDarkGray)),
                      SizedBox(width: 70),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const AnnouncementList(),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: 900,
                    child: MainButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CreateAnnouncement.id);
                        },
                        buttonText: 'Create Announcement'),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
