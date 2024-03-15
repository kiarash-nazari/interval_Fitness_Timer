import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/button_styles.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/res/levels.dart';
import 'package:interval_timer/screens/main_screen/cubit/main_cubit.dart';
import 'package:interval_timer/widgets/exercise_box_item.dart';

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
            h: 50,
            borderColor: AppColors.mainblue.withOpacity(.4),
            videoId: 'liJVSwOiiwg',
            children: Beginers()
                .levels
                .asMap()
                .entries
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      style: AppButtonStyles.blueButton,
                      onPressed: () {
                        BlocProvider.of<MainCubit>(context).changeIndex(0);
                        repsController.text = e.value[2].toString();
                        activitiController.text = e.value[0].toString();
                        restController.text = e.value[1].toString();
                      },
                      child: Text("Level ${e.key + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                )
                .toList()),
        ExerciseBox(
            size: size,
            header: 'Primer',
            visible: false,
            h: 50,
            borderColor: AppColors.mainblue.withOpacity(.4),
            videoId: 'LOBLyrErqus',
            children: Primer()
                .levels
                .asMap()
                .entries
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      style: AppButtonStyles.blueButton,
                      onPressed: () {
                        BlocProvider.of<MainCubit>(context).changeIndex(0);
                        repsController.text = e.value[2].toString();
                        activitiController.text = e.value[0].toString();
                        restController.text = e.value[1].toString();
                      },
                      child: Text("Level ${e.key + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                )
                .toList()),
        ExerciseBox(
          size: size,
          header: 'Pro',
          visible: false,
          h: 50,
          borderColor: AppColors.mainRed.withOpacity(.4),
          videoId: 'LOBLyrErqus',
          children: Pro()
              .levels
              .asMap()
              .entries
              .map((e) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      style: AppButtonStyles.redButton,
                      onPressed: () {
                        BlocProvider.of<MainCubit>(context).changeIndex(0);
                        repsController.text = e.value[2].toString();
                        activitiController.text = e.value[0].toString();
                        restController.text = e.value[1].toString();
                      },
                      child: Text("Level ${e.key + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ))
              .toList(),
        ),
        ExerciseBox(
          size: size,
          header: 'Advanced',
          visible: false,
          h: 50,
          borderColor: AppColors.mainRed.withOpacity(.4),
          videoId: 'LOBLyrErqus',
          children: Advanced()
              .levels
              .asMap()
              .entries
              .map((e) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      style: AppButtonStyles.redButton,
                      onPressed: () {
                        BlocProvider.of<MainCubit>(context).changeIndex(0);
                        repsController.text = e.value[2].toString();
                        activitiController.text = e.value[0].toString();
                        restController.text = e.value[1].toString();
                      },
                      child: Text("Level ${e.key + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ))
              .toList(),
        ),
        (size.height * 0.15).heightBox
      ],
    );
  }
}
