import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/icon_button.dart';

void main() {
  testWidgets('AppIconButton onPressed callback is called when pressed', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppIconButton(
            child: const Icon(Icons.add),
            onPressed: () {
              pressed = true;
            },
            backgroundColorDefault: Colors.blue,
            backgroundColorPressed: Colors.green,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(IconButton));
    await tester.pump();

    expect(pressed, true);
  });

  testWidgets('AppIconButton applies correct theme styling', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          primaryColorDark: Colors.green.shade700,
          textTheme: const TextTheme(),
        ),
        home: Scaffold(
          body: AppIconButton(
            onPressed: () {},
            backgroundColorDefault: Colors.blue,
            backgroundColorPressed: Colors.green,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(IconButton));
    await tester.pump();
    final button = tester.widget<IconButton>(find.byType(IconButton));
    expect(button.style?.backgroundColor!.resolve({MaterialState.pressed}), Colors.green);
  });
}