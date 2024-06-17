import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/video_player/video_player_state.dart';

import '../../../../../../../common/video_player_adapter/video_player.dart';
import '../../../../../../../common/video_player_adapter/video_player_controller_factory.dart';
import '../../../../../../../common/video_player_adapter/video_player_helper.dart';
import '../../../../../../../data/models/pauses_response/timestamps.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final String videoId;

  late final VideoPlayer _videoPlayer;
  late final StreamSubscription _videoPlayerSubscription;
  late final VideoPlayerHelper _videoHelper;
  int stopVideoTime = 0;
  int startVideoTime = 0;

  VideoPlayerCubit(this.videoId)
      : super(VideoPlayerState(isPlaying: false, isPaused: false)) {
    initialize(videoId);
  }

  @override
  Future<void> close() async {
    await _videoPlayerSubscription.cancel();
    await _videoPlayer.dispose();
    _videoHelper.dispose();
    return super.close();
  }

  void playIfNotPlaying() async {
    if (!state.isPlaying) {
      await _videoPlayer.play();
      startVideoTime = await _videoPlayer.positionInMillis;
      emit(VideoPlayerState(isPlaying: true, isPaused: false));
    }
  }

  void replay() async {
    emit(VideoPlayerState(isPlaying: true, isPaused: false));

    await _videoPlayer.replay(
        start: Duration(milliseconds: startVideoTime),
        end: Duration(milliseconds: stopVideoTime));

    emit(VideoPlayerState(isPlaying: false, isPaused: true));
  }

  void initialize(String videoId) {
    _videoPlayer = VideoPlayerFactory.create(videoId);
    _videoPlayer.initialize();
    _videoHelper = VideoPlayerHelper(_videoPlayer);
  }

  void monitorTimestamps(List<Timestamp> pauseTimestamps) {
    List<int> sortedTimestamps = pauseTimestamps
        .map((value) => value.millis.truncate())
        .toList()
      ..sort();

    _videoHelper.startMonitoringPauseTimes(sortedTimestamps);

    _videoHelper.currentTimeStream.listen((event) async {
      if (event) {
        await _videoPlayer.pause();
        stopVideoTime = await _videoPlayer.positionInMillis;

        emit(VideoPlayerState(isPlaying: false, isPaused: true));
      }
    });
  }

  void stopMonitoringTimestamps() {
    _videoHelper.dispose();
    emit(VideoPlayerState(isPlaying: false, isPaused: false));
  }

  Widget get videoPlayerWidget => _videoPlayer.videoPlayerWidget;
}
