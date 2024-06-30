import 'package:flutter/material.dart';

import '../../../../../common/strings.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          welcomeInTalkTrainer,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Text(
          instruction,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
