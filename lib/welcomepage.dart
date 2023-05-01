import 'package:ferry_easy_admin/loginpage.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/ferry-easy-wordmark.png',
              width: 434,
              height: 430.68,
            ),
            const Spacer(),
            Image.asset(
              'assets/images/welcome-screen-waves.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
