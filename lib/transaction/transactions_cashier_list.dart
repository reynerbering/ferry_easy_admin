import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ferry_easy_admin/transaction/transactions_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart/colors.dart';

class TransactionsCashierList extends StatelessWidget {
  const TransactionsCashierList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Transactions')
          .where('transactionType', isEqualTo: 'Cashier Load')
          // .orderBy('dateIssued', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(
                color: kcPrimaryColor,
              ),
            );
          default:
            return ListView.builder(
              controller: ScrollController(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;

                final dateCreated = data['dateIssued'] as Timestamp;
                final formattedDate =
                    DateFormat('MM-dd-yyyy').format(dateCreated.toDate());
                return Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: TransactionsInfo(
                    transactionType: data['transactionType'],
                    amount: data['amount'],
                    date: formattedDate,
                    user: data['user'],
                  ),
                );
              },
            );
        }
      },
    );
  }
}
