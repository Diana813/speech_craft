import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/presentation/app/pages/welcome_page/widgets/drop_down_button.dart';

void main() {
  testWidgets('DropDownButton renders correctly', (WidgetTester tester) async {
    final List<String> elements = ['Option 1', 'Option 2', 'Option 3'];
    String dropdownValue = elements.first;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DropDownButton(
            elements: elements,
            dropdownValue: dropdownValue,
            onChanged: (value) {
              dropdownValue = value;
            },
          ),
        ),
      ),
    );

    final dropDownButtonFinder = find.byType(DropDownButton);
    expect(dropDownButtonFinder, findsOneWidget);
    expect(find.text(dropdownValue), findsOneWidget);

    await tester.tap(dropDownButtonFinder);
    await tester.pumpAndSettle();

    final dropdownItem = find.text('Option 2').last;

    await tester.tap(dropdownItem);
    await tester.pumpAndSettle();

    expect(dropdownValue, 'Option 2');
  });
}
