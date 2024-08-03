import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:interval_timer/res/colors.dart';

import 'package:another_flushbar/flushbar.dart';

class MyFlushBar {
  Flushbar<dynamic> myFlushBar(String messageText) {
    return Flushbar(
      icon: Icon(MdiIcons.alert, color: Colors.white),
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(10),
      blockBackgroundInteraction: false,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeOutBack,
      messageText: Text(
        messageText,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      duration: const Duration(seconds: 3),
      backgroundGradient: const LinearGradient(colors: AppColors.grRest),
    );
  }
}