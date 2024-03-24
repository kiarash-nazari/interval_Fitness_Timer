import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyCircularPercentIndicator extends StatelessWidget {
  const MyCircularPercentIndicator({
    super.key,
    required this.size,
    required this.gradient,
    required this.percent,
    required this.count,
  });

  final Size size;
  final List<Color> gradient;
  final double percent;
  final num count;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= constraints.maxHeight) {}
        return CircularPercentIndicator(
          radius: size.height / 10,
          linearGradient: LinearGradient(
              colors: gradient,
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              tileMode: TileMode.clamp),
          backgroundColor: const Color.fromARGB(170, 255, 255, 255),
          lineWidth: size.height / 70,
          circularStrokeCap: CircularStrokeCap.round,
          percent: percent,
          center: Text(
            count.toString(),
            style: const TextStyle(
                fontSize: 70, color: Color.fromARGB(255, 253, 253, 253)),
          ),
        );
      },
    );
  }
}
