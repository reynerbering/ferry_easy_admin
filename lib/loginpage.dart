import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'admindashboard.dart';
import 'constants.dart/colors.dart';
// Import the home page

class LoginPage extends StatefulWidget {
  static const id = 'login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Expanded(
        flex: 1,
        child: Container(
          color: kcPrimaryColor, // Background color for the left column
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              Center(
                child: Image.asset(
                  'assets/logos/ferryeasy-wordmark-white.png',
                  width: 434,
                  height: 354.68,
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/images/half-waves.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 150.0),
              const Text(
                'Hello, Administrator!', // Text in the center with size 40 px in color blue
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: kcPrimaryColor,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Enter your administrator credentials to log in', // Text below with size 16px in color gray
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 250.0),
              SizedBox(
                width: 700,
                height: 49,
                child: TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person), // User icon
                    hintText: 'Username', // Placeholder text
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  SizedBox(
                    width: 700,
                    height: 49,
                    child: TextFormField(
                      controller: _password,
                      obscureText: true, // Password field
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock), // Lock icon
                          hintText: 'Password'),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await _auth
                            .signInWithEmailAndPassword(
                                email: _email.text.trim(),
                                password: _password.text.trim())
                            .then((value) {
                          Navigator.pushReplacementNamed(
                              context, AdminDashboard.id);
                        });
                      } catch (error) {
                        var snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            duration: const Duration(milliseconds: 2000),
                            content: Text(
                              error.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kcPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0)), // Button background color
                        minimumSize: const Size(700, 49)),
                    child: const Text(
                      'Login', // Button text
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 130.0),
                  const Text(
                    'FerryEasy © 2022. All rights reserved ', // Text below with size 16px in color gray
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: kcPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
