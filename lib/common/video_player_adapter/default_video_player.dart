import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'video_player.dart';

class DefaultVideoPlayer implements VideoPlayer {
  final YoutubePlayerController _controller;
  late final String videoId;

  DefaultVideoPlayer(this.videoId)
      : _controller = YoutubePlayerController.fromVideoId(
          videoId: videoId,
          autoPlay: false,
          params: const YoutubePlayerParams(
              showControls: false, enableCaption: false),
        ) {}

  @override
  void initialize() {}

  @override
  Future<void> play() async {
    await _controller.playVideo();
  }

  @override
  Future<void> pause() async {
    await _controller.pauseVideo();
  }

  @override
  Future<void> replay({required Duration start, required Duration end}) async {
    final startSeconds = start.inMilliseconds / 1000;
    
    _controller.loadVideoById(
        videoId: videoId, startSeconds: startSeconds);

    await Future.delayed(
        Duration(milliseconds: end.inMilliseconds - start.inMilliseconds));
    await _controller.pauseVideo();
  }

  @override
  Future<void> dispose() async {
    await _controller.close();
  }

  @override
  bool get isPlaying => _controller.value.playerState == PlayerState.playing;

  @override
  Widget get videoPlayerWidget => DefaultVideoPlayerWidget(
        controller: _controller,
      );

  @override
  Future<int> get positionInMillis async {
    return (await _controller.currentTime * 1000).toInt();
  }
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
