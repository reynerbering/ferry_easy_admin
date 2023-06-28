import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ferry_easy_admin/models/user_model.dart';
import 'package:ferry_easy_admin/users/user_profile_cashier_view.dart';
import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';
import '../widgets/cashier_drawer.dart';

class UsersCashierView extends StatelessWidget {
  static const id = 'users_cashier_view';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController queryController = TextEditingController();

  UsersCashierView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users', style: TextStyle(fontFamily: 'Inter')),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      drawer: CashierDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome-screen-waves.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              SizedBox(
                width: 1000,
                child: Row(
                  children: <Widget>[
                    Expanded(
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
                          controller: queryController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            hintText: 'Search User',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final QuerySnapshot result = await _firestore
                                .collection('Users')
                                .where('email',
                                    isEqualTo: queryController.text.toString())
                                .limit(1)
                                .get();

                            if (result.docs.isNotEmpty && context.mounted) {
                              final rawData = result.docs[0].data();
                              final docReference = result.docs[0].reference;
                              final userData = UserModel.fromMap(
                                  rawData as Map<String, dynamic>,
                                  docReference);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserProfileCashierView(
                                    userData: userData,
                                  ),
                                ),
                              );
                            } else {
                              throw Exception("User not found!");
                            }
                          } catch (error) {
                            var snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                duration: const Duration(milliseconds: 2000),
                                content: Text(
                                  error.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kcPrimaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        child: const Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
