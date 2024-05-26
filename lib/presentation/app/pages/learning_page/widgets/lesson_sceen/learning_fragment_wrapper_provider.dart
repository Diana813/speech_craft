import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/injection_container.dart';

import '../../cubit/learning/video_player/video_player_cubit.dart';
import '../../learning_fragment.dart';

class LearningFragmentWrapperProvider extends StatelessWidget {
  final String videoId;

  const LearningFragmentWrapperProvider({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoPlayerCubit(videoId, serviceLocator()),
      child: LearningFragment(
        videoId: videoId,
      ),
    );
  }
}
