import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

abstract class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({super.key});
}

class WindowsVideoPlayerWidget extends VideoPlayerWidget {
  final VideoController controller;

  const WindowsVideoPlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Video(controller: controller);
  }
}

class DefaultVideoPlayerWidget extends VideoPlayerWidget {
  final YoutubePlayerController controller;

  const DefaultVideoPlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(controller: controller);
  }
}
