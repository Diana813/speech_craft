import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/injection_container.dart';

import '../../cubit/learning/learning_cubit.dart';
import '../../cubit/learning/video_player/video_player_cubit.dart';
import '../../learning_fragment.dart';

class LearningFragmentWrapperProvider extends StatelessWidget {
  final String videoId;

  const LearningFragmentWrapperProvider({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LearningCubit(uploadVideoUseCase: serviceLocator(), videoId: videoId),
      child: BlocProvider(
        create: (context) => VideoPlayerCubit(videoId),
        child: LearningFragment(
          videoId: videoId,
        ),
      ),
    );
  }
}
