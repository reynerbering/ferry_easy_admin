import 'package:ferry_easy_admin/mainbutton.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:ferry_easy_admin/widgets/confirmation_card.dart';
import 'package:ferry_easy_admin/widgets/dialog_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';

class CreateAnnouncement extends StatelessWidget {
  const CreateAnnouncement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: const TextField(
                      decoration: InputDecoration(
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
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: kcPrimaryColor.withOpacity(0.5),
                        width: 1.0,
                      ),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          border: InputBorder.none,
                          hintText: 'Date',
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
                    child: const TextField(
                      decoration: InputDecoration(
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
                  SizedBox(height: 35.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MainButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        buttonText: 'Cancel',
                      ),
                      SizedBox(width: 20.0),
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
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      content: ConfirmationCard(
                                        icon:
                                            Icons.check_circle_outline_rounded,
                                        text:
                                            'The announcement has been published',
                                        onButtonPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        buttonText: 'Got it',
                                      ),
                                    ),
                                  );
                                },
                                buttonText1: 'No, Cancel',
                                buttonText2: 'Yes, Publish',
                              ),
                            ),
                          );
                        },
                        buttonText: 'Publish',
                      ),
                      SizedBox(width: 60),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}
