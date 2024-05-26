import 'dart:io' show Platform;

import 'package:speech_craft/common/video_player_adapter/video_player_controller.dart';
import 'package:speech_craft/common/video_player_adapter/windows_video_player_controller.dart';

import 'default_video_player_controller.dart';

class VideoPlayerControllerFactory {
  static VideoPlayerController create(String dataSource) {
    if (Platform.isWindows) {
      return WindowsVideoPlayerController(dataSource);
    } else {
      return DefaultVideoPlayerController(dataSource);
    }
  }
}
