import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/res/levels.dart';
import 'package:interval_timer/screens/main_screen/cubit/main_cubit.dart';
import 'package:interval_timer/widgets/exercise_box_Item.dart';

class ExercisesBoxes extends StatelessWidget {
  const ExercisesBoxes({
    super.key,
    required this.size,
    required this.repsController,
    required this.activitiController,
    required this.restController,
  });

  final Size size;
  final TextEditingController repsController;
  final TextEditingController activitiController;
  final TextEditingController restController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExerciseBox(
            size: size,
            header: 'Beginers',
            visible: false,
            borderColor: AppColors.mainblue.withOpacity(.4),
            children: Beginers()
                .levels
                .asMap()
                .entries
                .map((e) => ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<MainCubit>(context).changeIndex(0);
                      repsController.text = e.value[2].toString();
                      activitiController.text = e.value[0].toString();
                      restController.text = e.value[1].toString();
                    },
                    child: Text("Level ${e.key + 1}")))
                .toList()),
        ExerciseBox(
            size: size,
            header: 'Primer',
            visible: false,
            borderColor: AppColors.mainblue.withOpacity(.4),
            children: Primer()
                .levels
                .asMap()
                .entries
                .map((e) => ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<MainCubit>(context).changeIndex(0);
                      repsController.text = e.value[2].toString();
                      activitiController.text = e.value[0].toString();
                      restController.text = e.value[1].toString();
                    },
                    child: Text("Level ${e.key + 1}")))
                .toList()),
        ExerciseBox(
          size: size,
          header: 'Pro',
          visible: false,
          borderColor: AppColors.mainRed.withOpacity(.4),
          children: Pro()
              .levels
              .asMap()
              .entries
              .map((e) => ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<MainCubit>(context).changeIndex(0);
                    repsController.text = e.value[2].toString();
                    activitiController.text = e.value[0].toString();
                    restController.text = e.value[1].toString();
                  },
                  child: Text("Level ${e.key + 1}")))
              .toList(),
        ),
        ExerciseBox(
          size: size,
          header: 'Advanced',
          visible: false,
          borderColor: AppColors.mainRed.withOpacity(.4),
          children: Advanced()
              .levels
              .asMap()
              .entries
              .map((e) => ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<MainCubit>(context).changeIndex(0);
                    repsController.text = e.value[2].toString();
                    activitiController.text = e.value[0].toString();
                    restController.text = e.value[1].toString();
                  },
                  child: Text("Level ${e.key + 1}")))
              .toList(),
        ),
        (size.height * 0.15).heightBox
      ],
    );
  }
}
