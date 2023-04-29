import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';
import 'constants.dart/colors.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, Administrator!',
            style: (TextStyle(fontFamily: 'Inter'))),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      drawer: const AdminDrawer(),
    );
  }
}
