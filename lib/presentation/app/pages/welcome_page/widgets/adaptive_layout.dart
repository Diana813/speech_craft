import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:speech_craft/domain/entities/region_code_entity.dart';

import '../../../../../domain/entities/language_entity.dart';
import 'welcome_screen_large.dart';
import 'welcome_screen_small.dart';

class SearchAdaptiveLayout extends StatelessWidget {
  final List<RegionCodeEntity> countries;
  final List<LanguageEntity> languages;
  final String countryDropdownValue;
  final String languageDropdownValue;
  final Function onCountryChanged;
  final Function onLanguageChanged;
  final Function onSearchFrazeSubmitted;

  const SearchAdaptiveLayout(
      {super.key,
      required this.countries,
      required this.languages,
      required this.countryDropdownValue,
      required this.languageDropdownValue,
      required this.onCountryChanged,
      required this.onLanguageChanged,
      required this.onSearchFrazeSubmitted});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdaptiveLayout(
        body: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.smallAndUp: SlotLayout.from(
              key: const Key('primary-body'),
              builder: (context) => WelcomeScreenSmall(
                countries: countries,
                languages: languages,
                countryDropdownValue: countryDropdownValue,
                languageDropdownValue: languageDropdownValue,
                onCountryChanged: (value) => onCountryChanged(value),
                onLanguageChanged: (value) => onLanguageChanged(value),
                onSearchFrazeSubmitted: (value) =>
                    onSearchFrazeSubmitted(value),
              ),
            ),
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('secondary-body'),
              builder: (context) => WelcomeScreenLarge(
                countries: countries,
                languages: languages,
                countryDropdownValue: countryDropdownValue,
                languageDropdownValue: languageDropdownValue,
                onCountryChanged: (value) => onCountryChanged(value),
                onLanguageChanged: (value) => onLanguageChanged(value),
                onSearchFrazeSubmitted: (value) =>
                    onSearchFrazeSubmitted(value),
              ),
            ),
          },
        ),
      ),
    );
  }
}
