import 'package:ferry_easy_admin/constants.dart/colors.dart';
import 'package:ferry_easy_admin/mainbutton.dart';
import 'package:ferry_easy_admin/services/verification_service.dart';
import 'package:ferry_easy_admin/users/user_widgets/user_info.dart';
import 'package:ferry_easy_admin/users/users_admin_view.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:ferry_easy_admin/widgets/dialog_card.dart';
import 'package:ferry_easy_admin/widgets/id_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/user_model.dart';
import '../widgets/avatar.dart';
import '../widgets/back_button.dart';

class UserProfileAdminView extends StatelessWidget {
  static const id = 'user_profile_admin_view';
  final UserModel userData;

  const UserProfileAdminView({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: (TextStyle(
            fontFamily: 'Inter',
          )),
        ),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      drawer: AdminDrawer(), // Add AdminDrawer as a drawer
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome-screen-waves.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.75,
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: AvatarImage(
                              radius: 90,
                              uid: userData.uid,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${userData.firstName} ${userData.lastName}',
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 28,
                                      color: kcPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                userData.isVerified
                                    ? const Icon(
                                        Icons.verified,
                                        color: kcPrimaryColor,
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            const SizedBox(height: 25),
                            UserInfo(
                              icon: Icons.person_rounded,
                              title: userData.email,
                            ),
                            const SizedBox(height: 15),
                            UserInfo(
                              icon: Icons.calendar_month_rounded,
                              title: DateFormat('MM-dd-yyyy')
                                  .format(userData.birthDate),
                            ),
                            const SizedBox(height: 15),
                            UserInfo(
                              icon: Icons.phone_android_rounded,
                              title: userData.contactNum,
                            ),
                            const SizedBox(height: 15),
                            UserInfo(
                              icon: Icons.location_on_rounded,
                              title: userData.address['city'],
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
                                  'Identification Cards :',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 18,
                                    color: kcDarkGray,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Flexible(
                              child: IdContainer(uid: userData.uid),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              const SizedBox(height: 50),
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
                                          VerificationService.markAsVerified(
                                              uid: userData.uid);
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              UsersAdminView.id,
                                              (route) => false);
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          const FEBackButton(),
        ],
      ),
    );
  }
}
