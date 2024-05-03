// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/body_parts_position.dart';
import 'package:interval_timer/res/svg_codes.dart';
import 'package:interval_timer/screens/body/cubit/body_compose_cubit.dart';
import 'package:interval_timer/utils/format_time.dart';
import 'package:interval_timer/utils/shared_perfrences_manager.dart';
import 'package:interval_timer/widgets/clikable_progresbar.dart';
import 'dart:math' as math;

class FrontBody extends StatefulWidget {
  const FrontBody({Key? key}) : super(key: key);

  @override
  State<FrontBody> createState() => _FrontBodyState();
}

class _FrontBodyState extends State<FrontBody> {
  double howHard = 0;
  late Map<String, dynamic> spartHowHard;
  void makeIt() {
    var now = DateTime.now().millisecondsSinceEpoch;
    if (sharedPreferencesManager.getMap('partHowHard') == {}) {
      sharedPreferencesManager.saveMap('partHowHard', frontHowHard!);
    } else {
      spartHowHard = sharedPreferencesManager.getMap('partHowHard');
    }

    for (var hard in spartHowHard.entries) {
      // hard.value[0] = 0;
      // hard.value[1] = 0;
      // partHowHard = spartHowHard;
      if ((now - hard.value[1]) / 1000 > hard.value[0]) {
        bodyParts[hard.key] = "glass";
        hard.value[0] = 0;
        hard.value[1] = 0;
      } else {
        switch ((hard.value[0]) - ((now - hard.value[1]) / 1000)) {
          case < 86400:
            print(
                "reminded ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");
            bodyParts[hard.key] = "blue";
            break;
          case > 86400 && < 172800:
            print(
                "reminded ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");

            bodyParts[hard.key] = "orange";
            break;
          case > 172800:
            print(
                "reminded ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");

            bodyParts[hard.key] = "red";
            break;
          default:
          // Handle other cases if needed
        }
        // bodyParts[hard.key] = "red";
        print(
            ("red: ${hard.key} = ${(hard.value[0])} / ${hard.value[1]} / time: ${(hard.value[0]) - ((now - hard.value[1]) / 1000)} "));
      }
    }
    frontHowHard = spartHowHard;
  }

  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  @override
  void initState() {
    super.initState();
    makeIt();
  }

  Map<String, List<double>> frontBodyPartPositon =
      BodyPartPositon().frontPartPositions;

  Map<String, dynamic>? frontHowHard = BodyPartPositon().partHowHard;
  Map<String, String> bodyParts = {
    "leftLatissimus": "glass",
    'leftKool': 'glass',
    'leftShoulder': 'glass',
    'leftBiceps': 'glass',
    'leftForearm': 'glass',
    'leftChest': 'glass',
    'leftFirstAb': 'glass',
    'leftSecondAb': 'glass',
    'leftThirdAb': 'glass',
    'leftSexAb': 'glass',
    'leftQuadFirst': 'glass',
    'leftQuadSecond': 'glass',
    'leftQuadThird': 'glass',
    'leftFrontCraft': 'glass',
    "rightLatissimus": "glass",
    'rightKool': 'glass',
    'rightShoulder': 'glass',
    'rightBiceps': 'glass',
    'rightForearm': 'glass',
    'rightChest': 'glass',
    'rightFirstAb': 'glass',
    'rightSecondAb': 'glass',
    'rightThirdAb': 'glass',
    'rightSexAb': 'glass',
    'rightQuadFirst': 'glass',
    'rightQuadSecond': 'glass',
    'rightQuadThird': 'glass',
    'rightFrontCraft': 'glass',
  };

