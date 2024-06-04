import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/svg_codes.dart';
import 'package:interval_timer/screens/body/cubit/body_compose_cubit.dart';
import 'package:interval_timer/screens/body/widgets/next_button.dart';
import 'package:interval_timer/utils/shared_perfrences_manager.dart';
import 'dart:math' as math;

class WholeBodyPartsAtCenter extends StatelessWidget {
  final List<String> primeriChoosen;
  final SharedPreferencesManager sharedPreferencesManager;
  final Map<String, dynamic> frontPartHowHard;
  final Map<String, dynamic> backPartHowHard;
  final Map<String, String> frontBodyColor;
  final Map<String, String> backBodyColor;
  final Map<String, List<double>> frontPartPositions;
  final Map<String, List<double>> backPartPositions;
  final Map<String, List<double>> frontPartSizes;
  final Map<String, List<double>> backPartSizes;
  final VoidCallback backMakeIt;
  final VoidCallback makeIt;
  final Function(String) togglePart;
  final Function(String) backTogglePart;

  const WholeBodyPartsAtCenter({
    Key? key,
    required this.primeriChoosen,
    required this.sharedPreferencesManager,
    required this.frontPartHowHard,
    required this.backPartHowHard,
    required this.frontBodyColor,
    required this.backBodyColor,
    required this.frontPartPositions,
    required this.backPartPositions,
    required this.frontPartSizes,
    required this.backPartSizes,
    required this.backMakeIt,
    required this.makeIt,
    required this.togglePart,
    required this.backTogglePart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
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
        NextButtonRow(
          primeriChoosen: primeriChoosen,
          sharedPreferencesManager: sharedPreferencesManager,
          frontPartHowHard: frontPartHowHard,
          backPartHowHard: backPartHowHard,
          frontBodyColor: frontBodyColor,
          backBodyColor: backBodyColor,
          backMakeIt: backMakeIt,
          makeIt: makeIt,
        )
      ]),
    );
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
