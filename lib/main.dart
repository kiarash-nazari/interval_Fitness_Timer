import 'package:flutter/material.dart';
import 'package:interval_timer/screens/interval_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IntervalScreen()
    );
  }
}
