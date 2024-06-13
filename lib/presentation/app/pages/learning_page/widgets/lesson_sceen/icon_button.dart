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
        minimumSize: MaterialStateProperty.all<Size>(const Size(40, 40)),
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 20)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
        shadowColor: MaterialStateProperty.all<Color>(AppTheme.lightTheme.shadowColor),
        elevation: MaterialStateProperty.all(1.0),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
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