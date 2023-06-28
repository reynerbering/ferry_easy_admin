import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:ferry_easy_admin/widgets/cashier_drawer.dart';
import 'package:flutter/material.dart';
import 'constants.dart/colors.dart';
import 'models/user_model.dart';

class AdminDashboard extends StatefulWidget {
  final UserModel user;
  static const id = 'admin_dashboard';
  const AdminDashboard({super.key, required this.user});

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
        title: const Text('Welcome!', style: (TextStyle(fontFamily: 'Inter'))),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      drawer:
          widget.user.accountType == 'Admin' ? AdminDrawer() : CashierDrawer(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(25),
          alignment: Alignment.center,
          width: 700,
          height: 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text(
            'CLICK ON THE DRAWER TO GET STARTED',
            style: TextStyle(
                color: kcPrimaryColor,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
