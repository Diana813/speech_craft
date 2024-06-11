import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import '../../presentation/app/pages/learning_page/cubit/learning/video_player/video_player_state.dart';
import '../strings.dart';
import 'video_player.dart';

class WindowsVideoPlayer implements VideoPlayer {
  final Player _player;
  late final VideoController _controller;
  final _stateController = StreamController<VideoPlayerState>();

  late final StreamSubscription<bool> _playingSubscription;
  late final StreamSubscription<Duration> _positionSubscription;
  late final StreamSubscription<Duration> _durationSubscription;
  late final StreamSubscription<bool> _bufferingSubscription;

  WindowsVideoPlayer(String videoId) : _player = _initializePlayer() {
    _initializeController();
    String url = _getVideoUrl(videoId: videoId);
    _player.open(Media(url));

    // _playingSubscription = _player.stream.playing.listen((bool playing) {
    //   print("Playing state changed. Playing: $playing");
    //   _updateState();
    // });
    // _positionSubscription = _player.stream.position.listen((Duration position) {
    //   _updatePosition();
    // });
    // _durationSubscription = _player.stream.duration.listen((Duration duration) {
    //   _updatePosition();
    // });
    // _bufferingSubscription = _player.stream.buffering.listen((bool buffering) {
    //   print("Playing state changed. Buffering: $buffering");
    //   _updateState();
    // });
  }

  static Player _initializePlayer() {
    MediaKit.ensureInitialized();
    return Player();
  }

  void _initializeController() {
    _controller = VideoController(_player);
  }

  void _updateState() {
    final state = VideoPlayerState(
      isPlaying: _player.state.playing,
      isBuffering: _player.state.buffering,
    );
    _stateController.add(state);
  }

  VideoPlayerPosition _updatePosition() {
    return VideoPlayerPosition(
      position: _player.state.position,
      duration: _player.state.duration,
    );
  }

  @override
  void initialize() {}

  @override
  void play() {
    _player.play();
  }

  @override
  void pause() {
    _player.pause();
  }

  @override
  void seekTo(Duration position) {
    _player.seek(position);
  }

  @override
  void dispose() {
    _playingSubscription.cancel();
    _positionSubscription.cancel();
    _durationSubscription.cancel();
    _bufferingSubscription.cancel();
    _player.dispose();
    _stateController.close();
  }

  @override
  bool get isPlaying => _player.state.playing;

  @override
  Stream<VideoPlayerState> get onStateChanged => _stateController.stream;

  @override
  Widget get videoPlayerWidget => WindowsVideoPlayerWidget(
        controller: _controller,
      );

  String _getVideoUrl({required String videoId}) {
    String youtubeVideoUrl = '$youtubeUrl/watch?v=$videoId';
    return Uri.parse('http://127.0.0.1:5000/api/video')
        .replace(queryParameters: {'youtube_url': youtubeVideoUrl}).toString();
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
