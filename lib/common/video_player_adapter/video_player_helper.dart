import 'dart:async';

import 'package:speech_craft/common/video_player_adapter/video_player.dart';


class VideoPlayerHelper {
  final VideoPlayer player;
  final _streamController = StreamController<bool>();
  Timer? _timer;

  VideoPlayerHelper(this.player);

  void startMonitoringPauseTimes(List<int> stopTimes) async {
    int nextTimestampIndex = 0;

    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) async {
      var currentTime = await player.positionInMillis;

      if (currentTime >= (stopTimes[nextTimestampIndex] - 50)) {
        _streamController.add(true);
        nextTimestampIndex++;
      }
    });
  }

  void dispose() {
    _timer?.cancel();
    _streamController.close();
  }

  Stream<bool> get currentTimeStream => _streamController.stream;
}