import 'package:flutter/material.dart';
import 'package:speech_craft/presentation/app/pages/learning/widgets/lesson_sceen/app_youtube_player.dart';

class LearningScreen extends StatelessWidget {
  final String videoId;

  const LearningScreen({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: AppYouTubePlayer(videoId: videoId),
        ),
        Expanded(
          flex: 3,
          child: Container(),
        ),
      ],
    );
  }
}
