import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/video_loaded_view.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/video_loading_view.dart';

import '../../../../common/strings.dart';
import 'cubit/learning/learning_cubit.dart';

class LearningFragment extends StatelessWidget {
  final String videoId;

  const LearningFragment({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LearningCubit>(context).onVideoUploading();

    return BlocBuilder<LearningCubit, LearningState>(
      builder: (context, state) {
        if (state is VideoUploading) {
          return const VideoLoadingView();
        } else if (state is VideoUploaded) {
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
