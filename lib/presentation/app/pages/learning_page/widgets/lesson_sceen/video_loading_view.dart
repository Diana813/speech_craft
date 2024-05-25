import 'package:flutter/material.dart';

import '../../../../../../common/strings.dart';

class VideoLoadingView extends StatelessWidget {
  const VideoLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Container(
              color: Colors.black87,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
          ),
        ),
        const Expanded(
          flex: 3,
          child: Center(
            child: Text(waitForVideoMessage),
          ),
        ),
      ],
    );
  }
}
