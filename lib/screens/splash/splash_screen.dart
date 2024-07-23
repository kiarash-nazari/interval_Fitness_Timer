import 'package:flutter/material.dart';
import 'package:interval_timer/main.dart';
import 'package:interval_timer/screens/gym_program/interface/program_interface.dart';
import 'package:interval_timer/screens/main_screen/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainWindow()));
    });
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
