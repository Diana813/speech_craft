import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/domain/entities/language_entity.dart';
import 'package:speech_craft/domain/entities/region_code_entity.dart';
import 'package:speech_craft/presentation/app/pages/welcome_page/widgets/filter_buttons.dart';
import 'package:speech_craft/presentation/app/pages/welcome_page/widgets/search_field.dart';
import 'package:speech_craft/presentation/app/pages/welcome_page/widgets/welcome_screen_small.dart';

void main() {
  testWidgets('WelcomeScreenSmall renders correctly',
      (WidgetTester tester) async {
    final List<RegionCodeEntity> countries = [
      const RegionCodeEntity(country: 'USA', code: 'US'),
      const RegionCodeEntity(country: 'Spain', code: 'ES'),
    ];
    final List<LanguageEntity> languages = [
      const LanguageEntity(name: 'English', code: 'en'),
      const LanguageEntity(name: 'Spanish', code: 'es'),
    ];

    String submittedSearchPhrase = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WelcomeScreenSmall(
            countries: countries,
            languages: languages,
            onCountryChanged: (value) {
            },
            onLanguageChanged: (value) {
            },
            onSearchFrazeSubmitted: (value) {
              submittedSearchPhrase = value;
            },
          ),
        ),
      ),
    );

    expect(find.byType(WelcomeScreenSmall), findsOneWidget);
    expect(find.byType(FilterButtons), findsOneWidget);
    expect(find.byType(SearchField), findsOneWidget);

    await tester.enterText(find.byType(SearchField), 'Test search query');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(submittedSearchPhrase, 'Test search query');
  });
}
