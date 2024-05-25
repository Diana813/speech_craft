import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/learning_fragment.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/learning_page_small.dart';

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

        expect(find.byType(LearningFragment), findsOneWidget);
        expect(find.byWidgetPredicate((widget) => widget is LearningFragment && widget.videoId == videoId), findsOneWidget);
      },
    );
  });
}