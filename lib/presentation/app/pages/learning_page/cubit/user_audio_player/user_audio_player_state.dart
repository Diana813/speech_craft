part of 'user_audio_player_cubit.dart';

@immutable
sealed class UserAudioPlayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class UserAudioPlayerInitial extends UserAudioPlayerState {}

final class UserAudioLoaded extends UserAudioPlayerState {
  final String audioUrl;

  UserAudioLoaded({required this.audioUrl});

  @override
  List<Object?> get props => [audioUrl];
}


final class UserAudioAtError extends UserAudioPlayerState {
  final String errorMessage;

  UserAudioAtError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}