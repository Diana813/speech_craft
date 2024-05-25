part of 'learning_cubit.dart';

@immutable
sealed class LearningState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LearningInitial extends LearningState {}

final class PausesLoading extends LearningState {}

final class PausesLoaded extends LearningState {}

final class PausesAtError extends LearningState {}

final class VideoPlaying extends LearningState {}

final class VideoPaused extends LearningState {}

final class SentenceRepeatedAndSubmitted extends LearningState {}
