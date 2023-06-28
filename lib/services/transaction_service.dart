import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/transaction_model.dart';

class TransactionService {
  static Future<void> payment({TransactionModel? transaction}) async {
    try {
      await FirebaseFirestore.instance
          .collection('Transactions')
          .doc(transaction!.transactionId)
          .set(transaction.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
