import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:video_player/video_player.dart';

part 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final VideoPlayerController _videoPlayerController;

  VideoPlayerCubit(this._videoPlayerController) : super(VideoPlayerInitial()) {
    _initialize();
  }

  VideoPlayerController get videoPlayerController => _videoPlayerController;

  void _initialize() async {
    _videoPlayerController.addListener(_videoPlayerListener);
    await _videoPlayerController.initialize();
    emit(VideoPlayerInitial());
  }

  void _videoPlayerListener() {
    if (_videoPlayerController.value.hasError) {
      emit(VideoPlayerAtError(message: apiFailureErrorMessage));
    } else if (_videoPlayerController.value.isPlaying) {
      emit(VideoPlaying(isPlayClicked: true));
    } else if (_videoPlayerController.value.isBuffering) {
      emit(VideoLoading());
    } else if (_videoPlayerController.value.isCompleted) {
      emit(VideoLoaded());
    } else if (_videoPlayerController.value.position == _videoPlayerController.value.duration) {
      emit(VideoFinished());
    } else {
      emit(VideoPaused(isPlayClicked: false));
    }
  }

  @override
  Future<void> close() {
    _videoPlayerController.dispose();
    return super.close();
  }

  void play() {
    _videoPlayerController.play();
  }

  void pause() {
    _videoPlayerController.pause();
  }

  void seekTo(Duration position) {
    _videoPlayerController.seekTo(position);
  }
}

