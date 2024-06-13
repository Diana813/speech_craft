import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/injection_container.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/search_results/search_results_cubit.dart';

import '../../../cubit/learning/control_cubit.dart';
import '../../../cubit/learning/learning_cubit.dart';
import '../../../cubit/learning/start_button_cubit.dart';
import '../../../cubit/learning/video_player/video_player_cubit.dart';
import '../../../learning_fragment.dart';

class LearningFragmentWrapperProvider extends StatelessWidget {
  final String videoId;

  const LearningFragmentWrapperProvider({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LearningCubit(
              uploadVideoUseCase: serviceLocator(), videoId: videoId),
        ),
        BlocProvider(
          create: (context) => VideoPlayerCubit(videoId),
        ),
        BlocProvider(
          create: (context) => StartButtonCubit(),
        ),
        BlocProvider(
          create: (context) => ControlCubit(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<SearchResultsCubit>(),
        )
      ],
      child: const LearningFragment(),
    );
  }
}
