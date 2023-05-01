import 'package:cloud_firestore/cloud_firestore.dart';

class WalletService {
  // Buy Ticket
  static Future<void> loadWallet(
      {required String uid, required int credit}) async {
    try {
      final userData = FirebaseFirestore.instance.collection('Users').doc(uid);
      // Increment the 'wallet' field with the new credit value
      await userData.update({'wallet': FieldValue.increment(credit)});
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