  Map<String, List<double>> partSizes = {
    'leftLatissimus': [40, 10],
    'leftKool': [50, 25],
    'leftShoulder': [40, 40],
    'leftBiceps': [30, 35],
    'leftForearm': [30, 45],
    'leftChest': [40, 40],
    'leftFirstAb': [33, 18],
    'leftSecondAb': [33, 18],
    'leftThirdAb': [27, 18],
    'leftSexAb': [37, 10],
    'leftQuadFirst': [7, 70],
    'leftQuadSecond': [6, 50],
    'leftQuadThird': [6, 60],
    'leftFrontCraft': [13, 50],
    'rightLatissimus': [40, 10],
    'rightKool': [50, 25],
    'rightShoulder': [40, 40],
    'rightBiceps': [30, 35],
    'rightForearm': [30, 45],
    'rightChest': [40, 40],
    'rightFirstAb': [33, 18],
    'rightSecondAb': [33, 18],
    'rightThirdAb': [27, 18],
    'rightSexAb': [37, 10],
    'rightQuadFirst': [7, 70],
    'rightQuadSecond': [6, 50],
    'rightQuadThird': [6, 60],
    'rightFrontCraft': [13, 50],
  };
  List<String> primeriChoosen = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 5, 218),
      appBar: AppBar(
        title: const Text('Front Body'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                SvgPicture.string(
                  SvgCodes.backBody(),
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
                // Rendering body parts
                for (var entry in bodyParts.entries)
                  buildBodyPart(
                      entry.key,
                      frontBodyPartPositon[entry.key]![0],
                      frontBodyPartPositon[entry.key]![1],
                      partSizes[entry.key]![0],
                      partSizes[entry.key]![1],
                      () => togglePart(entry.key),
                      frontBodyPartPositon[entry.key]?[2] ?? 0),
              ],
            ),
            25.heightBox,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  onPressed: () {
                    if (primeriChoosen.isEmpty) {
                      return;
                    }
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('How did You Train these Mucles?'),
                          content: MyProgressBar(
                            percentage: 0,
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  howHard = context
                                      .read<BodyComposeCubit>()
                                      .myPercentage;
                                  double now = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toDouble();
                                  print(now);
                                  for (var parts in primeriChoosen) {
                                    bodyParts[parts] = "red";
                                    frontHowHard![parts]?[0] =
                                        ((howHard * 300000)).toDouble();
                                    frontHowHard![parts]?[1] = now;
                                  }
                                  sharedPreferencesManager.saveMap(
                                      'partHowHard', frontHowHard!);
                                  primeriChoosen.clear();
                                  Navigator.pop(context);

                                  setState(() {});
                                },
                                child: const Text('Done'))
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.next_plan),
                  label: const Text('Next'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void togglePart(String partName) {
    setState(() {
      if (bodyParts[partName] != "glass" && bodyParts[partName] != "green") {
        showDialog(
          context: context,
          builder: (context) {
            context.read<BodyComposeCubit>().updateReminedTime(
                level: (frontHowHard?[partName][0]),
                savedSecond: frontHowHard?[partName][1]);
            return AlertDialog(
              title: const Text("Recovery Time Reminded"),
              content: BlocBuilder<BodyComposeCubit, BodyComposeState>(
                builder: (context, state) {
                  if (state is BodyComposeLoading) {
                    return const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is BodyComposeUpdateReminded) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          formatTime(state.remindedInseconds),
                        ),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Are you sure?"),
                                        content: Row(
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  frontHowHard?[partName][0] =
                                                      0;
                                                  frontHowHard?[partName][1] =
                                                      0;
                                                  sharedPreferencesManager
                                                      .saveMap('partHowHard',
                                                          frontHowHard!);
                                                  makeIt();
                                                  setState(() {});
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("yes")),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Cancel")),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text("End Of Recovery"))
                          ],
                        )
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            );
          },
        ).then((_) {
          context.read<BodyComposeCubit>().cancelCountDownTimer();
        });
        return;
      }
      bodyParts[partName] = bodyParts[partName] == 'green' ? 'glass' : 'green';
      if (primeriChoosen.contains(partName)) {
        primeriChoosen.remove(partName);
      } else {
        primeriChoosen.add(partName);
      }
      print(primeriChoosen);
    });
  }

  Widget buildBackBodyPart(String partName, double left, double top,
      double width, double height, Function() onTap, double angle) {
    return Center(
      child: Positioned(
        left: left,
        top: top,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          transform: Matrix4.rotationZ(math.pi / angle), // Rotate 45 degrees
          child: GestureDetector(
            onDoubleTap: onTap,
          ),
        ),
      ),
    );
  }

  Widget buildBodyPart(String partName, double left, double top, double width,
      double height, Function() onTap, double? angle) {
    if (partName == "leftSexAb" ||
        partName == "rightSexAb" ||
        partName == "leftQuadThird" ||
        partName == "rightQuadThird" ||
        partName == "leftQuadFirst" ||
        partName == "rightQuadFirst" ||
        partName == "leftLatissimus" ||
        partName == "rightLatissimus") {
      return Positioned(
        left: left,
        top: top,
        child: Transform.rotate(
          angle: angle ?? 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.elliptical(10, 50),
                bottomLeft: Radius.elliptical(10, 50)),
            child: Container(
              color: Colors.amber.withOpacity(.2),
              width: width,
              height: height,
              child: GestureDetector(
                onTap: onTap,
              ),
            ),
          ),
        ),
      );
    } else {
      return Positioned(
        left: left,
        top: top,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.amber.withOpacity(.2),
            width: width,
            height: height,
            child: GestureDetector(
              onTap: onTap,
            ),
          ),
        ),
      );
    }
  }
}
