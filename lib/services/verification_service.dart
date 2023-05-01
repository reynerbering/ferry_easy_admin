import 'package:cloud_firestore/cloud_firestore.dart';

class VerificationService {
  static Future<void> markAsVerified({required String uid}) async {
    try {
      final userData = FirebaseFirestore.instance.collection('Users').doc(uid);
      // Update the 'isVerified' field to true
      await userData.update({'isVerified': true});
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
