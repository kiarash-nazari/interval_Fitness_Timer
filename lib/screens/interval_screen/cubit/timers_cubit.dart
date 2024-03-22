import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timers_state.dart';

class TimersCubit extends Cubit<TimersState> {
  TimersCubit() : super(EndOfProgressing());
  int cuntableActiviti = 1;
  int? _loops;
  int? threeSecondsBeforeStop;
  int? threeSecondsBeforeStart;

  Timer? activitiTimer;
  Timer? restTimer;

  void getLoops(String loops) {
    _loops = int.parse(loops);
  }

  void startActiviti({required String activi, required String rest}) async {
    int activiti = int.parse(activi);
    threeSecondsBeforeStop = activiti - 3;
    activitiTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      double calculatedActiviti = cuntableActiviti / activiti;
      if (calculatedActiviti <= 1) {
        if (cuntableActiviti == threeSecondsBeforeStop) {
          emit(ThreeSecondsBeforeStop());
        }
        emit(StartOfActiviti(
            centerDigit: cuntableActiviti,
            calculatedActiviti: calculatedActiviti));

        cuntableActiviti++;
      } else {
        _loops = _loops! - 1;
        if (_loops != 0) {
          emit(EndOfActiviti());
          startRest(
            rest: rest,
            activi: activi,
          );

          cuntableActiviti = 1;
          activitiTimer?.cancel();
        } else {
          emit(EndOfProgressing());
          activitiTimer?.cancel();
          cuntableActiviti = 1;
          restTimer?.cancel();
        }
      }
    });
  }

  void startRest({required String activi, required String rest}) {
    int activiti = int.parse(rest);
    threeSecondsBeforeStart = activiti - 3;

    restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      double calculatedRest = cuntableActiviti / activiti;
      if (calculatedRest <= 1) {
        if (cuntableActiviti == threeSecondsBeforeStart) {
          emit(ThreeSecondsBeforeStart());
        }
        emit(
          StartOfRest(
              calculatedRest: calculatedRest, centerDigit: cuntableActiviti),
        );
        cuntableActiviti++;
      } else {
        emit(EndOfRest());
        cuntableActiviti = 1;
        restTimer?.cancel();
        startActiviti(activi: activi, rest: rest);
      }
    });
  }

  void pause() {
    if (state is StartOfActiviti) {
      emit(PauseInActiviti());
    }
    if (state is StartOfRest) {
      emit(PauseInRest());
    }
    activitiTimer?.cancel();
    restTimer?.cancel();
  }

  void stop() {
    emit(Stop());

    activitiTimer?.cancel();
    restTimer?.cancel();
    cuntableActiviti = 1;
    emit(EndOfProgressing());
  }
}
