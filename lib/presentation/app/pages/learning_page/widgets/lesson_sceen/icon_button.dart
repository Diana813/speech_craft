import 'package:flutter/material.dart';
import 'package:speech_craft/presentation/common/theme.dart';

class AppIconButton extends StatelessWidget {
  final Icon child;
  final VoidCallback onPressed;
  final Color backgroundColorDefault;
  final Color backgroundColorPressed;

  const AppIconButton(
      {super.key,
        required this.child,
        required this.onPressed,
        required this.backgroundColorDefault,
        required this.backgroundColorPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 20)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
        shadowColor: WidgetStateProperty.all<Color>(AppTheme.lightTheme.shadowColor),
        elevation: WidgetStateProperty.all(1.0),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return backgroundColorPressed;
              }
              return backgroundColorDefault;
            }),
      ),
      onPressed: onPressed,
      icon: child,
    );
  }
}