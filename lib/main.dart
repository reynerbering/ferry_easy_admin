import 'package:ferry_easy_admin/admindashboard.dart';
import 'package:ferry_easy_admin/announcement/announcement.dart';
import 'package:ferry_easy_admin/ferries/ferries.dart';
import 'package:ferry_easy_admin/users/users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/users': (context) => const Users(),
          '/ferries': (context) => const Ferries(),
          '/announcement': (context) => const Announcement(),
        },
        debugShowCheckedModeBanner: false,
        title: 'admin',
        home: const AdminDashboard());
  }
}
