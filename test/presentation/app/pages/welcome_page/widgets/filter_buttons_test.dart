import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/presentation/app/pages/welcome_page/widgets/drop_down_button.dart';
import 'package:speech_craft/presentation/app/pages/welcome_page/widgets/filter_buttons.dart';

void main() {
  testWidgets('FilterButtons renders and responds to user input', (WidgetTester tester) async {
    final List<String> testCountries = ['Poland', 'Germany', 'France'];
    final List<String> testLanguages = ['English', 'French', 'German'];
    String selectedCountry = '';
    String selectedLanguage = '';

    void onCountryChanged(String value) {
      selectedCountry = value;
    }

    void onLanguageChanged(String value) {
      selectedLanguage = value;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterButtons(
            countries: testCountries,
            languages: testLanguages,
            onCountryChanged: onCountryChanged,
            onLanguageChanged: onLanguageChanged,
          ),
        ),
      ),
    );

    expect(find.byType(AutocompleteField), findsNWidgets(2));
    expect(find.text(country), findsOneWidget);
    expect(find.text(language), findsOneWidget);

    await tester.enterText(find.widgetWithText(AutocompleteField, country), 'Pol');
    await tester.pumpAndSettle();

    expect(find.text('Poland'), findsOneWidget);

    await tester.tap(find.text('Poland'));
    await tester.pumpAndSettle();
    expect(selectedCountry, 'Poland');

    await tester.enterText(find.widgetWithText(AutocompleteField, language), 'Fr');
    await tester.pumpAndSettle();

    expect(find.text('French'), findsOneWidget);

    await tester.tap(find.text('French'));
    await tester.pumpAndSettle();
    expect(selectedLanguage, 'French');
  });
}