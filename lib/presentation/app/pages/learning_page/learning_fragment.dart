import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/video_loader/video_loader_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/video_player/video_player_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/video_loaded_view.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/video_loading_view.dart';

import '../../../../common/strings.dart';

class LearningFragment extends StatelessWidget {
  const LearningFragment({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<VideoLoaderCubit>(context).onVideoUploading();

    return BlocBuilder<VideoLoaderCubit, VideoLoaderState>(
      builder: (context, state) {
        if (state is VideoUploading) {
          return const VideoLoadingView();
        } else if (state is VideoUploaded) {
          BlocProvider.of<VideoPlayerCubit>(context)
              .monitorTimestamps(state.pauseTimestamps);
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
