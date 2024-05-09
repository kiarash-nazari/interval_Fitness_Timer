import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'body_compose_state.dart';

class BodyComposeCubit extends Cubit<BodyComposeState> {
  BodyComposeCubit() : super(BodyComposeLoading());
  double myPercentage = 0;
  double myRemindedInseconds = 0;
  Timer? countDownTimer;

  void updatePercentage({required double percentage}) {
    emit((BodyComposeUpdatePercentage(percentage: percentage)));
    myPercentage = percentage;
    emit(BodyComposeLoading());
  }

  void updateReminedTime({required double level, required double savedSecond}) {
    emit(BodyComposeLoading());
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      var now = DateTime.now().millisecondsSinceEpoch;

      myRemindedInseconds = level - (now.toDouble() - savedSecond) / 1000;
      emit(BodyComposeUpdateReminded(remindedInseconds: myRemindedInseconds));
    });
  }

  void cancelCountDownTimer() {
    print("canceled Timer");
    countDownTimer?.cancel();
  }

  bool fornt = true;
  void toggleBody() {
    fornt = !fornt;
    print("ffffffffffff $fornt");
    emit(TogleBody(front: fornt));
  }
}
