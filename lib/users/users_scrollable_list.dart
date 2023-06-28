import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ferry_easy_admin/users/users_scrollable_info.dart';
import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .orderBy('lastName', descending: false)
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
                return Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: UsersInfo(
                    city: data['address']['city'],
                    email: data['email'],
                    firstName: data['firstName'],
                    lastName: data['lastName'],
                  ),
                );
              },
            );
        }
      },
    );
  }
}
