import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../presentation/app/pages/learning_page/cubit/learning/video_player/video_player_state.dart';
import 'video_player.dart';

class DefaultVideoPlayer implements VideoPlayer {
  final YoutubePlayerController _controller;
  final _stateController = StreamController<VideoPlayerState>();

  DefaultVideoPlayer(String videoId)
      : _controller = YoutubePlayerController.fromVideoId(
          videoId: videoId,
          autoPlay: false,
          params: const YoutubePlayerParams(showControls: false),
        ) {
    _controller.stream.listen((YoutubePlayerValue value) {
      _updateState();
    });
  }

  void _updateState() {
    final state = VideoPlayerState(
      isPlaying: _controller.value.playerState == PlayerState.playing,
      isBuffering: _controller.value.playerState == PlayerState.buffering,
    );
    _stateController.add(state);
  }

  @override
  void initialize() {}

  @override
  void play() {
    _controller.playVideo();
    print("controller play video");
  }

  @override
  void pause() {
    _controller.pauseVideo();
  }

  @override
  void seekTo(Duration position) {
    final value = position.inMilliseconds / 1000;
    _controller.seekTo(seconds: value);
  }

  @override
  void dispose() {
    _controller.close();
    _stateController.close();
  }

  @override
  bool get isPlaying => _controller.value.playerState == PlayerState.playing;

  @override
  Stream<VideoPlayerState> get onStateChanged => _stateController.stream;

  @override
  Widget get videoPlayerWidget => DefaultVideoPlayerWidget(
        controller: _controller,
      );
}

class DefaultVideoPlayerWidget extends StatelessWidget {
  final YoutubePlayerController controller;

  const DefaultVideoPlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              color: Colors.black87,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: YoutubePlayer(
                controller: controller,
              ),
            ),
          ),
        ],
      ),
      Container(
        color: Colors.transparent,
      )
    ]);
  }
}
