import 'package:flutter/material.dart';
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

  final List<String> countries;
  final List<String> languages;

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
                      countries: countries,
                      countryDropdownValue: countryDropdownValue,
                      languages: languages,
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
