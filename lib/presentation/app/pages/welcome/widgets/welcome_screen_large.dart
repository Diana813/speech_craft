import 'package:flutter/material.dart';
import 'package:speech_craft/domain/entities/language_entity.dart';
import 'package:speech_craft/domain/entities/region_code_entity.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/filter_buttons.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/search_field.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/welcome_text.dart';

class WelcomeScreenLarge extends StatelessWidget {
  const WelcomeScreenLarge(
      {super.key,
      required this.countries,
      required this.languages,
      required this.countryDropdownValue,
      required this.languageDropdownValue,
      required this.onCountryChanged,
      required this.onLanguageChanged,
      required this.onSearchFrazeSubmitted});

  final List<RegionCodeEntity> countries;
  final List<LanguageEntity> languages;

  final String countryDropdownValue;
  final String languageDropdownValue;

  final Function onCountryChanged;
  final Function onLanguageChanged;
  final Function onSearchFrazeSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const WelcomeText(),
                Column(
                  children: [
                    FilterButtons(
                      countries: countries.map((it) => it.country).toList(),
                      countryDropdownValue: countryDropdownValue,
                      languages: languages.map((it) => it.name).toList(),
                      languageDropdownValue: languageDropdownValue,
                      onCountryChanged: onCountryChanged,
                      onLanguageChanged: onLanguageChanged,
                    ),
                    SearchField(
                      onSubmitted: (value) => onSearchFrazeSubmitted(value),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(flex: 1, child: Container()),
      ],
    );
  }
}
