import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/body_parts_position.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/body/cubit/body_compose_cubit.dart';
import 'package:interval_timer/screens/body/models/show_video_box.dart';
import 'package:interval_timer/screens/body/widgets/app_bar.dart';
import 'package:interval_timer/screens/body/widgets/floating_body_change.dart';
import 'package:interval_timer/screens/body/widgets/whole_body_parts.dart';
import 'package:interval_timer/screens/body/widgets/youtube_button.dart';
import 'package:interval_timer/utils/format_time.dart';
import 'package:interval_timer/utils/shared_perfrences_manager.dart';
import 'package:interval_timer/utils/youtube/youtube_service.dart';
import 'package:interval_timer/widgets/youtube_video_player.dart';

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
      print(_videoIds);
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
      floatingActionButton: FloatingBodyChange(
        front: front,
        toggleBody: () {
          setState(() {
            context.read<BodyComposeCubit>().toggleBody();
            front = !front;
          });
        },
      ),
      backgroundColor: AppColors.bgBodyParts,
      appBar: AppAppBar(front: front),
      body: Stack(
        children: [
          YouTubeButton(
              videoIds: _videoIds,
              primeriChoosen: primeriChoosen,
              searchVideos: _searchVideos,
              searchMobilityVideos: _searchMobilityVideos,
              searchBodyWeightVideos: _searchBodyWeightVideos),
          WholeBodyPartsAtCenter(
              primeriChoosen: primeriChoosen,
              sharedPreferencesManager: sharedPreferencesManager,
              frontPartHowHard: frontPartHowHard,
              backPartHowHard: backPartHowHard,
              frontBodyColor: frontBodyColor,
              backBodyColor: backBodyColor,
              frontPartPositions: frontPartPositions,
              backPartPositions: backPartPositions,
              frontPartSizes: frontPartSizes,
              backPartSizes: backPartSizes,
              backMakeIt: backMakeIt,
              makeIt: () {
                setState(() {
                  makeIt();
                });
              },
              togglePart: togglePart,
              backTogglePart: backTogglePart)
        ],
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
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (context) {
                                    print(partName);
                                    return SingleChildScrollView(
                                      child: ShowVideoBox(
                                          primeriChoosen: partName),
                                    );
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
}
