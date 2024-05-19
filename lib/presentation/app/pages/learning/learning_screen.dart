import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/learning/video_cubit.dart';

class LearningScreen extends StatelessWidget {
  final String videoId;

  const LearningScreen({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(builder: (context, state) {
      return Text(videoId);
    });
  }
}
