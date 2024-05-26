import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:speech_craft/domain/use_cases/video_use_cases.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../../../../common/video_player_adapter/video_player_controller.dart';
import '../../../../../../../common/video_player_adapter/video_player_controller_factory.dart';
import '../../../widgets/lesson_sceen/video_player.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final String videoId;
  final UploadVideoUseCase _uploadVideoUseCase;
  late final VideoPlayerController _controller;

  VideoPlayerCubit(this.videoId, this._uploadVideoUseCase)
      : super(VideoPlayerState(
    isPlaying: false,
    position: Duration.zero,
    duration: Duration.zero,
    isBuffering: false,
  )) {
    _uploadVideoUseCase.call(params: VideoUrlParams(videoId: videoId));

    _controller = VideoPlayerControllerFactory.create(videoId);
    _controller.onStateChanged.listen((state) {
      emit(state);
    });
  }

  @override
  Future<void> close() {
    _controller.dispose();
    return super.close();
  }

  void playIfNotPlaying() {
    if (!state.isPlaying) {
      _controller.play();
    }
  }

  void pause(){
    _controller.pause();
  }

  void seekTo(Duration position) {
    _controller.seekTo(position);
  }

  void initialize(String videoId) {
    _controller.dispose();
    _controller = VideoPlayerControllerFactory.create(videoId);
    _controller.onStateChanged.listen((state) {
      emit(state);
    });
    _controller.initialize();
  }

  Widget buildVideoPlayerWidget() {
    if (Platform.isWindows) {
      return WindowsVideoPlayerWidget(controller: _controller as VideoController);
    } else {
      return DefaultVideoPlayerWidget(controller: _controller as YoutubePlayerController);
    }
  }
}