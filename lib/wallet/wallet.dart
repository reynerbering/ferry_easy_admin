import 'package:ferry_easy_admin/services/wallet_service.dart';
import 'package:ferry_easy_admin/wallet/wallet_card.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:ferry_easy_admin/widgets/avatar.dart';
import 'package:ferry_easy_admin/widgets/back_button.dart';
import 'package:ferry_easy_admin/widgets/dialog_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart/colors.dart';
import '../mainbutton.dart';
import '../models/user_model.dart';
import '../users/users.dart';

class Wallet extends StatelessWidget {
  static const id = 'wallet';
  final UserModel userData;
  TextEditingController walletLoad = TextEditingController();
  Wallet({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet', style: TextStyle(fontFamily: 'Inter')),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      drawer: AdminDrawer(),
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
            child: Column(
              children: [
                const SizedBox(height: 80.0),
                WalletCard(
                  name: '${userData.firstName} ${userData.lastName}',
                  amount: userData.wallet,
                  isVerified: userData.isVerified,
                  child: AvatarImage(uid: userData.uid),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 400,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: walletLoad,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            hintText: 'Input Amount',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    MainButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.transparent,
                            content: DialogCard(
                              icon: Icons.question_mark_rounded,
                              text:
                                  'Are you sure you want to credit this amount?',
                              onButtonPressed1: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              onButtonPressed2: () {
                                WalletService.loadWallet(
                                    uid: userData.uid,
                                    credit: int.parse(walletLoad.text));
                                Navigator.pushNamedAndRemoveUntil(
                                    context, Users.id, (route) => false);
                              },
                              buttonText1: 'No, Cancel',
                              buttonText2: 'Yes, Proceed',
                            ),
                          ),
                        );
                      },
                      buttonText: 'Load',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const FEBackButton(),
        ],
      ),
    );
  }
}
