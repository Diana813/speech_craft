import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/video_player/video_player_state.dart';

import '../../../../../../../common/video_player_adapter/video_player.dart';
import '../../../../../../../common/video_player_adapter/video_player_controller_factory.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final String videoId;
  late final VideoPlayer _videoPlayer;
  late final StreamSubscription _videoPlayerSubscription;

  VideoPlayerCubit(this.videoId)
      : super(VideoPlayerState(
          isPlaying: false,
          isBuffering: false,
        )) {
    initialize(videoId);
  }

  @override
  Future<void> close() {
    _videoPlayerSubscription.cancel();
    _videoPlayer.dispose();
    return super.close();
  }

  void playIfNotPlaying() {
    if (!state.isPlaying) {
      _videoPlayer.play();
    }
  }

  void pause() {
    _videoPlayer.pause();
  }

  void seekTo(Duration position) {
    _videoPlayer.seekTo(position);
  }

  void initialize(String videoId) {
    _videoPlayer = VideoPlayerControllerFactory.create(videoId);
    _videoPlayer.initialize();
    _videoPlayerSubscription = _videoPlayer.onStateChanged.listen((state) {
      emit(state);
    });
  }

  Widget get videoPlayerWidget => _videoPlayer.videoPlayerWidget;
}
