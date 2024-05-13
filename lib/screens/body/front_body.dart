// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/body_parts_position.dart';
import 'package:interval_timer/res/colors.dart';
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
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  double howHard = 0;
  bool front = true;
  bool mm = true;

  late Map<String, dynamic> spartHowHard;
  void makeIt() {
    var now = DateTime.now().millisecondsSinceEpoch;
    if (sharedPreferencesManager.getMap('partHowHard').isEmpty) {
      sharedPreferencesManager.saveMap('partHowHard', frontPartHowHard!);
      spartHowHard = sharedPreferencesManager.getMap('partHowHard');
    } else {
      spartHowHard = sharedPreferencesManager.getMap('partHowHard');
    }

    for (var hard in spartHowHard.entries) {
      // hard.value[0] = 0;
      // hard.value[1] = 0;
      // partHowHard = spartHowHard;
      if ((now - hard.value[1]) / 1000 > hard.value[0]) {
        frontBodyColor[hard.key] = "glass";
        hard.value[0] = 0;
        hard.value[1] = 0;
      } else {
        switch ((hard.value[0]) - ((now - hard.value[1]) / 1000)) {
          case < 86400:
            print(
                "reminded ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");
            frontBodyColor[hard.key] = "blue";
            break;
          case > 86400 && < 172800:
            print(
                "reminded ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");

            frontBodyColor[hard.key] = "orange";
            break;
          case > 172800:
            print(
                "reminded ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");

            frontBodyColor[hard.key] = "red";
            break;
          default:
          // Handle other cases if needed
        }
        // bodyParts[hard.key] = "red";
        print(
            ("red: ${hard.key} = ${(hard.value[0])} / ${hard.value[1]} / time: ${(hard.value[0]) - ((now - hard.value[1]) / 1000)} "));
      }
    }
    frontPartHowHard = spartHowHard;
  }

  double backHowHardDuble = 0;
  late Map<String, dynamic> backSpartHowHard;
  void backMakeIt() {
    var now = DateTime.now().millisecondsSinceEpoch;
    if (sharedPreferencesManager.getMap('backPartHowHard').isEmpty) {
      sharedPreferencesManager.saveMap('backPartHowHard', backPartHowHard!);
      backSpartHowHard = sharedPreferencesManager.getMap('backPartHowHard');
    } else {
      backSpartHowHard = sharedPreferencesManager.getMap('backPartHowHard');
    }

    for (var hard in backSpartHowHard.entries) {
      // hard.value[0] = 0;
      // hard.value[1] = 0;
      // partHowHard = spartHowHard;
      if ((now - hard.value[1]) / 1000 > hard.value[0]) {
        backBodyColor[hard.key] = "glass";
        hard.value[0] = 0;
        hard.value[1] = 0;
      } else {
        switch ((hard.value[0]) - ((now - hard.value[1]) / 1000)) {
          case < 86400:
            print(
                "reminded ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");
            backBodyColor[hard.key] = "blue";
            break;
          case > 86400 && < 172800:
            print(
                "reminded ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");

            backBodyColor[hard.key] = "orange";
            break;
          case > 172800:
            print(
                "reminded ${(hard.value[0]) - ((now - hard.value[1]) / 1000)}");

            backBodyColor[hard.key] = "red";
            break;
          default:
          // Handle other cases if needed
        }
        // bodyParts[hard.key] = "red";
        print(
            ("red: ${hard.key} = ${(hard.value[0])} / ${hard.value[1]} / time: ${(hard.value[0]) - ((now - hard.value[1]) / 1000)} "));
      }
    }
    backPartHowHard = backSpartHowHard;
  }

  @override
  void initState() {
    super.initState();
    backMakeIt();
    makeIt();
  }

  Map<String, List<double>> frontPartPositions = {
    'leftLatissimus': [170, 90, 2.1],
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
    'rightLatissimus': [75, 90, -2.1],
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

  Map<String, dynamic>? frontPartHowHard = {
    "leftLatissimus": [0, 0],
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
    "rightLatissimus": [0, 0],
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

  Map<String, String> frontBodyColor = {
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

  Map<String, List<double>> frontPartSizes = {
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

//Back side

  Map<String, String> backBodyColor = {
    'rightBicepsFemoris': 'glass',
    'rightAdductor': 'glass',
    'rightSemitendinosus': 'glass',
    'leftSemitendinosus': 'glass',
    'leftBicepsFemoris': 'glass',
    'leftAdductor': 'glass',
    'rightBackKool': 'glass',
    'leftBackKool': 'glass',
    'rightTrapezius': 'glass',
    'leftTrapezius': 'glass',
    'rightMiddleHead': 'glass',
    'leftMiddleHead': 'glass',
    'rightPosteriorHead': 'glass',
    'leftPosteriorHead': 'glass',
    'rightTeres': 'glass',
    'leftTeres': 'glass',
    'rightLatissimusDorsi': 'glass',
    'leftLatissimusDorsi': 'glass',
    'rightLongHead': 'glass',
    'leftLongHead': 'glass',
    'rightLateralHead': 'glass',
    'leftLateralHead': 'glass',
    'rightMedialHead': 'glass',
    'leftMedialHead': 'glass',
    'rightAssist': 'glass',
    'leftAssist': 'glass',
    'leftErectorSpinae': 'glass',
    'rightErectorSpinae': 'glass',
    'rightGluteusMedius': 'glass',
    'leftGluteusMedius': 'glass',
    'rightGluteusMaximus': 'glass',
    'leftGluteusMaximus': 'glass',
    'rightSoleus': 'glass',
    'leftSoleus': 'glass',
    'leftGastrocnemius': 'glass',
    'rightGastrocnemius': 'glass',
    'rightIliotibial': 'glass',
    'leftIliotibial': 'glass',
    'rightExtemal': 'glass',
    'leftExtemal': 'glass',
  };

  Map<String, List<double>> backPartPositions = {
    'rightBicepsFemoris': [177, 204, 2.1],
    'rightAdductor': [155, 204, 2.19],
    'rightSemitendinosus': [168, 204, 2.1],
    'leftSemitendinosus': [133, 204, 1.93],
    'leftBicepsFemoris': [120, 204, 1.93],
    'leftAdductor': [141, 204, 1.9],
    'rightBackKool': [200, 26.5, 1],
    'leftBackKool': [135, 26.5, 1],
    'rightTrapezius': [155, 73, -1.5],
    'leftTrapezius': [146, 47, 1.5],
    'rightMiddleHead': [240, 55, .8],
    'leftMiddleHead': [75, 29, 1.3],
    'rightPosteriorHead': [225, 55, -1.13],
    'leftPosteriorHead': [90, 42, 1.13],
    'rightTeres': [215, 73, -1.2],
    'leftTeres': [97, 57, 1.2],
    'rightLatissimusDorsi': [215, 113, 1],
    'leftLatissimusDorsi': [130, 113, 1],
    'rightLongHead': [235, 95, 1],
    'leftLongHead': [62, 95, 1],
    'rightLateralHead': [249, 87, 1.02],
    'leftLateralHead': [44, 87, -1.02],
    'rightMedialHead': [239, 111, -1.15],
    'leftMedialHead': [69, 102, 1.15],
    'rightAssist': [250, 170, 1],
    'leftAssist': [64, 170, 1],
    'leftErectorSpinae': [144, 100, 2],
    'rightErectorSpinae': [177, 98, 2],
    'rightGluteusMedius': [193, 165, -1.1],
    'leftGluteusMedius': [130, 156, 1.1],
    'rightGluteusMaximus': [179, 205, 1],
    'leftGluteusMaximus': [142, 205, 1],
    'rightSoleus': [182, 286, 1.05],
    'leftSoleus': [121, 288, -1.05],
    'leftGastrocnemius': [133, 282, -1.032],
    'rightGastrocnemius': [170, 280, 1.032],
    'rightIliotibial': [194, 224, -1.02],
    'leftIliotibial': [112, 222, 1.01],
    'rightExtemal': [194, 145, -1.05],
    'leftExtemal': [105, 145, 1.05],
  };

  Map<String, dynamic>? backPartHowHard = {
    'rightBicepsFemoris': [0, 0],
    'rightAdductor': [0, 0],
    'rightSemitendinosus': [0, 0],
    'leftSemitendinosus': [0, 0],
    'leftBicepsFemoris': [0, 0],
    'leftAdductor': [0, 0],
    'rightBackKool': [0, 0],
    'leftBackKool': [0, 0],
    'rightTrapezius': [0, 0],
    'leftTrapezius': [0, 0],
    'rightMiddleHead': [0, 0],
    'leftMiddleHead': [0, 0],
    'rightPosteriorHead': [0, 0],
    'leftPosteriorHead': [0, 0],
    'rightTeres': [0, 0],
    'leftTeres': [0, 0],
    'rightLatissimusDorsi': [0, 0],
    'leftLatissimusDorsi': [0, 0],
    'rightLongHead': [0, 0],
    'leftLongHead': [0, 0],
    'rightLateralHead': [0, 0],
    'leftLateralHead': [0, 0],
    'rightMedialHead': [0, 0],
    'leftMedialHead': [0, 0],
    'rightAssist': [0, 0],
    'leftAssist': [0, 0],
    'leftErectorSpinae': [0, 0],
    'rightErectorSpinae': [0, 0],
    'rightGluteusMedius': [0, 0],
    'leftGluteusMedius': [0, 0],
    'rightGluteusMaximus': [0, 0],
    'leftGluteusMaximus': [0, 0],
    'rightSoleus': [0, 0],
    'leftSoleus': [0, 0],
    'leftGastrocnemius': [0, 0],
    'rightGastrocnemius': [0, 0],
    'rightIliotibial': [0, 0],
    'leftIliotibial': [0, 0],
    'rightExtemal': [0, 0],
    'leftExtemal': [0, 0],
  };

  Map<String, List<double>> backPartSizes = {
    'leftBicepsFemoris': [47, 7, 0, 0, 30, 0],
    'rightBicepsFemoris': [47, 7, 0, 30, 0, 0],
    'leftAdductor': [43, 6, 30, 0, 0, 0],
    'rightAdductor': [43, 6, 0, 30, 30, 100],
    'leftSemitendinosus': [43, 10, 0, 0, 10, 0],
    'rightSemitendinosus': [43, 10, 0, 10, 0, 0],
    'leftBackKool': [50, 25, 0, 0, 30, 0],
    'rightBackKool': [50, 25, 0, 0, 0, 30],
    'leftTrapezius': [30, 50, 30, 30, 40, 40],
    'rightTrapezius': [30, 50, 30, 30, 40, 40],
    'leftMiddleHead': [40, 20, 0, 0, 30, 30],
    'rightMiddleHead': [40, 20, 0, 0, 30, 30],
    'leftPosteriorHead': [33, 17, 10, 30, 50, 30],
    'rightPosteriorHead': [33, 17, 50, 30, 40, 30],
    'leftTeres': [33, 18, 30, 50, 30, 50],
    'rightTeres': [33, 18, 30, 30, 30, 30],
    'leftLatissimusDorsi': [60, 53, 30, 30, 40, 40],
    'rightLatissimusDorsi': [60, 53, 30, 30, 40, 40],
    'leftLongHead': [12, 45, 30, 0, 30, 0],
    'rightLongHead': [12, 45, 0, 30, 0, 30],
    'leftLateralHead': [10, 32, 30, 30, 30, 30],
    'rightLateralHead': [10, 32, 30, 30, 30, 30],
    'leftMedialHead': [25, 13, 30, 30, 30, 30],
    'rightMedialHead': [25, 13, 30, 30, 30, 30],
    'leftAssist': [23, 60, 30, 30, 30, 0],
    'rightAssist': [23, 60, 30, 30, 0, 30],
    'leftErectorSpinae': [50, 30, 0, 0, 30, 30],
    'rightErectorSpinae': [50, 30, 30, 30, 0, 0],
    'leftGluteusMedius': [35, 18, 30, 30, 30, 30],
    'rightGluteusMedius': [35, 18, 30, 30, 30, 30],
    'leftGluteusMaximus': [30, 48, 30, 30, 30, 30],
    'rightGluteusMaximus': [30, 48, 30, 30, 30, 30],
    'leftSoleus': [10, 40, 30, 30, 100, 30],
    'rightSoleus': [10, 40, 30, 30, 30, 100],
    'leftGastrocnemius': [10, 28, 30, 30, 10, 50],
    'rightGastrocnemius': [10, 28, 30, 30, 50, 10],
    'leftIliotibial': [17, 58, 30, 30, 30, 30],
    'rightIliotibial': [17, 58, 30, 30, 30, 30],
    'leftExtemal': [10, 18, 0, 0, 10, 70],
    'rightExtemal': [10, 18, 0, 0, 60, 20],
  };

  List<String> primeriChoosen = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            context.read<BodyComposeCubit>().toggleBody();
            front = !front;

            print(front);
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: front == true
              ? const Text("back body")
              : const Text("front body"),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 80, 5, 218),
      appBar: AppBar(
        title: const Text('Front Body'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<BodyComposeCubit, BodyComposeState>(
              builder: (context, state) {
                if (context.read<BodyComposeCubit>().fornt) {
                  return Stack(
                    children: [
                      SvgPicture.string(
                        SvgCodes.frontBody(frontBodyColor),
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                      ),
                      // Rendering body parts
                      for (var entry in frontBodyColor.entries)
                        buildBodyPart(
                            entry.key,
                            frontPartPositions[entry.key]![0],
                            frontPartPositions[entry.key]![1],
                            frontPartSizes[entry.key]![0],
                            frontPartSizes[entry.key]![1],
                            () => togglePart(entry.key),
                            frontPartPositions[entry.key]?[2] ?? 0),
                    ],
                  );
                }
                if (context.read<BodyComposeCubit>().fornt == false) {
                  return Stack(
                    children: [
                      SvgPicture.string(
                        SvgCodes.backBody(backBodyColor),
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                      ),
                      // Rendering body parts
                      for (var entry in backBodyColor.entries)
                        Positioned(
                          left: backPartPositions[entry.key]?[0],
                          top: backPartPositions[entry.key]?[1],
                          child: Container(
                            width: backPartSizes[entry.key]?[0],
                            height: backPartSizes[entry.key]?[1],
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    backPartSizes[entry.key]?[2] ?? 0),
                                topRight: Radius.circular(
                                    backPartSizes[entry.key]?[3] ?? 0),
                                bottomRight: Radius.circular(
                                    backPartSizes[entry.key]?[4] ?? 0),
                                bottomLeft: Radius.circular(
                                    backPartSizes[entry.key]?[5] ?? 0),
                              ),
                            ),
                            transform: Matrix4.rotationZ(
                              math.pi / (backPartPositions[entry.key]?[2] ?? 0),
                            ), // Rotate 45 degrees
                            child: GestureDetector(
                              onTap: () => backTogglePart(entry.key),
                            ),
                          ),
                        ),
                    ],
                  );
                }
                return const SizedBox();
              },
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
                                howHard = context
                                    .read<BodyComposeCubit>()
                                    .myPercentage;
                                //back
                                backHowHardDuble = context
                                    .read<BodyComposeCubit>()
                                    .myPercentage;
                                double now = DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toDouble();
                                print(now);

                                for (var entry in frontBodyColor.entries) {
                                  print("printed");
                                  if (primeriChoosen.contains(entry.key)) {
                                    List ss = [];
                                    ss.add(entry.key);
                                    print("sssssssssssssssssssssssssssss $ss");
                                    for (var parts in ss) {
                                      frontBodyColor[parts] = "red";
                                      frontPartHowHard![parts]?[0] =
                                          ((howHard * 300000)).toDouble();
                                      frontPartHowHard![parts]?[1] = now;
                                      print(primeriChoosen);
                                    }
                                  }
                                }
                                for (var entry in backBodyColor.entries) {
                                  if (primeriChoosen.contains(entry.key)) {
                                    List ss = [];
                                    ss.add(entry.key);
                                    for (var parts in ss) {
                                      //Back
                                      backBodyColor[parts] = "red";
                                      backPartHowHard?[parts]?[0] =
                                          ((backHowHardDuble * 300000))
                                              .toDouble();
                                      backPartHowHard?[parts]?[1] = now;
                                    }
                                  }
                                }
                                sharedPreferencesManager.saveMap(
                                    'partHowHard', frontPartHowHard!);
                                //back

                                sharedPreferencesManager.saveMap(
                                    'backPartHowHard', backPartHowHard!);
                                primeriChoosen.clear();
                                Navigator.pop(context);

                                setState(() {
                                  backMakeIt();
                                  makeIt();
                                });
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
            )
          ],
        ),
      ),
    );
  }

  void togglePart(String partName) {
    List<bool> isExpandedList = [false, false, false];
    setState(() {
      if (frontBodyColor[partName] != "glass" &&
          frontBodyColor[partName] != "green") {
        showAdaptiveDialog(
          context: context,
          builder: (context) {
            context.read<BodyComposeCubit>().updateReminedTime(
                level: (frontPartHowHard?[partName][0]),
                savedSecond: frontPartHowHard?[partName][1]);
            return AlertDialog.adaptive(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog.adaptive(
                                      title: const Text("Are you sure?"),
                                      content: Row(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                frontPartHowHard?[partName][0] =
                                                    0;
                                                frontPartHowHard?[partName][1] =
                                                    0;
                                                sharedPreferencesManager
                                                    .saveMap('partHowHard',
                                                        frontPartHowHard!);
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
                              child: const Text("End Of Recovery"),
                            ),
                            TextButton(
                                onPressed: () {
                                  showAdaptiveDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog.adaptive(
                                        content: Column(
                                          children: [
                                            //problem is set state doesn,t Work
                                            ExpansionPanelList(
                                              expansionCallback:
                                                  (panelIndex, isExpanded) {
                                                setState(() {
                                                  mm = !mm;
                                                  isExpandedList[panelIndex] =
                                                      !isExpanded;

                                                  //         _isExpandedList =
                                                  //     List.generate(
                                                  //   _isExpandedList.length,
                                                  //   (index) =>
                                                  //       index == panelIndex
                                                  //           ? !isExpanded
                                                  //           : false,
                                                  // );
                                                });
                                              },
                                              children: [
                                                ExpansionPanel(
                                                  isExpanded: mm,
                                                  headerBuilder:
                                                      (context, isExpanded) {
                                                    return const Text(
                                                        "Gym Exercices");
                                                  },
                                                  body: const Text("video"),
                                                ),
                                                ExpansionPanel(
                                                    isExpanded:
                                                        isExpandedList[1],
                                                    headerBuilder:
                                                        (context, isExpanded) {
                                                      return const Text(
                                                          "Mobiliti");
                                                    },
                                                    body: const Text("video")),
                                                ExpansionPanel(
                                                    isExpanded:
                                                        isExpandedList[2],
                                                    headerBuilder:
                                                        (context, isExpanded) {
                                                      return const Text(
                                                          "Body Weight");
                                                    },
                                                    body: const Text("video"))
                                              ],
                                            )
                                          ],
                                        ),
                                        backgroundColor: AppColors.bgInterval,
                                      );
                                    },
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.video_collection),
                                    Text("watch exercises")
                                  ],
                                ))
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
      if (frontBodyColor[partName] == 'green') {
        primeriChoosen.remove(partName);
        frontBodyColor[partName] = 'glass';
      } else {
        primeriChoosen.add(partName);

        frontBodyColor[partName] = 'green';
      }
      // frontBodyColor[partName] =
      //     frontBodyColor[partName] == 'green' ? 'glass' : 'green';
      // if (primeriChoosen.contains(partName)) {
      //   primeriChoosen.remove(partName);
      // } else {
      //   primeriChoosen.add(partName);
      // }
      print(primeriChoosen);
    });
  }

  void backTogglePart(String partName) {
    setState(() {
      if (backBodyColor[partName] != "glass" &&
          backBodyColor[partName] != "green") {
        showAdaptiveDialog(
          context: context,
          builder: (context) {
            context.read<BodyComposeCubit>().updateReminedTime(
                level: (backPartHowHard?[partName][0]),
                savedSecond: backPartHowHard?[partName][1]);
            return AlertDialog.adaptive(
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
                                  showAdaptiveDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog.adaptive(
                                        title: const Text("Are you sure?"),
                                        content: Row(
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  backPartHowHard?[partName]
                                                      [0] = 0;
                                                  backPartHowHard?[partName]
                                                      [1] = 0;
                                                  sharedPreferencesManager
                                                      .saveMap(
                                                          'backPartHowHard',
                                                          backPartHowHard!);
                                                  backMakeIt();
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
      backBodyColor[partName] =
          backBodyColor[partName] == 'green' ? 'glass' : 'green';
      if (primeriChoosen.contains(partName)) {
        primeriChoosen.remove(partName);
      } else {
        primeriChoosen.add(partName);
      }
      print(primeriChoosen);
    });
  }

  // Widget buildBackBodyPart(String partName, double left, double top,
  //     double width, double height, Function() onTap, double angle) {
  //   return Center(
  //     child: Positioned(
  //       left: left,
  //       top: top,
  //       child: Container(
  //         width: width,
  //         height: height,
  //         decoration: const BoxDecoration(
  //           color: Colors.blue,
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(10),
  //             topRight: Radius.circular(10),
  //           ),
  //         ),
  //         transform: Matrix4.rotationZ(math.pi / angle), // Rotate 45 degrees
  //         child: GestureDetector(
  //           onDoubleTap: onTap,
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
