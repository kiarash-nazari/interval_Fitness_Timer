import 'package:flutter/material.dart';
import 'package:interval_timer/res/colors.dart';

class MyProgressBar extends StatefulWidget {
  const MyProgressBar({super.key});

  @override
  MyProgressBarState createState() => MyProgressBarState();
}

class MyProgressBarState extends State<MyProgressBar> {
  double _percentage = 0.5; // Initial percentage

  @override
  Widget build(BuildContext context) {
    var stops = [0.3, 0.2, .3, .4, .5, .6];
    List<double> myStops() {
      if (_percentage == 0 || _percentage <= .2) {
        stops = [0.1, 1, .3, .4, .5, .6];
        return stops;
      } else if (_percentage == 0.2 || _percentage <= .35) {
        // Set the gradient to blue when progress bar is collapsed
        return stops = [0.1, .8 - _percentage, 1, .0, .0, .0];
      } else if (_percentage == 0.35 || _percentage <= .45) {
        // Set the gradient to blue when progress bar is collapsed
        return stops = [0.1, .8 - _percentage, .8, 1, .0, .0];
      } else if (_percentage == 0.45 || _percentage <= .55) {
        // Set the gradient to blue when progress bar is collapsed
        return stops = [0.1, .8 - _percentage, 1 - _percentage, .8, 1, .0];
      } else if (_percentage == 0.55 || _percentage <= 1) {
        // Set the gradient to blue when progress bar is collapsed
        return stops = [0.1, .3, .7, .8, .9, 1];
      } else {
        return [0.3, 0.2, .3, .4, .5, .6];
      }
    }

    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        _updatePercentage(details.primaryDelta!);
      },
      child: InkWell(
        onTapDown: (TapDownDetails details) {
          final double tapPosition = details.localPosition.dx;
          _updatePercentageFromTap(tapPosition, context);
        },
        onTapUp: (_) {
          // Handle tap up if needed
        },
        onTapCancel: () {
          // Handle tap cancellation if needed
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bgCircularPercent,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 20,
          width: 280, // Full width
          child: Stack(
            children: [
              Container(
                height: 20,
                width: 300 * _percentage, // Percentage width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: AppColors.grMuclesTrain,
                    stops: myStops(),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        '${(_percentage * 100).toStringAsFixed(0)}%',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updatePercentage(double delta) {
    setState(() {
      // Calculate the new percentage based on drag position
      _percentage += delta / 280;
      _percentage = _percentage.clamp(0.0, 1.0);
    });
  }

  void _updatePercentageFromTap(double tapPosition, BuildContext context) {
    setState(() {
      // Calculate the new percentage based on tap position
      _percentage = tapPosition / 280;
      _percentage = _percentage.clamp(0.0, 1.0);
    });
  }
}
