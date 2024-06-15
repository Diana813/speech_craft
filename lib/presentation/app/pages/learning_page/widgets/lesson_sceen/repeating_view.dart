import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/learning_cubit.dart';

import '../../../../../../common/strings.dart';
import '../../../../../common/theme.dart';
import 'app_button.dart';

class RepeatingView extends StatelessWidget {
  const RepeatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            repeat,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: JumpingDots(color: AppTheme.tale.shade700, radius: 15),
        ),
        AppButton(
          onPressed: () =>
              context.read<LearningCubit>().onUserRecordingSubmitPressed(),
          child: Text(
            submit,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
