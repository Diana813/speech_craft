import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/learning_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/start_button_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/repeating_view.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/start_button.dart';

import '../../cubit/learning/video_player/video_player_cubit.dart';
import '../../cubit/learning/video_player/video_player_state.dart';

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
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
              builder: (context, state) {
                final cubit = context.read<VideoPlayerCubit>();
                return cubit.videoPlayerWidget;
              },
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: BlocBuilder<LearningCubit, LearningState>(
            builder: (context, state) {
              return BlocBuilder<StartButtonCubit, bool>(
                builder: (context, trainingStarted) {
                  return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
                    builder: (context, videoState) {
                      if (!videoState.isPlaying && trainingStarted) {
                        return const RepeatingView();
                      } else {
                        return const StartButton();
                      }
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
