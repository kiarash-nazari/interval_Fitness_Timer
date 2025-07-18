import 'package:flutter/material.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/res/input_decoration.dart';

class Inputs extends StatelessWidget {
  const Inputs({
    super.key,
    required this.size,
    required this.radius,
    required this.focusedBorderColor,
    required this.lableTextColor,
    required this.prefixIconColor,
    required this.helperText,
    required this.lableText,
    required this.suffixText,
    required this.hintText,
    required this.textColor,
    required this.icon,
    required this.controller,
  });

  final Size size;
  final double radius;
  final Color focusedBorderColor;
  final Color lableTextColor;
  final Color prefixIconColor;
  final Color textColor;
  final String helperText; //"How many reps"
  final String lableText; //"-> Loop"
  final String suffixText; //"-> rep"
  final String hintText; //"loop"
  final IconData icon; //"loop"
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: SizedBox(
        width: 150,
        height: 100,
        child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: TextStyle(color: textColor),
            decoration: myinputDecorations(
              radius: radius,
              enabledBorderColor: Colors.grey,
              focusedBorderColor: focusedBorderColor,
              helperText: helperText,
              helperTextColor: AppColors.helperTextColor,
              lableText: lableText,
              lableTextColor: lableTextColor,
              prefixIcon: icon,
              prefixIconColor: prefixIconColor,
              suffixText: suffixText,
              suffixTextColor: AppColors.suffixTextColor,
              hintText: hintText,
            )),
      ),
    );
  }
}
