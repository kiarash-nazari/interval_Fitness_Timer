import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/screens/body/cubit/body_compose_cubit.dart';
import 'package:interval_timer/utils/shared_perfrences_manager.dart';
import 'package:interval_timer/widgets/clikable_progresbar.dart';

class NextButtonRow extends StatelessWidget {
  final List<String> primeriChoosen;
  final SharedPreferencesManager sharedPreferencesManager;
  final Map<String, dynamic> frontPartHowHard;
  final Map<String, dynamic> backPartHowHard;
  final Map<String, String> frontBodyColor;
  final Map<String, String> backBodyColor;
  final Function() backMakeIt;
  final Function() makeIt;

  const NextButtonRow({
    Key? key,
    required this.primeriChoosen,
    required this.sharedPreferencesManager,
    required this.frontPartHowHard,
    required this.backPartHowHard,
    required this.frontBodyColor,
    required this.backBodyColor,
    required this.backMakeIt,
    required this.makeIt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton.icon(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber)),
          onPressed: () {
            if (primeriChoosen.isEmpty) {
              return;
            }
            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return AlertDialog.adaptive(
                  title: const Text('How did You Train these Mucles?'),
                  content: MyProgressBar(
                    percentage: 0,
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Done'),
                      onPressed: () {
                        double howHard =
                            context.read<BodyComposeCubit>().myPercentage;
                        double backHowHardDuble =
                            context.read<BodyComposeCubit>().myPercentage;
                        double now =
                            DateTime.now().millisecondsSinceEpoch.toDouble();

                        for (var entry in frontBodyColor.entries) {
                          if (primeriChoosen.contains(entry.key)) {
                            List ss = [];
                            ss.add(entry.key);
                            for (var parts in ss) {
                              frontBodyColor[parts] = "red";
                              frontPartHowHard[parts]?[0] =
                                  ((howHard * 300000)).toDouble();
                              frontPartHowHard[parts]?[1] = now;
                            }
                          }
                        }
                        for (var entry in backBodyColor.entries) {
                          if (primeriChoosen.contains(entry.key)) {
                            List ss = [];
                            ss.add(entry.key);
                            for (var parts in ss) {
                              backBodyColor[parts] = "red";
                              backPartHowHard[parts]?[0] =
                                  ((backHowHardDuble * 300000)).toDouble();
                              backPartHowHard[parts]?[1] = now;
                            }
                          }
                        }
                        sharedPreferencesManager.saveMap(
                            'partHowHard', frontPartHowHard);
                        sharedPreferencesManager.saveMap(
                            'backPartHowHard', backPartHowHard);
                        primeriChoosen.clear();
                        Navigator.pop(context);

                        makeIt();
                        backMakeIt();
                      },
                    )
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.next_plan),
          label: const Text('Next'),
        )
      ],
    );
  }
}
