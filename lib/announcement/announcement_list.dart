import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ferry_easy_admin/announcement/announcement_widgets/announcement_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart/colors.dart';

class AnnouncementList extends StatelessWidget {
  const AnnouncementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Announcements')
          .orderBy('dateCreated', descending: true)
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
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListView.builder(
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  final dateCreated = data['dateCreated'] as Timestamp;
                  final formattedDate =
                      DateFormat('MM-dd-yyyy').format(dateCreated.toDate());
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: AnnouncementInfo(
                      title: data['title'],
                      datePublished: formattedDate,
                      onTap: () {},
                      status: 'Published',
                      announcementId: data['announcementId'],
                    ),
                  );
                },
              ),
            );
        }
      },
    );
  }
}
