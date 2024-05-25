import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/video_loaded_view.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/video_loading_view.dart';

import '../../../../common/strings.dart';
import 'cubit/learning/video_player/video_player_cubit.dart';

class LearningFragment extends StatelessWidget {
  final String videoId;

  const LearningFragment({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      builder: (context, state) {
        if (state is VideoLoading) {
          return const VideoLoadingView();
        } else if (state is VideoLoaded) {
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
