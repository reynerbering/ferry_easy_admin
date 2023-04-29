import 'package:ferry_easy_admin/announcement/announcement_widgets/announcement_info.dart';
import 'package:ferry_easy_admin/announcement/create_announcement.dart';
import 'package:ferry_easy_admin/mainbutton.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';

class Announcement extends StatelessWidget {
  const Announcement({Key? key});

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
                child: Column(children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(width: 90),
                      Text('Title',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: kcDarkGray)),
                      SizedBox(width: 295),
                      Text('Date Published',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: kcDarkGray)),
                      SizedBox(width: 125),
                      Text('Status',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: kcDarkGray)),
                      SizedBox(width: 70),
                    ],
                  ),
                  SizedBox(height: 20),
                  AnnouncementInfo(
                      title: 'Bagyong Odette Trip Advisory',
                      datePublished: 'December 16 2000',
                      status: 'Published',
                      onTap: () {}),
                  SizedBox(height: 20),
                  AnnouncementInfo(
                      title: 'Fare Hike Advisory',
                      datePublished: 'December 16 2000',
                      status: 'Published',
                      onTap: () {}),
                  SizedBox(height: 20),
                  AnnouncementInfo(
                      title: 'No Operations on City Fiesta',
                      datePublished: 'December 16 2000',
                      status: 'Published',
                      onTap: () {}),
                  SizedBox(height: 20),
                  AnnouncementInfo(
                      title: 'Bagyong Odette',
                      datePublished: 'December 16 2000',
                      status: 'Published',
                      onTap: () {}),
                  SizedBox(height: 20),
                  AnnouncementInfo(
                      title: 'Bagyong Odette',
                      datePublished: 'December 16 2000',
                      status: 'Published',
                      onTap: () {}),
                  SizedBox(height: 20),
                  AnnouncementInfo(
                      title: 'Bagyong Odette',
                      datePublished: 'December 16 2000',
                      status: 'Published',
                      onTap: () {}),
                  SizedBox(height: 20),
                  AnnouncementInfo(
                      title: 'Bagyong Odette',
                      datePublished: 'December 16 2000',
                      status: 'Published',
                      onTap: () {}),
                  SizedBox(height: 20),
                  AnnouncementInfo(
                      title: 'Bagyong Odette',
                      datePublished: 'December 16 2000',
                      status: 'Published',
                      onTap: () {}),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: 850,
                    child: MainButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CreateAnnouncement()),
                          );
                        },
                        buttonText: 'Create Announcement'),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
