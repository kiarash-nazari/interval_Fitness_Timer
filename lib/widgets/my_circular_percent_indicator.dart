import 'package:flutter/material.dart';
import 'package:interval_timer/res/colors.dart';
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
    return CircularPercentIndicator(
      radius: size.width / 5,
      linearGradient: LinearGradient(
          colors: gradient,
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          tileMode: TileMode.clamp),
      backgroundColor: AppColors.bgCircularPercent,
      lineWidth: 16,
      circularStrokeCap: CircularStrokeCap.round,
      percent: percent,
      center: Text(
        count.toString(),
        style: const TextStyle(
            fontSize: 70, color: Color.fromARGB(255, 253, 253, 253)),
      ),
    );
  }
}
