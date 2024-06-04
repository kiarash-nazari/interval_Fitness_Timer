import 'package:flutter/material.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/body/models/show_video_box.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class YouTubeButton extends StatelessWidget {
  final Future<List<String>>? videoIds;
  final List<String> primeriChoosen;
  final Function(String) searchVideos;
  final Function(String) searchMobilityVideos;
  final Function(String) searchBodyWeightVideos;

  const YouTubeButton({
    Key? key,
    required this.videoIds,
    required this.primeriChoosen,
    required this.searchVideos,
    required this.searchMobilityVideos,
    required this.searchBodyWeightVideos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                return ShowVideoBox(
                  primeriChoosen: primeriChoosen.first,
                );
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
}
