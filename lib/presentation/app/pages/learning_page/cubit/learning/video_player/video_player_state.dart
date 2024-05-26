part of 'video_player_cubit.dart';

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