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
import 'package:interval_timer/utils/youtube/youtube_service.dart';
import 'package:interval_timer/widgets/clikable_progresbar.dart';
import 'package:interval_timer/widgets/youtube_video_player.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math' as math;

class FrontBody extends StatefulWidget {
  const FrontBody({Key? key}) : super(key: key);

  @override
  State<FrontBody> createState() => _FrontBodyState();
}

class _FrontBodyState extends State<FrontBody> {
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();

  //Front Body
  var frontPartPositions = BodyPartsPosition.frontPartPositions;
  var frontPartHowHard = BodyPartsPosition.frontPartHowHard;
  var frontBodyColor = BodyPartsPosition.frontBodyColor;
  var frontPartSizes = BodyPartsPosition.frontPartSizes;

//Back side

  var backBodyColor = BodyPartsPosition.backBodyColor;
  var backPartPositions = BodyPartsPosition.backPartPositions;
  var backPartHowHard = BodyPartsPosition.backPartHowHard;
  var backPartSizes = BodyPartsPosition.backPartSizes;

  double howHard = 0;
  bool front = true;
  bool mm = true;
  List<bool> isExpandedList = [false, false, false];

  late Map<String, dynamic> spartHowHard;
  void makeIt() {
    var now = DateTime.now().millisecondsSinceEpoch;
    if (sharedPreferencesManager.getMap('partHowHard').isEmpty) {
      sharedPreferencesManager.saveMap('partHowHard', frontPartHowHard);
      spartHowHard = sharedPreferencesManager.getMap('partHowHard');
    } else {
      spartHowHard = sharedPreferencesManager.getMap('partHowHard');
    }

    for (var hard in spartHowHard.entries) {
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
      sharedPreferencesManager.saveMap('backPartHowHard', backPartHowHard);
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

  List<String> primeriChoosen = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppFloatingButton(context),
      backgroundColor: AppColors.bgBodyParts,
      appBar: AppAppBar(),
      body: Stack(
        children: [
          YouTubeIcon(context),
          BodyPartsWhole(context),
        ],
      ),
    );
  }

  Center BodyPartsWhole(BuildContext context) {
    return Center(
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
                              howHard =
                                  context.read<BodyComposeCubit>().myPercentage;
                              //back
                              backHowHardDuble =
                                  context.read<BodyComposeCubit>().myPercentage;
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
                                    frontPartHowHard[parts]?[0] =
                                        ((howHard * 300000)).toDouble();
                                    frontPartHowHard[parts]?[1] = now;
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
                                    backPartHowHard[parts]?[0] =
                                        ((backHowHardDuble * 300000))
                                            .toDouble();
                                    backPartHowHard[parts]?[1] = now;
                                  }
                                }
                              }
                              sharedPreferencesManager.saveMap(
                                  'partHowHard', frontPartHowHard);
                              //back

                              sharedPreferencesManager.saveMap(
                                  'backPartHowHard', backPartHowHard);
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
    );
  }

  Visibility YouTubeIcon(BuildContext context) {
    return Visibility(
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
                                _searchMobilityVideos(primeriChoosen.first);
                              } else if (isExpandedList[2]) {
                                _searchBodyWeightVideos(primeriChoosen.first);
                              }

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
    );
  }

  AppBar AppAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: front == true ? const Text("Front body") : const Text("Back body"),
    );
  }

  Padding AppFloatingButton(BuildContext context) {
    return Padding(
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
                level: (frontPartHowHard[partName][0]),
                savedSecond: frontPartHowHard[partName][1]);
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
                                                frontPartHowHard[partName][0] =
                                                    0;
                                                frontPartHowHard[partName][1] =
                                                    0;
                                                sharedPreferencesManager
                                                    .saveMap('partHowHard',
                                                        frontPartHowHard);
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
                level: (backPartHowHard[partName][0]),
                savedSecond: backPartHowHard[partName][1]);
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
                                                backPartHowHard[partName][0] =
                                                    0;
                                                backPartHowHard[partName][1] =
                                                    0;
                                                sharedPreferencesManager
                                                    .saveMap('backPartHowHard',
                                                        backPartHowHard);
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
