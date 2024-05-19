import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/presentation/app/pages/learning/learning_screen.dart';
import 'package:speech_craft/presentation/app/pages/learning/widgets/lesson_sceen/learning_page_small.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('LearningPageSmall', () {
    testWidgets(
      'displays LearningScreen with correct videoId',
          (WidgetTester tester) async {
        const videoId = '456';

        await tester.pumpWidget(const MaterialApp(
          home: LearningPageSmall(videoId: videoId),
        ));

        expect(find.byType(LearningScreen), findsOneWidget);
        expect(find.byWidgetPredicate((widget) => widget is LearningScreen && widget.videoId == videoId), findsOneWidget);
      },
    );
  });
}