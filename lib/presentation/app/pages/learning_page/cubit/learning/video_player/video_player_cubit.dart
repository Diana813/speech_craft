import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/data/data_sources/video_data/video_player_adapter/video_player_helper.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/video_player/video_player_state.dart';

import '../../../../../../../data/data_sources/video_data/video_player_adapter/video_player.dart';
import '../../../../../../../data/data_sources/video_data/video_player_adapter/video_player_controller_factory.dart';
import '../../../../../../../data/models/pauses_response/timestamps.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final String videoId;
  late final VideoPlayer _videoPlayer;
  late final StreamSubscription _videoPlayerSubscription;
  late final List<Timestamp> _pauseTimestamps;
  late final int _stopVideoTime;
  late final int _startVideoTime;

  VideoPlayerCubit(this.videoId)
      : super(VideoPlayerState(
          isPlaying: false,
          isBuffering: false,
        )) {
    initialize(videoId);
    List<int> sortedTimestamps = _pauseTimestamps
        .map((value) => value.millis.truncate())
        .toList()
      ..sort();

    VideoPlayerHelper helper = VideoPlayerHelper(_videoPlayer);
    helper.startMonitoringPauseTimes(sortedTimestamps);

    helper.currentTimeStream.listen((event) async {
      if (event) {
        _videoPlayer.pause();
        _stopVideoTime = await _videoPlayer.positionInMillis;

        emit(VideoPlayerState(isPlaying: false, isBuffering: false));

        //recordUserAudio();
      }
    });
  }

  @override
  Future<void> close() {
    _videoPlayerSubscription.cancel();
    _videoPlayer.dispose();
    return super.close();
  }

  void playIfNotPlaying() async{
    if (!state.isPlaying) {
      _videoPlayer.play();
      _startVideoTime = await _videoPlayer.positionInMillis;
    }
  }

  void replay() async {
    _videoPlayer.seekTo(Duration(milliseconds: _startVideoTime));

    _videoPlayer.play();

    emit(VideoPlayerState(isPlaying: true, isBuffering: false));

    await Future.delayed(Duration(milliseconds: _stopVideoTime - _startVideoTime));
    _videoPlayer.pause();

    emit(VideoPlayerState(isPlaying: false, isBuffering: false));
    //recordUserAudio();
  }

  void initialize(String videoId) {
    _videoPlayer = VideoPlayerFactory.create(videoId);
    _videoPlayer.initialize();
    _videoPlayerSubscription = _videoPlayer.onStateChanged.listen((state) {
      emit(state);
    });
  }

  Widget get videoPlayerWidget => _videoPlayer.videoPlayerWidget;
}
