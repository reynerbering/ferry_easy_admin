import 'package:ferry_easy_admin/transaction/transactions_admin_list.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';

class TransactionsAdmin extends StatelessWidget {
  static const id = 'transactions_admin';
  const TransactionsAdmin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Transactions', style: TextStyle(fontFamily: 'Inter')),
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
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Transaction Type',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              'Amount',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Date',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'User',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TransactionsAdminList(),
                  const SizedBox(height: 20),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
