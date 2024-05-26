import 'dart:async';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'video_player_controller.dart';

class DefaultVideoPlayerController implements VideoPlayerController {
  final YoutubePlayerController _controller;
  final _stateController = StreamController<VideoPlayerState>();

  DefaultVideoPlayerController(String videoId)
      : _controller = YoutubePlayerController.fromVideoId(
          videoId: videoId,
          autoPlay: false,
          params: const YoutubePlayerParams(
            showFullscreenButton: true,
          ),
        ) {
    _controller.listen((YoutubePlayerValue value) {
      _updateState();
    });
  }

  void _updateState() async {
    final double currentTime = await _controller.currentTime;
    final double duration = await _controller.duration;
    final state = VideoPlayerState(
      isPlaying: _controller.value.playerState == PlayerState.playing,
      position: Duration(milliseconds: (currentTime * 1000).toInt()),
      duration: Duration(milliseconds: (duration * 1000).toInt()),
      isBuffering: _controller.value.playerState == PlayerState.buffering,
    );
    _stateController.add(state);
  }

  @override
  void initialize() {}

  @override
  void play() {
    _controller.playVideo();
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
}
