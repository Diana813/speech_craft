import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:speech_craft/common/video_player_adapter/video_player.dart';
import 'package:speech_craft/common/video_player_adapter/windows_video_player.dart';

import 'default_video_player.dart';

class VideoPlayerControllerFactory {
  static VideoPlayer create(String dataSource) {
    if(kIsWeb){
      return DefaultVideoPlayer(dataSource);
    }else {
      if (Platform.isWindows) {
        return WindowsVideoPlayer(dataSource);
      } else {
        return DefaultVideoPlayer(dataSource);
      }
    }
  }
}
