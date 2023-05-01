// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementModel {
  final String title;
  final DateTime dateCreated;
  final String message;
  final String announcementId;
  AnnouncementModel({
    required this.title,
    required this.dateCreated,
    required this.message,
    required this.announcementId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'dateCreated': Timestamp.fromDate(dateCreated),
      'message': message,
      'announcementId': announcementId,
    };
  }

  factory AnnouncementModel.fromMap(Map<String, dynamic> map) {
    return AnnouncementModel(
      title: map['title'] as String,
      dateCreated: (map['dateCreated'] as Timestamp).toDate(),
      message: map['message'] as String,
      announcementId: map['annoucementId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnnouncementModel.fromJson(String source) =>
      AnnouncementModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
