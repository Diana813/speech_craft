import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/app_button.dart';
import 'package:speech_craft/presentation/common/theme.dart';


void main() {
  testWidgets('AppButton renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton(
            child: const Text('Test Button'),
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(
      tester.widget<ElevatedButton>(find.byType(ElevatedButton)).style?.backgroundColor?.resolve({}),
      equals(AppTheme.lightTale),
    );
  });

  testWidgets('AppButton onPressed callback is called when pressed', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton(
            child: const Text('Test Button'),
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(pressed, true);
  });

  testWidgets('AppButton renders custom child widget correctly', (WidgetTester tester) async {
    final customChild = Container(
      width: 200,
      height: 50,
      color: Colors.blue,
      child: const Center(
        child: Text('Custom Child'),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton(
            child: customChild,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.byWidget(customChild), findsOneWidget);
  });

  testWidgets('AppButton applies correct theme styling', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          primaryColorDark: Colors.green.shade700,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 18),
          ),
        ),
        home: Scaffold(
          body: AppButton(
            child: const Text('Themed Button'),
            onPressed: () {},
          ),
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.style?.backgroundColor?.resolve({MaterialState.pressed}), Colors.green.shade700);
  });
}
