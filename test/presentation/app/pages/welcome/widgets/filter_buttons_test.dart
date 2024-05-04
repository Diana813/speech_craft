import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/filter_buttons.dart';

void main() {
  testWidgets('FilterButtons renders correctly', (WidgetTester tester) async {
    final List<String> countries = ['USA', 'Canada', 'UK'];
    final List<String> languages = ['English', 'Spanish', 'French'];
    String countryDropdownValue = countries.first;
    String languageDropdownValue = languages.first;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterButtons(
            countries: countries,
            languages: languages,
            countryDropdownValue: countryDropdownValue,
            languageDropdownValue: languageDropdownValue,
            onCountryChanged: (value) {
              countryDropdownValue = value;
            },
            onLanguageChanged: (value) {
              languageDropdownValue = value;
            },
          ),
        ),
      ),
    );

    final countryDropdown = find.text('USA');
    expect(countryDropdown, findsOneWidget);

    final languageDropdown = find.text('English');
    expect(languageDropdown, findsOneWidget);

    await tester.tap(countryDropdown);
    await tester.pumpAndSettle();

    await tester.tap(find.text('USA').last);
    await tester.pumpAndSettle();
    expect(countryDropdownValue, 'USA');

    await tester.tap(languageDropdown);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Spanish').last);
    await tester.pumpAndSettle();
    expect(languageDropdownValue, 'Spanish');
  });
}