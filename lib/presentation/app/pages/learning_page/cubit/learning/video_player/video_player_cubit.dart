import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/video_player/video_player_state.dart';

import '../../../../../../../common/video_player_adapter/video_player.dart';
import '../../../../../../../common/video_player_adapter/video_player_controller_factory.dart';
import '../../../../../../../common/video_player_adapter/video_player_helper.dart';
import '../../../../../../../data/models/pauses_response/timestamps.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final String videoId;

  late final VideoPlayer _videoPlayer;
  late final StreamSubscription _videoPlayerSubscription;
  late final int _stopVideoTime;
  late final int _startVideoTime;
  late final VideoPlayerHelper _videoHelper;

  VideoPlayerCubit(this.videoId)
      : super(VideoPlayerState(
          isPlaying: false,
          isPaused: false,
          isBuffering: false,
        )) {
    initialize(videoId);
  }

  @override
  Future<void> close() {
    _videoPlayerSubscription.cancel();
    _videoPlayer.dispose();
    _videoHelper.dispose();
    return super.close();
  }

  void playIfNotPlaying() async {
    if (!state.isPlaying) {
      _videoPlayer.play();
      _startVideoTime = await _videoPlayer.positionInMillis;
      emit(VideoPlayerState(
          isPlaying: true, isPaused: false, isBuffering: false));
    }
  }

  void replay() async {
    _videoPlayer.seekTo(Duration(milliseconds: _startVideoTime));

    _videoPlayer.play();

    emit(
        VideoPlayerState(isPlaying: true, isPaused: false, isBuffering: false));

    await Future.delayed(
        Duration(milliseconds: _stopVideoTime - _startVideoTime));
    _videoPlayer.pause();

    emit(
        VideoPlayerState(isPlaying: false, isPaused: true, isBuffering: false));
    //_recordUserAudio();
  }

  void initialize(String videoId) {
    _videoPlayer = VideoPlayerFactory.create(videoId);
    _videoPlayer.initialize();
    _videoHelper = VideoPlayerHelper(_videoPlayer);
    _videoPlayerSubscription = _videoPlayer.onStateChanged.listen((state) {
      emit(state);
    });
  }

  void monitorTimestamps(List<Timestamp> pauseTimestamps) {
    List<int> sortedTimestamps = pauseTimestamps
        .map((value) => value.millis.truncate())
        .toList()
      ..sort();

    _videoHelper.startMonitoringPauseTimes(sortedTimestamps);

    _videoHelper.currentTimeStream.listen((event) async {
      if (event) {
        _videoPlayer.pause();
        _stopVideoTime = await _videoPlayer.positionInMillis;

        emit(VideoPlayerState(
            isPlaying: false, isPaused: true, isBuffering: false));

        //_recordUserAudio();
      }
    });
  }

  Widget get videoPlayerWidget => _videoPlayer.videoPlayerWidget;
}
