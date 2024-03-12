import 'package:flutter/material.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/utils/youtube/youtube_player.dart';
import 'package:interval_timer/widgets/glassmorphism.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExerciseBox extends StatefulWidget {
  ExerciseBox(
      {super.key,
      required this.borderColor,
      required this.children,
      required this.size,
      required this.header,
      required this.visible,
      required this.h,
      required this.videoId});

  final Size size;
  final String header;
  bool visible;
  final List<Widget> children;
  final Color borderColor;
  double h;
  final String videoId;

  @override
  State<ExerciseBox> createState() => _ExerciseBoxState();
}

class _ExerciseBoxState extends State<ExerciseBox> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(10),
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
      width: widget.size.width / 1.1,
      height: widget.h,
      child: Center(
        child: GestureDetector(
          onTap: () => setState(() {
            widget.visible = !widget.visible;
            widget.h = widget.visible ? 350 : 50;
          }),
          child: Glassmorphism(
              borderColor: widget.borderColor,
              blur: .2,
              opacity: .2,
              radius: 20,
              bgColor: Colors.white,
              child: Center(
                  child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('How to do as ${widget.header} '),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                              backgroundColor: AppColors.bgCircularPercent,
                              content: SizedBox(
                                  width: 500,
                                  height: 500,
                                  child: Youtube(videoId: widget.videoId)),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        MdiIcons.chatQuestion,
                        shadows: [
                          Shadow(
                              color: AppColors.mainRed.withOpacity(.7),
                              blurRadius: 10,
                              offset: const Offset(2, 2))
                        ],
                      ),
                      color: Colors.amber,
                      iconSize: 30,
                      padding: const EdgeInsets.all(10),
                      highlightColor: AppColors.mainblue,
                    ),
                    Column(
                      children: [
                        10.heightBox,
                        Text(
                          textAlign: TextAlign.left,
                          widget.header,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Visibility(
                          visible: widget.visible,
                          child: Column(
                            children: widget.children,
                          ),
                        ),
                      ],
                    ),
                    30.widthBox
                  ],
                ),
              ))),
        ),
      ),
    );
  }
}
