import 'package:ferry_easy_admin/admindashboard.dart';
import 'package:ferry_easy_admin/announcement/announcement.dart';
import 'package:ferry_easy_admin/announcement/create_announcement.dart';
import 'package:ferry_easy_admin/ferries/ferries.dart';
import 'package:ferry_easy_admin/ferries/ferry_history.dart';
import 'package:ferry_easy_admin/ferries/ferry_passenger_history.dart';
import 'package:ferry_easy_admin/loginpage.dart';
import 'package:ferry_easy_admin/users/users.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AdminDashboard.id:
        return MaterialPageRoute(
          settings: const RouteSettings(name: 'home'),
          builder: (context) => const AdminDashboard(),
        );

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
      case Users.id:
        return MaterialPageRoute(
          builder: (context) => Users(),
        );

      case FerryPassengerHistory.id:
        return MaterialPageRoute(
          builder: (context) => const FerryPassengerHistory(),
        );
      case FerryHistory.id:
        return MaterialPageRoute(
          builder: (context) => const FerryHistory(),
        );

      default:
        return null;
    }
  }
}
