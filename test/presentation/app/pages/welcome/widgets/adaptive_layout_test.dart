import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/domain/entities/language_entity.dart';
import 'package:speech_craft/domain/entities/region_code_entity.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/adaptive_layout.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/welcome_screen_large.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/welcome_screen_small.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('SearchAdaptiveLayout', () {
    late List<RegionCodeEntity> countries;
    late List<LanguageEntity> languages;
    late String countryDropdownValue;
    late String languageDropdownValue;
    late Function onCountryChanged;
    late Function onLanguageChanged;
    late Function onSearchFrazeSubmitted;

    setUp(() {
      countries = [
        const RegionCodeEntity(country: 'United States', code: 'US'),
        const RegionCodeEntity(country: 'Spain', code: 'ES')
      ];
      languages = [
        const LanguageEntity(code: 'en', name: 'English'),
        const LanguageEntity(code: 'es', name: 'Spanish')
      ];
      countryDropdownValue = 'United States';
      languageDropdownValue = 'English';
      onCountryChanged = () {};
      onLanguageChanged = () {};
      onSearchFrazeSubmitted = () {};
    });

    Widget buildSearchAdaptiveLayout(Size screenSize) {
      MediaQueryData data = MediaQueryData(size: screenSize);
      return MediaQuery(
        data: data,
        child: SearchAdaptiveLayout(
          countries: countries,
          languages: languages,
          countryDropdownValue: countryDropdownValue,
          languageDropdownValue: languageDropdownValue,
          onCountryChanged: onCountryChanged,
          onLanguageChanged: onLanguageChanged,
          onSearchFrazeSubmitted: onSearchFrazeSubmitted,
        ),
      );
    }

    testWidgets('should build SmallWelcomeScreen for small breakpoint',
            (WidgetTester tester) async {
          // given
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: buildSearchAdaptiveLayout(const Size(300, 600)),
              ),
            ),
          );

          // when
          final smallWelcomeScreen = find.byType(WelcomeScreenSmall);

          // then
          expect(smallWelcomeScreen, findsOneWidget);
        });

    testWidgets(
        'should build LargeWelcomeScreen for medium and larger breakpoints',
            (WidgetTester tester) async {
          // given
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: buildSearchAdaptiveLayout(const Size(800, 600)),
              ),
            ),
          );

          // when
          final largeWelcomeScreen = find.byType(WelcomeScreenLarge);

          // then
          expect(largeWelcomeScreen, findsOneWidget);
        });
  });
}