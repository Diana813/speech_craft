import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

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
          child: JumpingDots(
              color: AppTheme.tale.shade700, radius: 15),
        ),
        AppButton(
          onPressed: (){},
          child: Text(
            submit,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
