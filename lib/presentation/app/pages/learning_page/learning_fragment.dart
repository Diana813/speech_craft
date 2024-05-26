import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/video_loaded_view.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/video_loading_view.dart';

import '../../../../common/strings.dart';
import '../../../../common/video_player_adapter/video_player_controller.dart';
import 'cubit/learning/video_player/video_player_cubit.dart';

class LearningFragment extends StatelessWidget {
  final String videoId;

  const LearningFragment({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      builder: (context, state) {
        if (state.isBuffering) {
          return const VideoLoadingView();
        } else if (!state.isBuffering &&
            state.position == const Duration(seconds: 0)) {
          return const VideoLoadedView();
        } else {
          return const Center(
            child: Text(generalErrorMessage),
          );
        }
      },
    );
  }
}
