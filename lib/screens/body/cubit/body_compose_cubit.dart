import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'body_compose_state.dart';

class BodyComposeCubit extends Cubit<double> {
  BodyComposeCubit() : super(0.5);
  double myPercentage = 0;
  double myRemindedInseconds = 0;

  void updatePercentage({required double percentage}) {
    emit((percentage));
    myPercentage = percentage;
  }

  double updateReminedTime(
      {required double level, required double savedSecond}) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      var now = DateTime.now().millisecondsSinceEpoch;

      myRemindedInseconds = level - (now.toDouble() - savedSecond) / 1000;
      emit(myRemindedInseconds);
    });
    return myRemindedInseconds;
  }
}
