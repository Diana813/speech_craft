import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/welcome_text.dart';

void main() {
  testWidgets('WelcomeText renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WelcomeText(),
        ),
      ),
    );

    expect(find.byType(WelcomeText), findsOneWidget);

    expect(find.text(welcomeInTalkTrainer), findsOneWidget);
    expect(find.text(instruction), findsOneWidget);
  });
}
