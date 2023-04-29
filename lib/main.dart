import 'package:ferry_easy_admin/admindashboard.dart';
import 'package:ferry_easy_admin/announcement/announcement.dart';
import 'package:ferry_easy_admin/ferries/ferries.dart';
import 'package:ferry_easy_admin/users/users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/users': (context) => Users(),
          '/ferries': (context) => Ferries(),
          '/announcement': (context) => Announcement(),
        },
        debugShowCheckedModeBanner: false,
        title: 'admin',
        home: AdminDashboard());
  }
}
