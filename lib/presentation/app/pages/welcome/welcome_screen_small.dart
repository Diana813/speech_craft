import 'package:flutter/material.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/filter_buttons.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/search_field.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/welcome_text.dart';

class WelcomeScreenSmall extends StatelessWidget {
  const WelcomeScreenSmall(
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
