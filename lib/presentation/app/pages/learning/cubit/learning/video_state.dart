part of 'video_cubit.dart';

@immutable
sealed class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object?> get props => [];
}

final class VideoInitial extends VideoState {
  const VideoInitial();
}

final class VideoLoading extends VideoState {
  const VideoLoading();
}

final class VideoLoaded extends VideoState {
  final String videoId;

  const VideoLoaded({required this.videoId});

  @override
  List<Object?> get props => [videoId];
}

final class VideoAtError extends VideoState {
  final String errorMessage;

  const VideoAtError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
