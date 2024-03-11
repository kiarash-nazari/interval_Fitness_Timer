import 'package:flutter/material.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatelessWidget {
  const Youtube({super.key, required this.videoId});

  final String videoId;

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    try {
      return YoutubePlayer(
        onEnded: (metaData) {
          controller.play();
        },
        onReady: () {},
        topActions: [
          const SizedBox(width: 8.0),
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 28.0,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        controller: controller,
        showVideoProgressIndicator: true,
        width: double.infinity,
        progressColors: const ProgressBarColors(
          playedColor: AppColors.mainblue,
          handleColor: AppColors.mainblue,
        ),
      );
    } catch (e) {
      print(e);
    }
    return const SizedBox();
  }
}
