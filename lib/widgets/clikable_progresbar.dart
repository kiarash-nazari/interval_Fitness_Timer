import 'package:flutter/material.dart';

class MyProgressBar extends StatefulWidget {
  const MyProgressBar({super.key});

  @override
  MyProgressBarState createState() => MyProgressBarState();
}

class MyProgressBarState extends State<MyProgressBar> {
  double _percentage = 0.5; // Initial percentage

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          // Calculate the new percentage based on drag position
          _percentage +=
              details.primaryDelta! / MediaQuery.of(context).size.width;
          _percentage = _percentage.clamp(0.0, 1.0);
        });
      },
      child: Container(
        height: 20,
        width: MediaQuery.of(context).size.width, // Full width
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width *
                  _percentage, // Percentage width
              color: Colors.blue,
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      '${(_percentage * 100).toStringAsFixed(0)}%',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
