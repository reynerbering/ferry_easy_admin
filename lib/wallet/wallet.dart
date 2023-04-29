import 'package:ferry_easy_admin/wallet/wallet_card.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:ferry_easy_admin/widgets/confirmation_card.dart';
import 'package:ferry_easy_admin/widgets/dialog_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart/colors.dart';
import '../mainbutton.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet', style: TextStyle(fontFamily: 'Inter')),
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
        child: Column(
          children: [
            SizedBox(height: 80.0),
            WalletCard(
              name: 'Fabian Miguel Canizares',
              amount: 20,
              image: CircleAvatar(
                backgroundImage: AssetImage('assets/images/titikmankid.jpg'),
                radius: 50,
              ),
            ),
            SizedBox(height: 20),
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
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        hintText: 'Input Amount',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                MainButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: DialogCard(
                          icon: Icons.question_mark_rounded,
                          text: 'Are you sure you want to credit this amount?',
                          onButtonPressed1: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          onButtonPressed2: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Colors.transparent,
                                content: ConfirmationCard(
                                  icon: Icons.check_circle_outline_rounded,
                                  text: 'Amount has been credited successfully',
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
    );
  }
}
