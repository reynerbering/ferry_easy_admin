import 'package:ferry_easy_admin/mainbutton.dart';
import 'package:ferry_easy_admin/services/announcement_service.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:ferry_easy_admin/widgets/dialog_card.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../constants.dart/colors.dart';
import '../models/announcement_model.dart';
import 'announcement.dart';

class CreateAnnouncement extends StatelessWidget {
  static const id = 'create_announcement';
  const CreateAnnouncement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController message = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Create Announcement',
            style: TextStyle(fontFamily: 'Inter'),
          ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 850.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: kcPrimaryColor.withOpacity(0.5),
                        width: 1.0,
                      ),
                    ),
                    child: TextFormField(
                      controller: title,
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          border: InputBorder.none,
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: kcPrimaryColor)),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: 850.0,
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: kcPrimaryColor.withOpacity(0.5),
                        width: 1.0,
                      ),
                    ),
                    child: TextFormField(
                      controller: message,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: InputBorder.none,
                        hintText: 'Description',
                        hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: kcPrimaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MainButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        buttonText: 'Cancel',
                      ),
                      const SizedBox(width: 20.0),
                      MainButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.transparent,
                              content: DialogCard(
                                icon: Icons.warning_rounded,
                                text:
                                    'Are you sure you want to publish this announcement?',
                                onButtonPressed1: () {
                                  Navigator.pop(context);
                                },
                                onButtonPressed2: () {
                                  var announcementId =
                                      const Uuid().v4().toString();
                                  AnnouncementModel announcement =
                                      AnnouncementModel(
                                    title: title.text.trim(),
                                    message: message.text.trim(),
                                    dateCreated: DateTime.now(),
                                    announcementId: announcementId,
                                  );
                                  AnnouncementService.create(
                                      announcementId: announcementId,
                                      announcement: announcement);
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Announcement.id, (route) => false);
                                },
                                buttonText1: 'No, Cancel',
                                buttonText2: 'Yes, Publish',
                              ),
                            ),
                          );
                        },
                        buttonText: 'Publish',
                      ),
                      const SizedBox(width: 60),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}
