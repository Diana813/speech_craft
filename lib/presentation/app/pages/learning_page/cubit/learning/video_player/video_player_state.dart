part of 'video_player_cubit.dart';

@immutable
sealed class VideoPlayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class VideoPlayerInitial extends VideoPlayerState {}

class VideoFinished extends VideoPlayerState {}

class VideoLoading extends VideoPlayerState {}

class VideoLoaded extends VideoPlayerState {}

class VideoPlaying extends VideoPlayerState {
  final bool isPlayClicked;

  VideoPlaying({required this.isPlayClicked});
}

class VideoPaused extends VideoPlayerState {
  final bool isPlayClicked;

  VideoPaused({required this.isPlayClicked});
}

class VideoPlayerAtError extends VideoPlayerState {
  final String message;

  VideoPlayerAtError({required this.message});

  @override
  List<Object?> get props => [message];
}
