import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/repeating_view.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/start_button.dart';
import 'package:video_player/video_player.dart';

import '../../cubit/learning/video_player/video_player_cubit.dart';

class VideoLoadedView extends StatelessWidget {
  const VideoLoadedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Container(
              color: Colors.black87,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: VideoPlayer(BlocProvider.of<VideoPlayerCubit>(context)
                  .videoPlayerController)),
        ),
        Expanded(
          flex: 3,
          child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
            builder: (context, state) {
              if (state is VideoPaused) {
                return const RepeatingView();
              } else {
                return const StartButton();
              }
            },
          ),
        ),
      ],
    );
  }
}
