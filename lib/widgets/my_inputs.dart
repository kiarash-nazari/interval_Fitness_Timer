import 'package:flutter/material.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/widgets/inputs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyInputs extends StatelessWidget {
  const MyInputs({
    super.key,
    required this.size,
    required TextEditingController repsController,
    required TextEditingController activitiController,
    required TextEditingController restController,
  })  : _repsController = repsController,
        _activitiController = activitiController,
        _restController = restController;

  final Size size;
  final TextEditingController _repsController;
  final TextEditingController _activitiController;
  final TextEditingController _restController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Inputs(
          size: size,
          radius: 30,
          focusedBorderColor: AppColors.mainblue,
          lableTextColor: AppColors.mainblue,
          prefixIconColor: AppColors.mainblue,
          helperText: "How many reps",
          lableText: "-> Loop",
          suffixText: "rep",
          hintText: "loop",
          textColor: AppColors.mainblue,
          icon: MdiIcons.autorenew,
          controller: _repsController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Inputs(
              size: size,
              radius: 5,
              focusedBorderColor: AppColors.mainRed,
              lableTextColor: AppColors.mainRed,
              prefixIconColor: AppColors.mainRed,
              helperText: "Activiti in second",
              lableText: "Activiti",
              suffixText: "sec",
              hintText: "activiti",
              textColor: AppColors.mainRed,
              icon: MdiIcons.fire,
              controller: _activitiController,
            ),
            Inputs(
              size: size,
              radius: 5,
              focusedBorderColor: AppColors.mainblue,
              lableTextColor: AppColors.mainblue,
              prefixIconColor: AppColors.mainblue,
              helperText: "Rest in second",
              lableText: "Rest",
              suffixText: "sec",
              hintText: "rest",
              textColor: AppColors.mainblue,
              icon: MdiIcons.weatherWindy,
              controller: _restController,
            ),
          ],
        )
      ],
    );
  }
}
