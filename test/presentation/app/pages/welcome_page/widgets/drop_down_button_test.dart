import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/presentation/app/pages/welcome_page/widgets/drop_down_button.dart';

void main() {
  testWidgets('AutocompleteField displays correctly and responds to user input', (WidgetTester tester) async {
    final List<String> testElements = ['Apple', 'Banana', 'Cherry'];
    String selectedOption = '';

    void onChanged(String value) {
      selectedOption = value;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AutocompleteField(
            elements: testElements,
            onChanged: onChanged,
            labelText: 'Select a fruit',
          ),
        ),
      ),
    );

    expect(find.text('Select a fruit'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Ap');
    await tester.pumpAndSettle();

    expect(find.text('Apple'), findsOneWidget);
    expect(find.text('Banana'), findsNothing);
    expect(find.text('Cherry'), findsNothing);

    await tester.tap(find.text('Apple'));
    await tester.pumpAndSettle();

    expect(selectedOption, 'Apple');
  });
}
