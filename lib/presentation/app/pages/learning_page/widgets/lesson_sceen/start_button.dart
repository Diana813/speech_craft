import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/strings.dart';
import '../../../../../common/theme.dart';
import '../../cubit/learning/start_button_cubit.dart';
import '../../cubit/learning/video_player/video_player_cubit.dart';

class StartButton extends StatelessWidget {
  final StartButtonState trainingState;

  const StartButton({super.key, required this.trainingState});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartButtonCubit(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              trainingState == StartButtonState.trainingStarted
                  ? ''
                  : startTraining,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          IconButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 20),
              ),
              shadowColor:
                  WidgetStateProperty.all<Color>(AppTheme.grey.shade700),
              elevation: trainingState == StartButtonState.trainingStarted
                  ? null
                  : WidgetStateProperty.all(1.0),
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return AppTheme.grey;
                  }
                  if (trainingState == StartButtonState.trainingStarted) {
                    return AppTheme.grey.shade100;
                  }
                  return AppTheme.lightGrey;
                },
              ),
            ),
            onPressed: trainingState == StartButtonState.trainingStarted
                ? null
                : () {
                    BlocProvider.of<VideoPlayerCubit>(context)
                        .playIfNotPlaying();
                    BlocProvider.of<StartButtonCubit>(context).startTraining();
                  },
            icon: Icon(
              Icons.play_arrow,
              size: 100,
              color: trainingState == StartButtonState.trainingStarted
                  ? Colors.grey
                  : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
