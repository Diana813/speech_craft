part of 'video_loader_cubit.dart';

@immutable
sealed class VideoLoaderState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class VideoLoaderInitial extends VideoLoaderState {}

final class VideoUploading extends VideoLoaderState {}

final class VideoUploaded extends VideoLoaderState {
  final List<Timestamp> pauseTimestamps;

  VideoUploaded({required this.pauseTimestamps});

  @override
  List<Object?> get props => [pauseTimestamps];
}

final class VideoUploadingAtError extends VideoLoaderState {
  final String errorMessage;

  VideoUploadingAtError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
