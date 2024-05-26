import 'dart:async';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'video_player_controller.dart';

class WindowsVideoPlayerController implements VideoPlayerController {
  final Player _player;
  late final VideoController controller;
  final _stateController = StreamController<VideoPlayerState>();

  late final StreamSubscription<bool> _playingSubscription;
  late final StreamSubscription<Duration> _positionSubscription;
  late final StreamSubscription<Duration> _durationSubscription;
  late final StreamSubscription<bool> _bufferingSubscription;

  WindowsVideoPlayerController(String dataSource)
      : _player = _initializePlayer(dataSource) {
    _initializeController();
    _player.open(Media(dataSource));

    _playingSubscription = _player.stream.playing.listen((bool playing) {
      _updateState();
    });
    _positionSubscription = _player.stream.position.listen((Duration position) {
      _updateState();
    });
    _durationSubscription = _player.stream.duration.listen((Duration duration) {
      _updateState();
    });
    _bufferingSubscription = _player.stream.buffering.listen((bool buffering) {
      _updateState();
    });
  }

  static Player _initializePlayer(String dataSource) {
    MediaKit.ensureInitialized();
    return Player();
  }

  void _initializeController() {
    controller = VideoController(_player);
  }

  void _updateState() {
    final state = VideoPlayerState(
      isPlaying: _player.state.playing,
      position: _player.state.position,
      duration: _player.state.duration,
      isBuffering: _player.state.buffering,
    );
    _stateController.add(state);
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
}
