import 'package:ferry_easy_admin/constants.dart/colors.dart';
import 'package:ferry_easy_admin/mainbutton.dart';
import 'package:ferry_easy_admin/users/user_widgets/user_info.dart';
import 'package:ferry_easy_admin/wallet/wallet.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:ferry_easy_admin/widgets/confirmation_card.dart';
import 'package:ferry_easy_admin/widgets/dialog_card.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users', style: (TextStyle(fontFamily: 'Inter'))),
          centerTitle: true,
          backgroundColor: kcPrimaryColor,
        ),
        drawer: const AdminDrawer(), // Add AdminDrawer as a drawer
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
                  width: 1068,
                  height: 523,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: const Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            radius: 90,
                            backgroundImage:
                                AssetImage('assets/images/titikmankid.jpg'),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Fabian Miguel Canizares',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 28,
                                color: kcPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const UserInfo(
                            icon: Icons.person_rounded,
                            title: 'fabianmiguel@gmail.com',
                          ),
                          const SizedBox(height: 15),
                          const UserInfo(
                            icon: Icons.calendar_month_rounded,
                            title: 'January 1, 2000',
                          ),
                          const SizedBox(height: 15),
                          const UserInfo(
                            icon: Icons.phone_android_rounded,
                            title: '0323495123',
                          ),
                          const SizedBox(height: 15),
                          const UserInfo(
                            icon: Icons.location_on_rounded,
                            title: 'Cebu City',
                          ),
                          const SizedBox(height: 35),
                          Row(
                            children: const [
                              Icon(
                                Icons.card_membership_rounded,
                                size: 24,
                                color: kcDarkGray,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Identification Cards',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  color: kcDarkGray,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            MainButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Wallet()),
                                );
                              },
                              buttonText: 'Wallet',
                            ),
                            const SizedBox(height: 150),
                            MainButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.transparent,
                                    content: DialogCard(
                                      icon: Icons.question_mark_rounded,
                                      text:
                                          'Are you sure you want to grant discounted tickets to user?',
                                      onButtonPressed1: () {
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      onButtonPressed2: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            backgroundColor: Colors.transparent,
                                            content: ConfirmationCard(
                                              icon: Icons
                                                  .check_circle_outline_rounded,
                                              text:
                                                  'User verified successfully!',
                                              onButtonPressed: () {
                                                Navigator.pop(
                                                    context); // Close the nested dialog
                                                Navigator.pop(
                                                    context); // Close the outer dialog
                                              },
                                              buttonText: 'Got it',
                                            ),
                                          ),
                                        );
                                      },
                                      buttonText1: 'No, Cancel',
                                      buttonText2: 'Yes, Verify',
                                    ),
                                  ),
                                );
                              },
                              buttonText: 'Verify',
                            ),
                          ],
                        ),
                      ),
                    )
                  ]))),
        ));
  }
}
