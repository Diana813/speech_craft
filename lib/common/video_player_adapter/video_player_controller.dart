abstract class VideoPlayerController {
  void initialize();
  void play();
  void pause();
  void dispose();
  void seekTo(Duration position);
  bool get isPlaying;

  Stream<VideoPlayerState> get onStateChanged;
}

class VideoPlayerState {
  final bool isPlaying;
  final Duration position;
  final Duration duration;
  final bool isBuffering;

  VideoPlayerState({
    required this.isPlaying,
    required this.position,
    required this.duration,
    required this.isBuffering,
  });
}
