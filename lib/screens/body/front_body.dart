// ignore_for_file: avoid_print

import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/body_parts_position.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/res/svg_codes.dart';
import 'package:interval_timer/screens/body/cubit/body_compose_cubit.dart';
import 'package:interval_timer/screens/body/models/video_parts.dart';
import 'package:interval_timer/utils/format_time.dart';
import 'package:interval_timer/utils/shared_perfrences_manager.dart';
import 'package:interval_timer/utils/youtube/youtube_player.dart';
import 'package:interval_timer/utils/youtube/youtube_service.dart';
import 'package:interval_timer/widgets/clikable_progresbar.dart';
import 'package:interval_timer/widgets/youtube_video_player.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math' as math;

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  List<bool> isExpandedList = [false, false, false];

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

  final YoutubeService _youtubeService = YoutubeService();
  Future<List<String>>? _videoIds;

  void _searchVideos(String part) {
    // Use a regular expression to remove the prefixes "left" or "right"
    String cleanPart =
        part.replaceAll(RegExp(r'^(left|right)(First|Second|Third)?'), '');
    String finalSerachPrompt = "Gym exersice for $cleanPart";
    print("JOOOOOOOOOOOOOOMBOOOO $finalSerachPrompt");
    setState(() {
      _videoIds = _youtubeService.fetchVideoIds(finalSerachPrompt);
    });
  }

  void _searchMobilityVideos(String part) {
    // Use a regular expression to remove the prefixes "left" or "right"
    String cleanPart =
        part.replaceAll(RegExp(r'^(left|right)(First|Second|Third)?'), '');
    String finalSerachPrompt = "mobility  exersice for $cleanPart";
    print("JOOOOOOOOOOOOOOMBOOOO $finalSerachPrompt");
    setState(() {
      _videoIds = _youtubeService.fetchVideoIds(finalSerachPrompt);
    });
  }

  void _searchBodyWeightVideos(String part) {
    // Use a regular expression to remove the prefixes "left" or "right"
    String cleanPart =
        part.replaceAll(RegExp(r'^(left|right)(First|Second|Third)?'), '');
    String finalSerachPrompt = "body weight exersice for $cleanPart";
    print("JOOOOOOOOOOOOOOMBOOOO $finalSerachPrompt");
    setState(() {
      _videoIds = _youtubeService.fetchVideoIds(finalSerachPrompt);
    });
  }

  @override
  void initState() {
    super.initState();
    backMakeIt();
    makeIt();
  }

  Map<String, List<double>> frontPartPositions = {
    'leftLatissimus': [170, 90, 2.1],
    'leftTrapezius': [150, 8, 0],
    'leftShoulder': [195, 33, 0],
    'leftBiceps': [200, 80, 0],
    'leftForearm': [200, 125, 0],
    'leftChest': [151, 40, 0],
    'leftFirstAb': [145, 87, 0],
    'leftSecondAb': [145, 110, 0],
    'leftThirdAb': [147, 133, 0],
    'leftExternal Obliques': [157, 150, 2.7],
    'leftFirstQuad': [180, 167, .2],
    'leftSecondQuad': [170, 170, 0],
    'leftThirdQuad': [159, 172, -.2],
    'leftTibialis Anterior': [175, 240, 0],
    'rightLatissimus': [75, 90, -2.1],
    'rightTrapezius': [85, 8, 0],
    'rightShoulder': [47, 33, 0],
    'rightBiceps': [53, 80, 0],
    'rightForearm': [53, 125, 0],
    'rightChest': [91.5, 40, 0],
    'rightFirstAb': [103, 87, 0],
    'rightSecondAb': [105, 110, 0],
    'rightThirdAb': [107, 133, 0],
    'rightExternal Obliques': [92, 153, .3],
    'rightFirstQuad': [96, 167, -.2],
    'rightSecondQuad': [108, 167, 0],
    'rightThirdQuad': [118, 169, .2],
    'rightTibialis Anterior': [98, 240, 0],
  };

  Map<String, dynamic>? frontPartHowHard = {
    "leftLatissimus": [0, 0],
    "leftTrapezius": [0, 0],
    "leftShoulder": [0, 0],
    "leftBiceps": [0, 0],
    "leftForearm": [0, 0],
    "leftChest": [0, 0],
    "leftFirstAb": [0, 0],
    "leftSecondAb": [0, 0],
    "leftThirdAb": [0, 0],
    "leftExternal Obliques": [0, 0],
    "leftFirstQuad": [0, 0],
    "leftSecondQuad": [0, 0],
    "leftThirdQuad": [0, 0],
    "leftTibialis Anterior": [0, 0],
    "rightLatissimus": [0, 0],
    "rightTrapezius": [0, 0],
    "rightShoulder": [0, 0],
    "rightBiceps": [0, 0],
    "rightForearm": [0, 0],
    "rightChest": [0, 0],
    "rightFirstAb": [0, 0],
    "rightSecondAb": [0, 0],
    "rightThirdAb": [0, 0],
    "rightExternal Obliques": [0, 0],
    "rightFirstQuad": [0, 0],
    "rightSecondQuad": [0, 0],
    "rightThirdQuad": [0, 0],
    "rightTibialis Anterior": [0, 0]
  };

  Map<String, String> frontBodyColor = {
    "leftLatissimus": "glass",
    'leftTrapezius': 'glass',
    'leftShoulder': 'glass',
    'leftBiceps': 'glass',
    'leftForearm': 'glass',
    'leftChest': 'glass',
    'leftFirstAb': 'glass',
    'leftSecondAb': 'glass',
    'leftThirdAb': 'glass',
    'leftExternal Obliques': 'glass',
    'leftFirstQuad': 'glass',
    'leftSecondQuad': 'glass',
    'leftThirdQuad': 'glass',
    'leftTibialis Anterior': 'glass',
    "rightLatissimus": "glass",
    'rightTrapezius': 'glass',
    'rightShoulder': 'glass',
    'rightBiceps': 'glass',
    'rightForearm': 'glass',
    'rightChest': 'glass',
    'rightFirstAb': 'glass',
    'rightSecondAb': 'glass',
    'rightThirdAb': 'glass',
    'rightExternal Obliques': 'glass',
    'rightFirstQuad': 'glass',
    'rightSecondQuad': 'glass',
    'rightThirdQuad': 'glass',
    'rightTibialis Anterior': 'glass',
  };

  Map<String, List<double>> frontPartSizes = {
    'leftLatissimus': [40, 10],
    'leftTrapezius': [50, 25],
    'leftShoulder': [40, 40],
    'leftBiceps': [30, 35],
    'leftForearm': [30, 45],
    'leftChest': [40, 40],
    'leftFirstAb': [33, 18],
    'leftSecondAb': [33, 18],
    'leftThirdAb': [27, 18],
    'leftExternal Obliques': [37, 10],
    'leftFirstQuad': [7, 70],
    'leftSecondQuad': [6, 50],
    'leftThirdQuad': [6, 60],
    'leftTibialis Anterior': [13, 50],
    'rightLatissimus': [40, 10],
    'rightTrapezius': [50, 25],
    'rightShoulder': [40, 40],
    'rightBiceps': [30, 35],
    'rightForearm': [30, 45],
    'rightChest': [40, 40],
    'rightFirstAb': [33, 18],
    'rightSecondAb': [33, 18],
    'rightThirdAb': [27, 18],
    'rightExternal Obliques': [37, 10],
    'rightFirstQuad': [7, 70],
    'rightSecondQuad': [6, 50],
    'rightThirdQuad': [6, 60],
    'rightTibialis Anterior': [13, 50],
  };

