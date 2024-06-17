import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/injection_container.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/translation/translation_cubit.dart';

import '../../../cubit/learning/learning_cubit.dart';
import '../../../cubit/start_button_cubit.dart';
import '../../../cubit/search_results/search_results_cubit.dart';
import '../../../cubit/user_audio_player/user_audio_player_cubit.dart';
import '../../../cubit/video_loader/video_loader_cubit.dart';
import '../../../cubit/video_player/video_player_cubit.dart';
import '../learning_fragment/learning_page_small.dart';

class LearningPageSmallWrapperProvider extends StatelessWidget {
  final String videoId;

  const LearningPageSmallWrapperProvider({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => VideoLoaderCubit(
                videoId: videoId, uploadVideoUseCase: serviceLocator())),
        BlocProvider(
          create: (context) =>
              LearningCubit(feedbackUseCases: serviceLocator()),
        ),
        BlocProvider(
          create: (context) => VideoPlayerCubit(videoId),
        ),
        BlocProvider(
          create: (context) => StartButtonCubit(),
        ),
        BlocProvider(
          create: (context) =>
              TranslationCubit(translationUseCases: serviceLocator()),
        ),
        BlocProvider(
          create: (context) => UserAudioPlayerCubit(userAudioRepository: serviceLocator()),
        ),
        BlocProvider(
          create: (context) => serviceLocator<SearchResultsCubit>(),
        )
      ],
      child: const LearningPageSmall(),
    );
  }
}
