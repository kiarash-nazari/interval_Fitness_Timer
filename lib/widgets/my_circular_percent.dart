import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/interval_screen/cubit/timers_cubit.dart';
import 'package:interval_timer/widgets/my_circular_percent_indicator.dart';

class MyCircularPercent extends StatelessWidget {
  const MyCircularPercent({
    super.key,
    required this.size,
  });

  final Size size;
  // final int count;

  @override
  Widget build(BuildContext context) {
    double? percentWhenActivitisStop = 0;
    double? percentWhenRestsStop = 0;
    num? centerDigitWhenActivitisStop = 0;
    num? centerDigitWhenRestsStop = 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocConsumer<TimersCubit, TimersState>(
          listener: (context, state) {
            if (state is StartOfActiviti) {
              percentWhenActivitisStop = state.calculatedActiviti;
              centerDigitWhenActivitisStop = state.centerDigit;
            }
            if (state is EndOfRest) {
              percentWhenRestsStop = 0;
              centerDigitWhenRestsStop = 0;
            }
            if (state is EndOfProgressing ||
                state is EndOfActiviti ||
                state is StartOfRest) {
              percentWhenActivitisStop = 0;
              centerDigitWhenActivitisStop = 0;
              percentWhenRestsStop =
                  state is StartOfRest ? state.calculatedRest : 0;
              centerDigitWhenRestsStop =
                  state is StartOfRest ? state.centerDigit : 0;
            }
          },
          builder: (context, state) {
            return MyCircularPercentIndicator(
                size: size,
                gradient: AppColors.grActiviti,
                percent: percentWhenActivitisStop!,
                count: centerDigitWhenActivitisStop!);
          },
        ),
        BlocBuilder<TimersCubit, TimersState>(
          builder: (context, state) {
            return MyCircularPercentIndicator(
                size: size,
                gradient: AppColors.grRest,
                percent: percentWhenRestsStop!,
                count: centerDigitWhenRestsStop!);
          },
        ),
      ],
    );
  }
}
