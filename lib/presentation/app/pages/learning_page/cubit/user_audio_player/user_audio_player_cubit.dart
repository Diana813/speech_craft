import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:speech_craft/domain/repositories/user_audio_repository.dart';

import '../../../../../../common/audio_helper.dart';

part 'user_audio_player_state.dart';

class UserAudioPlayerCubit extends Cubit<UserAudioPlayerState> {
  final UserAudioRepository userAudioRepository;
  late final AudioHelper _audioHelper;

  UserAudioPlayerCubit({required this.userAudioRepository}) : super(UserAudioPlayerInitial()){
    _initialize();
  }

  Future<void> uploadUserAudio() async {
    final userAudioOrFailure = await userAudioRepository.fetchUserAudioUrl();

    userAudioOrFailure.fold(
        (url) => emit(UserAudioLoaded(audioUrl: url)),
        (failure) => emit(UserAudioAtError(errorMessage: failure.getMessage()))
    );
  }

  void playAudio(String url) async {
    await _audioHelper.play(url);
  }

  void _initialize() {
    _audioHelper = AudioHelper();
  }

  @override
  Future<void> close() {
    _audioHelper.dispose();
    return super.close();
  }
}
