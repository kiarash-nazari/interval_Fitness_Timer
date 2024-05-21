import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubrVideoPlayer extends StatefulWidget {
  final String videoId;
  const YoutubrVideoPlayer({super.key, required this.videoId});

  @override
  State<YoutubrVideoPlayer> createState() => _YoutubrVideoPlayerState();
}

class _YoutubrVideoPlayerState extends State<YoutubrVideoPlayer> {
  late final YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      onReady: () {
        _controller.addListener(() {});
      },
    );
  }
}
