import 'package:flutter/material.dart';

abstract class VideoPlayer {
  void initialize();

  Future<void> play();

  Future<void> pause();

  Future<void> dispose();

  Future<void> replay({required Duration start, required Duration end});

  Future<int> get positionInMillis;

  bool get isPlaying;

  Widget get videoPlayerWidget;
}
