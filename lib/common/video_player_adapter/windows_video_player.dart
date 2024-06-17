import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import '../../../../common/strings.dart';
import 'video_player.dart';

class WindowsVideoPlayer implements VideoPlayer {
  final Player _player;
  late final VideoController _controller;

  WindowsVideoPlayer(String videoId) : _player = _initializePlayer() {
    _initializeController();
    String url = _getVideoUrl(videoId: videoId);
    _player.open(Media(url));
    _player.pause();
  }

  static Player _initializePlayer() {
    MediaKit.ensureInitialized();
    return Player();
  }

  void _initializeController() {
    _controller = VideoController(_player);
  }

  @override
  void initialize() {}

  @override
  Future<void> play() async {
    await _player.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> replay({required Duration start, required Duration end}) async {
    await _player.seek(start);
    await _player.play();
    await Future.delayed(
        Duration(milliseconds: end.inMilliseconds - start.inMilliseconds));
    await _player.pause();
  }

  @override
  Future<void> dispose() async {
    await _player.dispose();
  }

  @override
  bool get isPlaying => _player.state.playing;

  @override
  Widget get videoPlayerWidget => WindowsVideoPlayerWidget(
        controller: _controller,
      );

  String _getVideoUrl({required String videoId}) {
    String youtubeVideoUrl = '$youtubeUrl/watch?v=$videoId';
    return Uri.parse('http://127.0.0.1:5000/api/video')
        .replace(queryParameters: {'youtube_url': youtubeVideoUrl}).toString();
  }

  @override
  Future<int> get positionInMillis async {
    return _player.state.position.inMilliseconds;
  }
}

class WindowsVideoPlayerWidget extends StatelessWidget {
  final VideoController controller;

  const WindowsVideoPlayerWidget({super.key, required this.controller});

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
              child: Video(
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
