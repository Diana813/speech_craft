import 'package:flutter/material.dart';

import '../../presentation/app/pages/learning_page/cubit/learning/video_player/video_player_state.dart';

abstract class VideoPlayer {
  void initialize();

  void play();

  void pause();

  void dispose();

  void seekTo(Duration position);

  bool get isPlaying;

  Stream<VideoPlayerState> get onStateChanged;

  Widget get videoPlayerWidget;
}

class VideoPlayerPosition {
  final Duration position;
  final Duration duration;

  VideoPlayerPosition({
    required this.position,
    required this.duration,
  });
}
