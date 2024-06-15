part of 'learning_cubit.dart';

@immutable
sealed class LearningState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LearningInitial extends LearningState {}


final class AudioRecordedState extends LearningState {
  final Uint8List audioBytes;

  AudioRecordedState({required this.audioBytes});

  @override
  List<Object?> get props => [audioBytes];
}
