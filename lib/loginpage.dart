import 'package:flutter/material.dart';

import 'admindashboard.dart';
import 'constants.dart/colors.dart';
// Import the home page

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              Container(
                width: 700,
                height: 49,
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person), // User icon
                    hintText: 'Username', // Placeholder text
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  Container(
                    width: 700,
                    height: 49,
                    child: const TextField(
                      obscureText: true, // Password field
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock), // Lock icon
                          hintText: 'Password'),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle login button press
                      // Navigate to home page when login button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminDashboard()),
                      );
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
