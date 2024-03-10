import 'package:flutter/material.dart';
import 'package:interval_timer/res/colors.dart';

class AppButtonStyles {
  AppButtonStyles._();

  static ButtonStyle blueButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppColors.mainblue.withOpacity(.7),
    ),
    maximumSize: MaterialStateProperty.all(
      const Size(200, 50),
    ),
    minimumSize: MaterialStateProperty.all(
      const Size(200, 50),
    ),
  );

  static ButtonStyle redButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppColors.mainRed.withOpacity(.7),
    ),
    maximumSize: MaterialStateProperty.all(
      const Size(200, 50),
    ),
    minimumSize: MaterialStateProperty.all(
      const Size(200, 50),
    ),
  );
}
