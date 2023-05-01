import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ferry_easy_admin/models/announcement_model.dart';

class AnnouncementService {
  static Future<void> create(
      {AnnouncementModel? announcement, required announcementId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('Announcements')
          .doc(announcementId)
          .set(announcement!.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> delete({String? announcementId}) async {
    await FirebaseFirestore.instance
        .collection('Announcements')
        .doc(announcementId)
        .delete();
  }
}
