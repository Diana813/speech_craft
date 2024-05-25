import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../cubit/learning/video_player/video_player_cubit.dart';
import '../../learning_fragment.dart';

class LearningFragmentWrapperProvider extends StatelessWidget {
  final String videoId;

  const LearningFragmentWrapperProvider({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final String videoUrl = 'https://www.youtube.com/watch?v=$videoId';
    final VideoPlayerController videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    return BlocProvider(
      create: (context) => VideoPlayerCubit(videoPlayerController),
      child: LearningFragment(
        videoId: videoId,
      ),
    );
  }
}
