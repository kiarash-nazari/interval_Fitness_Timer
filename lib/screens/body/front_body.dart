// ignore_for_file: avoid_print

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/svg_codes.dart';
import 'package:interval_timer/screens/body/cubit/body_compose_cubit.dart';
import 'package:interval_timer/utils/format_time.dart';
import 'package:interval_timer/utils/shared_perfrences_manager.dart';
import 'package:interval_timer/widgets/clikable_progresbar.dart';

class FrontBody extends StatefulWidget {
  const FrontBody({Key? key}) : super(key: key);

  @override
  State<FrontBody> createState() => _FrontBodyState();
}

class _FrontBodyState extends State<FrontBody> {
  double howHard = 0;
  late var spartHowHard;
  void makeIt() {
    var now = DateTime.now().millisecondsSinceEpoch;
    if (sharedPreferencesManager.getMap('partHowHard') == {}) {
      sharedPreferencesManager.saveMap('partHowHard', partHowHard!);
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
            print("mann ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");
            bodyParts[hard.key] = "blue";
            break;
          case > 86400 && < 172800:
            print("mann ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");

            bodyParts[hard.key] = "orange";
            break;
          case > 172800:
            print("mann ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");

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
    partHowHard = spartHowHard;
  }

  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  @override
  void initState() {
    super.initState();
    makeIt();
  }

  Map<String, dynamic>? partHowHard = {
    "leftKool": [0, 0],
    "leftShoulder": [0, 0],
    "leftBiceps": [0, 0],
    "leftForearm": [0, 0],
    "leftChest": [0, 0],
    "leftFirstAb": [0, 0],
    "leftSecondAb": [0, 0],
    "leftThirdAb": [0, 0],
    "leftSexAb": [0, 0],
    "leftQuadFirst": [0, 0],
    "leftQuadSecond": [0, 0],
    "leftQuadThird": [0, 0],
    "leftFrontCraft": [0, 0],
    "rightKool": [0, 0],
    "rightShoulder": [0, 0],
    "rightBiceps": [0, 0],
    "rightForearm": [0, 0],
    "rightChest": [0, 0],
    "rightFirstAb": [0, 0],
    "rightSecondAb": [0, 0],
    "rightThirdAb": [0, 0],
    "rightSexAb": [0, 0],
    "rightQuadFirst": [0, 0],
    "rightQuadSecond": [0, 0],
    "rightQuadThird": [0, 0],
    "rightFrontCraft": [0, 0]
  };

  Map<String, String> bodyParts = {
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

  // Define positions and sizes for each body part
  Map<String, List<double>> partPositions = {
    'leftKool': [150, 8, 0],
    'leftShoulder': [195, 33, 0],
    'leftBiceps': [200, 80, 0],
    'leftForearm': [200, 125, 0],
    'leftChest': [151, 40, 0],
    'leftFirstAb': [145, 87, 0],
    'leftSecondAb': [145, 110, 0],
    'leftThirdAb': [147, 133, 0],
    'leftSexAb': [157, 150, 2.7],
    'leftQuadFirst': [180, 167, .2],
    'leftQuadSecond': [170, 170, 0],
    'leftQuadThird': [159, 172, -.2],
    'leftFrontCraft': [175, 240, 0],
    'rightKool': [85, 8, 0],
    'rightShoulder': [47, 33, 0],
    'rightBiceps': [53, 80, 0],
    'rightForearm': [53, 125, 0],
    'rightChest': [91.5, 40, 0],
    'rightFirstAb': [103, 87, 0],
    'rightSecondAb': [105, 110, 0],
    'rightThirdAb': [107, 133, 0],
    'rightSexAb': [92, 153, .3],
    'rightQuadFirst': [96, 167, -.2],
    'rightQuadSecond': [108, 167, 0],
    'rightQuadThird': [118, 169, .2],
    'rightFrontCraft': [98, 240, 0],
  };

  Map<String, List<double>> partSizes = {
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
                  SvgCodes.frontBody(bodyParts),
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
                // Rendering body parts
                for (var entry in bodyParts.entries)
                  buildBodyPart(
                      entry.key,
                      partPositions[entry.key]![0],
                      partPositions[entry.key]![1],
                      partSizes[entry.key]![0],
                      partSizes[entry.key]![1],
                      () => togglePart(entry.key),
                      partPositions[entry.key]?[2] ?? 0),
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
                      return null;
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
                                    partHowHard![parts]?[0] =
                                        ((howHard * 300000)).toDouble();
                                    partHowHard![parts]?[1] = now;
                                  }
                                  sharedPreferencesManager.saveMap(
                                      'partHowHard', partHowHard!);
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
            var now = DateTime.now().millisecondsSinceEpoch;
            return AlertDialog(
              title: const Text("Recovery Time Reminded"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    formatTime(
                      (partHowHard?[partName][0]) -
                          ((now.toDouble() - partHowHard?[partName][1]) / 1000),
                    ),
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
                                            partHowHard?[partName][0] = 0;
                                            partHowHard?[partName][1] = 0;
                                            sharedPreferencesManager.saveMap(
                                                'partHowHard', partHowHard!);
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
              ),
            );
          },
        );
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

  Widget buildBodyPart(String partName, double left, double top, double width,
      double height, Function() onTap, double? angle) {
    if (partName == "leftSexAb" ||
        partName == "rightSexAb" ||
        partName == "leftQuadThird" ||
        partName == "rightQuadThird" ||
        partName == "leftQuadFirst" ||
        partName == "rightQuadFirst") {
      return Positioned(
        left: left,
        top: top,
        child: Transform.rotate(
          angle: angle ?? 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.elliptical(10, 50),
                bottomLeft: Radius.elliptical(10, 50)),
            child: SizedBox(
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
          child: SizedBox(
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
