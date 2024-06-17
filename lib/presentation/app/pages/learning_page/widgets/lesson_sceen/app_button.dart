import 'package:flutter/material.dart';

import '../../../../../common/theme.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const AppButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              )),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return Theme.of(context).primaryColorDark;
                }
                return AppTheme.lightTale;
              }),
          textStyle: WidgetStateProperty.resolveWith<TextStyle>(
                  (Set<WidgetState> states) {
                return Theme.of(context).textTheme.bodyMedium!;
              }),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