//Back side

  Map<String, String> backBodyColor = {
    'rightBicepsFemoris': 'glass',
    'rightAdductor': 'glass',
    'rightSemitendinosus': 'glass',
    'leftSemitendinosus': 'glass',
    'leftBicepsFemoris': 'glass',
    'leftAdductor': 'glass',
    'rightBackTrapezius': 'glass',
    'leftBackTrapezius': 'glass',
    'rightTrapezius': 'glass',
    'leftTrapezius': 'glass',
    'rightBack Shoulder': 'glass',
    'leftBack Shoulder': 'glass',
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
    'rightBrachioradialis': 'glass',
    'leftBrachioradialis': 'glass',
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
    'rightBackTrapezius': [200, 26.5, 1],
    'leftBackTrapezius': [135, 26.5, 1],
    'rightTrapezius': [155, 73, -1.5],
    'leftTrapezius': [146, 47, 1.5],
    'rightBack Shoulder': [240, 55, .8],
    'leftBack Shoulder': [75, 29, 1.3],
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
    'rightBrachioradialis': [250, 170, 1],
    'leftBrachioradialis': [64, 170, 1],
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
    'rightBackTrapezius': [0, 0],
    'leftBackTrapezius': [0, 0],
    'rightTrapezius': [0, 0],
    'leftTrapezius': [0, 0],
    'rightBack Shoulder': [0, 0],
    'leftBack Shoulder': [0, 0],
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
    'rightBrachioradialis': [0, 0],
    'leftBrachioradialis': [0, 0],
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
    'leftBackTrapezius': [50, 25, 0, 0, 30, 0],
    'rightBackTrapezius': [50, 25, 0, 0, 0, 30],
    'leftTrapezius': [30, 50, 30, 30, 40, 40],
    'rightTrapezius': [30, 50, 30, 30, 40, 40],
    'leftBack Shoulder': [40, 20, 0, 0, 30, 30],
    'rightBack Shoulder': [40, 20, 0, 0, 30, 30],
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
    'leftBrachioradialis': [23, 60, 30, 30, 30, 0],
    'rightBrachioradialis': [23, 60, 30, 30, 0, 30],
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
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: FloatingActionButton(
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
                ? const Text("Back body")
                : const Text("Front body"),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 80, 5, 218),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
            front == true ? const Text("Front body") : const Text("Back body"),
      ),
      body: Stack(
        children: [
          Visibility(
            visible: primeriChoosen.length == 1,
            child: Positioned(
              left: 20,
              top: 70,
              child: IconButton(
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return AlertDialog.adaptive(
                          content: Column(
                            children: [
                              24.heightBox,
                              ExpansionPanelList(
                                expandedHeaderPadding: const EdgeInsets.all(10),
                                expansionCallback: (panelIndex, isExpanded) {
                                  setState(() {
                                    isExpandedList[panelIndex] = isExpanded;
                                    if (isExpandedList[0] == true) {
                                      _searchVideos(primeriChoosen.first);
                                    } else if (isExpandedList[1] == true) {
                                      _searchMobilityVideos(
                                          primeriChoosen.first);
                                    } else if (isExpandedList[2]) {
                                      _searchBodyWeightVideos(
                                          primeriChoosen.first);
                                    }
                                    // switch (isExpandedList[panelIndex]) {
                                    //   case true:
                                    //     _searchVideos(primeriChoosen.first);

                                    //     break;
                                    //   default:
                                    // }
                                    print(isExpandedList);
                                  });
                                },
                                children: [
                                  ExpansionPanel(
                                    isExpanded: isExpandedList[0],
                                    headerBuilder: (context, isExpanded) {
                                      return const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Text("Gym Exercises"),
                                      );
                                    },
                                    body: videosInExpantionPanel(),
                                    canTapOnHeader: true,
                                  ),
                                  ExpansionPanel(
                                      isExpanded: isExpandedList[1],
                                      headerBuilder: (context, isExpanded) {
                                        return const Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Text("Mobility"),
                                        );
                                      },
                                      body: videosInExpantionPanel()),
                                  ExpansionPanel(
                                      isExpanded: isExpandedList[2],
                                      headerBuilder: (context, isExpanded) {
                                        return const Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Text("Body Weight"),
                                        );
                                      },
                                      body: videosInExpantionPanel())
                                ],
                              )
                            ],
                          ),
                          backgroundColor: AppColors.bgInterval,
                        );
                      });
                    },
                  );
                },
                icon: Icon(
                  MdiIcons.youtube,
                  size: 50,
                ),
                color: AppColors.mainRed,
              ),
            ),
          ),
          Center(
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
                                  math.pi /
                                      (backPartPositions[entry.key]?[2] ?? 0),
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber)),
                      onPressed: () {
                        if (primeriChoosen.isEmpty) {
                          return;
                        }
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog.adaptive(
                              title:
                                  const Text('How did You Train these Mucles?'),
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
                                        print(
                                            "sssssssssssssssssssssssssssss $ss");
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
        ],
      ),
    );
  }

  SizedBox videosInExpantionPanel() {
    return SizedBox(
      width: 200,
      height: 300,
      child: FutureBuilder<List<String>>(
        future: _videoIds,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No Videos Found"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return YoutubrVideoPlayer(videoId: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }

  void togglePart(String partName) {
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
                                _searchVideos(partName);
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            void Function(void Function())
                                                setState) {
                                      return AlertDialog.adaptive(
                                        content: Column(
                                          children: [
                                            24.heightBox,
                                            ExpansionPanelList(
                                              expandedHeaderPadding:
                                                  const EdgeInsets.all(10),
                                              expansionCallback:
                                                  (panelIndex, isExpanded) {
                                                setState(() {
                                                  // mm = !mm;
                                                  isExpandedList[panelIndex] =
                                                      isExpanded;
                                                  print(isExpandedList);
                                                });
                                              },
                                              children: [
                                                ExpansionPanel(
                                                  isExpanded: isExpandedList[0],
                                                  headerBuilder:
                                                      (context, isExpanded) {
                                                    return const Padding(
                                                      padding:
                                                          EdgeInsets.all(16.0),
                                                      child:
                                                          Text("Gym Exercises"),
                                                    );
                                                  },
                                                  body: SizedBox(
                                                    width: 200,
                                                    height: 300,
                                                    child: FutureBuilder<
                                                        List<String>>(
                                                      future: _videoIds,
                                                      builder:
                                                          (context, snapshot) {
                                                        print(snapshot.data);
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return const Center(
                                                              child:
                                                                  CircularProgressIndicator());
                                                        } else if (snapshot
                                                            .hasError) {
                                                          return Center(
                                                              child: Text(snapshot
                                                                  .error
                                                                  .toString()));
                                                        } else if (!snapshot
                                                                .hasData ||
                                                            snapshot.data!
                                                                .isEmpty) {
                                                          return const Center(
                                                              child: Text(
                                                                  "No Videos Found"));
                                                        } else {
                                                          return ListView
                                                              .builder(
                                                            itemCount: snapshot
                                                                .data!.length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return YoutubrVideoPlayer(
                                                                  videoId: snapshot
                                                                          .data![
                                                                      index]);
                                                            },
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  canTapOnHeader: true,
                                                ),
                                                ExpansionPanel(
                                                    isExpanded:
                                                        isExpandedList[1],
                                                    headerBuilder:
                                                        (context, isExpanded) {
                                                      return const Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Text("Mobility"),
                                                      );
                                                    },
                                                    body: const Text("video")),
                                                ExpansionPanel(
                                                    isExpanded:
                                                        isExpandedList[2],
                                                    headerBuilder:
                                                        (context, isExpanded) {
                                                      return const Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child:
                                                            Text("Body Weight"),
                                                      );
                                                    },
                                                    body: const Text("video"))
                                              ],
                                            )
                                          ],
                                        ),
                                        backgroundColor: AppColors.bgInterval,
                                      );
                                    });
                                  },
                                );
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.video_collection),
                                  Text("watch exercises")
                                ],
                              ),
                            ),
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
                                                backPartHowHard?[partName][0] =
                                                    0;
                                                backPartHowHard?[partName][1] =
                                                    0;
                                                sharedPreferencesManager
                                                    .saveMap('backPartHowHard',
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
                              child: const Text("End Of Recovery"),
                            ),
                            TextButton(
                              onPressed: () {
                                _searchVideos(partName);
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            void Function(void Function())
                                                setState) {
                                      return AlertDialog.adaptive(
                                        content: Column(
                                          children: [
                                            24.heightBox,
                                            ExpansionPanelList(
                                              expandedHeaderPadding:
                                                  const EdgeInsets.all(10),
                                              expansionCallback:
                                                  (panelIndex, isExpanded) {
                                                setState(() {
                                                  // mm = !mm;
                                                  isExpandedList[panelIndex] =
                                                      isExpanded;
                                                  print(isExpandedList);
                                                });
                                              },
                                              children: [
                                                ExpansionPanel(
                                                  isExpanded: isExpandedList[0],
                                                  headerBuilder:
                                                      (context, isExpanded) {
                                                    return const Padding(
                                                      padding:
                                                          EdgeInsets.all(16.0),
                                                      child:
                                                          Text("Gym Exercises"),
                                                    );
                                                  },
                                                  body: SizedBox(
                                                    width: 200,
                                                    height: 300,
                                                    child: FutureBuilder<
                                                        List<String>>(
                                                      future: _videoIds,
                                                      builder:
                                                          (context, snapshot) {
                                                        print(snapshot.data);
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return const Center(
                                                              child:
                                                                  CircularProgressIndicator());
                                                        } else if (snapshot
                                                            .hasError) {
                                                          return Center(
                                                              child: Text(snapshot
                                                                  .error
                                                                  .toString()));
                                                        } else if (!snapshot
                                                                .hasData ||
                                                            snapshot.data!
                                                                .isEmpty) {
                                                          return const Center(
                                                              child: Text(
                                                                  "No Videos Found"));
                                                        } else {
                                                          return ListView
                                                              .builder(
                                                            itemCount: snapshot
                                                                .data!.length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return YoutubrVideoPlayer(
                                                                  videoId: snapshot
                                                                          .data![
                                                                      index]);
                                                            },
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  canTapOnHeader: true,
                                                ),
                                                ExpansionPanel(
                                                    isExpanded:
                                                        isExpandedList[1],
                                                    headerBuilder:
                                                        (context, isExpanded) {
                                                      return const Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Text("Mobility"),
                                                      );
                                                    },
                                                    body: const Text("video")),
                                                ExpansionPanel(
                                                    isExpanded:
                                                        isExpandedList[2],
                                                    headerBuilder:
                                                        (context, isExpanded) {
                                                      return const Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child:
                                                            Text("Body Weight"),
                                                      );
                                                    },
                                                    body: const Text("video"))
                                              ],
                                            )
                                          ],
                                        ),
                                        backgroundColor: AppColors.bgInterval,
                                      );
                                    });
                                  },
                                );
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.video_collection),
                                  Text("watch exercises")
                                ],
                              ),
                            ),
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

  Widget buildBodyPart(String partName, double left, double top, double width,
      double height, Function() onTap, double? angle) {
    if (partName == "leftExternal Obliques" ||
        partName == "rightExternal Obliques" ||
        partName == "leftThirdQuad" ||
        partName == "rightThirdQuad" ||
        partName == "leftFirstQuad" ||
        partName == "rightFirstQuad" ||
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
