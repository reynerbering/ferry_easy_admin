import 'package:ferry_easy_admin/announcement/announcement.dart';
import 'package:ferry_easy_admin/announcement/create_announcement.dart';
import 'package:ferry_easy_admin/dashboard/dashboard.dart';
import 'package:ferry_easy_admin/ferries/ferries.dart';
import 'package:ferry_easy_admin/ferries/ferry_history.dart';
import 'package:ferry_easy_admin/ferries/ferry_passenger_history.dart';
import 'package:ferry_easy_admin/ferry_tracker/ferry_tracker.dart';
import 'package:ferry_easy_admin/loginpage.dart';
import 'package:ferry_easy_admin/transaction/transactions_admin.dart';
import 'package:ferry_easy_admin/transaction/transactions_cashier.dart';
import 'package:ferry_easy_admin/users/user_cashier_view.dart';
import 'package:ferry_easy_admin/users/users_admin_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginPage.id:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case CreateAnnouncement.id:
        return MaterialPageRoute(
          builder: (context) => const CreateAnnouncement(),
        );
      case Announcement.id:
        return MaterialPageRoute(
          builder: (context) => const Announcement(),
        );
      case Ferries.id:
        return MaterialPageRoute(
          builder: (context) => const Ferries(),
        );
      case UsersAdminView.id:
        return MaterialPageRoute(
          builder: (context) => UsersAdminView(),
        );
      case UsersCashierView.id:
        return MaterialPageRoute(
          builder: (context) => UsersCashierView(),
        );
      case FerryPassengerHistory.id:
        return MaterialPageRoute(
          builder: (context) => const FerryPassengerHistory(),
        );
      case FerryHistory.id:
        return MaterialPageRoute(
          builder: (context) => const FerryHistory(),
        );
      case TransactionsAdmin.id:
        return MaterialPageRoute(
          builder: (context) => const TransactionsAdmin(),
        );
      case TransactionsCashier.id:
        return MaterialPageRoute(
          builder: (context) => const TransactionsCashier(),
        );
      case FerryTracker.id:
        return MaterialPageRoute(
          builder: (context) => const FerryTracker(),
        );
      case Dashboard.id:
        return MaterialPageRoute(
          builder: (context) => Dashboard(),
        );

      default:
        return null;
    }
  }
}
