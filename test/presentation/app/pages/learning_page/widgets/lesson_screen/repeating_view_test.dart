import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/repeating_view.dart';
import 'package:speech_craft/presentation/common/theme.dart';

void main() {
  testWidgets('RepeatingView renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RepeatingView(),
        ),
      ),
    );

    expect(find.text(repeat), findsOneWidget);

    final jumpingDotsFinder = find.byType(JumpingDots);
    expect(jumpingDotsFinder, findsOneWidget);
    final jumpingDots = tester.widget<JumpingDots>(jumpingDotsFinder);
    expect(jumpingDots.color, AppTheme.tale.shade700);
    expect(jumpingDots.radius, 15);

    final submitButtonFinder = find.text(submit);
    expect(submitButtonFinder, findsOneWidget);
    final submitButton = tester.widget<Text>(submitButtonFinder);
    expect(submitButton.style, Theme.of(tester.element(submitButtonFinder)).textTheme.labelMedium);
  });
}