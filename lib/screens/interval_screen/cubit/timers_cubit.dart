import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timers_state.dart';

class TimersCubit extends Cubit<TimersState> {
  TimersCubit() : super(TimersInitial());
  int cuntableActiviti = 0;
  int? _loops;
  Timer? activitiTimer;
  Timer? restTimer;

  void getLoops(String loops) {
    _loops = int.parse(loops);
  }

  void startActiviti(
      {required String activi, required String reps, required String rest}) {
    activitiTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      double calculatedActiviti = cuntableActiviti / int.parse(activi);
      if (calculatedActiviti <= 1) {
        emit(StartOfActiviti(
            centerDigit: cuntableActiviti,
            calculatedActiviti: calculatedActiviti));
        cuntableActiviti++;
      } else {
        _loops! - 1;
        print(_loops! - 1);
        if (_loops != 0) {
          startRest(rest: rest, activi: activi, reps: reps);
          emit(EndOfActiviti());
          cuntableActiviti = 0;
          activitiTimer?.cancel();
        } else {
          activitiTimer?.cancel();
          cuntableActiviti = 0;
          restTimer?.cancel();
        }
      }
    });
  }

  void startRest(
      {required String activi, required String reps, required String rest}) {
    restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      double calculatedRest = cuntableActiviti / int.parse(rest);
      if (calculatedRest <= 1) {
        emit(
          StartOfRest(
              calculatedRest: calculatedRest, centerDigit: cuntableActiviti),
        );
        cuntableActiviti++;
      } else {
        emit(EndOfRest());
        cuntableActiviti = 0;
        restTimer?.cancel();
        startActiviti(activi: activi, reps: reps, rest: rest);
      }
    });
  }
}
