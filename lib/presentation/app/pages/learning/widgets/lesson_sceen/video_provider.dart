import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning/cubit/learning/video_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning/learning_screen.dart';

class LessonScreenWrapperProvider extends StatelessWidget {
  final String videoId;

  const LessonScreenWrapperProvider({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VideoCubit>(
      create: (context) => VideoCubit(),
      child: LearningScreen(videoId: videoId),
    );
  }
}
