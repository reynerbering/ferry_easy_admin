import 'dart:async';

import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';

class FakeCountdownTimer extends StatefulWidget {
  final int minutes;

  const FakeCountdownTimer({Key? key, required this.minutes}) : super(key: key);

  @override
  FakeCountdownTimerState createState() => FakeCountdownTimerState();
}

class FakeCountdownTimerState extends State<FakeCountdownTimer> {
  int _countdownSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _countdownSeconds = widget.minutes * 60; // convert minutes to seconds
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownSeconds > 0) {
          _countdownSeconds--;
        } else {
          timer.cancel(); // Stop the timer when the countdown is done
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String minutes = (_countdownSeconds ~/ 60).toString().padLeft(2, '0');
    String seconds = (_countdownSeconds % 60).toString().padLeft(2, '0');
    return Text(
      '$minutes:$seconds',
      style: const TextStyle(
        color: kcPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
