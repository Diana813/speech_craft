part of 'learning_cubit.dart';

@immutable
sealed class LearningState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LearningInitial extends LearningState {}

final class VideoUploading extends LearningState {}

final class VideoUploaded extends LearningState {
  final List<Timestamp> pauseTimestamps;

  VideoUploaded({required this.pauseTimestamps});

  @override
  List<Object?> get props => [pauseTimestamps];
}

final class VideoUploadingAtError extends LearningState {
  final String errorMessage;

  VideoUploadingAtError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class SentenceRepeatedAndSubmitted extends LearningState {}
