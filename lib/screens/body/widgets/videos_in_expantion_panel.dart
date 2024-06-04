import 'package:flutter/material.dart';
import 'package:interval_timer/widgets/youtube_video_player.dart';

class VideosInExpantionPanel extends StatelessWidget {
  final Future<List<String>> videoIds;

  const VideosInExpantionPanel({super.key, required this.videoIds});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: FutureBuilder<List<String>>(
        future: videoIds,
        builder: (context, snapshot) {
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
}
