part of 'learning_cubit.dart';

@immutable
sealed class LearningState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LearningInitial extends LearningState {}

final class FeedbackUploading extends LearningState {}

final class FeedbackUploaded extends LearningState {
  final UserSuccessRate userSuccessRate;

  FeedbackUploaded({required this.userSuccessRate});

  @override
  List<Object?> get props => [userSuccessRate];
}

final class FeedbackAtError extends LearningState {
  final String errorMessage;

  FeedbackAtError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
