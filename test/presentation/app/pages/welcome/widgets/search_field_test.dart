import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/search_field.dart';

void main() {
  testWidgets('SearchField renders correctly', (WidgetTester tester) async {
    String submittedValue = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchField(
            onSubmitted: (value) {
              submittedValue = value;
            },
          ),
        ),
      ),
    );

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(searchFieldLabelText), findsOneWidget);
    expect(find.byIcon(Icons.youtube_searched_for_rounded), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Test search query');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(submittedValue, 'Test search query');
  });
}